-- XMonad
import XMonad

-- XMonad.Actions
import XMonad.Actions.CycleWS
import XMonad.Actions.UpdatePointer

-- XMonad.Hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers (doCenterFloat)

-- XMonad.Layout
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.Grid
import XMonad.Layout.LimitWindows (limitWindows)
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed (renamed, Rename(Replace))
import XMonad.Layout.ResizableTile
import XMonad.Layout.Spacing
import XMonad.Layout.ThreeColumns

-- XMonad.Util
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce
import XMonad.Util.Run

-- Data
import Data.Monoid
import Data.Maybe (isJust)

-- System
import System.IO (hPutStrLn)
import System.Exit

-- Qualified imports
import qualified XMonad.StackSet as W
import qualified Data.Map        as M

-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
-- msTerminal      = "urxvtc"  -- start client, see MySartupHook for daemon
-- msTerminal      = "st"  
-- msTerminal      = "konsole"  
msTerminal      = "gnome-terminal"  

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels.
--
msBorderWidth   = 3

-- msModMask       = modlMask  -- left alt
-- msModMask       = mod3Mask  -- right alt
msModMask       = mod4Mask  -- super

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
msWorkspaces    = ["1","2","3","4","5","6","7","8","9"]

-- Border colors for unfocused and focused windows, respectively.
--
-- DRACULA
-- msColorBorderInactive   = "#282a36"
-- msColorBorderActive     = "#bd93f9"
-- msColorBackgroundTrayer = "#282A36"

-- NORD COLOR SCHEME
msColorBorderInactive   = "#D08770"
msColorBorderActive     = "#A3BE8C"
msColorBackgroundTrayer = "#3B4252"
msColorWorkspaceActive  = "#81A1C1"

-- number of windows on workspace
windowCount :: X (Maybe String)
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset  

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
-- https://hackage.haskell.org/package/xmonad-contrib-0.16/docs/XMonad-Util-EZConfig.html
myKeys = [
    ("M-S-<Return>", spawn msTerminal)  -- launch a terminal
  , ("M-p"         , spawn "rofi -show drun")  -- launch rofi, _P_rograms
  , ("M-r"         , spawn "rofi -show run")  -- launch rofi, _R_un scripts
  , ("M-s"         , spawn "rofi -show keys")  -- launch rofi, show rofi _S_hortcuts/keybindings
  , ("M-S-l"       , spawn "/home/matthias/bin/lock_screen.sh")  -- launch xscreensaver
  , ("M-S-c"       , kill)  -- close focused window
  , ("M-<Space>"   , sendMessage NextLayout)  -- Rotate through the available layout algorithms
  , ("M-n"         , refresh)  -- Resize viewed windows to the correct size
  , ("M-<Tab>"     , windows W.focusDown)  -- Move focus to the next window
  , ("M-j"         , windows W.focusDown)  -- Move focus to the next window
  , ("M-k"         , windows W.focusUp  )  -- Move focus to the previous window
  , ("M-m"         , windows W.focusMaster  )  -- Move focus to the master window
  , ("M-<Return>"  , windows W.swapMaster)  -- Swap the focused window and the master window
  , ("M-S-j"       , windows W.swapDown  )  -- Swap the focused window with the next window
  , ("M-S-k"       , windows W.swapUp    )  -- Swap the focused window with the previous window
  , ("M-h"         , sendMessage Shrink)  -- Shrink the master area
  , ("M-l"         , sendMessage Expand)  -- Expand the master area
  , ("M-t"         , withFocused $ windows .W.sink)  -- Push window back into tiling
  , ("M-,"         , sendMessage (IncMasterN 1))  -- Increment the number of windows in the master area
  , ("M-."         , sendMessage (IncMasterN (-1)))  -- Deincrement the number of windows in the master area
  , ("M-b"         , sendMessage ToggleStruts)  -- Toggle the status bar gap
  , ("M-S-q"       , io (exitWith ExitSuccess))  -- Quit xmonad
  , ("M-q"         , spawn "xmonad --recompile; xmonad --restart")   -- Restart xmonad
  , ("C-M1-<Up>"   , prevWS)  -- Shifts focused window to next ws
  , ("C-M1-<Down>" , nextWS)  -- Shifts focused window to prev ws
  , ("M-e"         , spawn "nautilus ~")  -- Start Gnome Files in home directory
  -- FN KEYS
  , ("<XF86MonBrightnessUp>"   , spawn "brightnessctl -d \"amdgpu_bl0\" set +5")
  , ("<XF86MonBrightnessDown>" , spawn "brightnessctl -d \"amdgpu_bl0\" set 5-")
    ]
    -- ++ [(("M-" ++ k), windows $ i) | (i, k) <- zip(XMonad.workspaces msWorkspaces)] 
    -- ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    -- [((m .|. modm, k), windows $ f i)
    --     | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
    --    , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    -- ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    -- [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
    --     | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
    --     , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

------------------------------------------------------------------------
-- Layouts:
-- https://betweentwocommits.com/blog/xmonad-layouts-guide
--
msLayout = avoidStruts ( tall ||| full ||| mtll ||| col3 ||| grid )
  where
     -- full - one window uses all of screen, no border
     full = renamed [Replace "Full"] 
          $ limitWindows 1
          $ noBorders (Full)

     -- tall - master/stack layout
     tall = renamed [Replace "Tall"] 
          $ spacingRaw True (Border 5 0 5 0) True (Border 0 5 0 5) True 
          $ ResizableTall 1 (5/100) (55/100) []

     -- mtll - the tall layout rotated 90°
     mtll = Mirror tall

     -- col3 - three column layout
     col3 = renamed [Replace "Col3"]
          $ limitWindows 3
          $ spacingRaw True (Border 2 2 2 2) True (Border 2 2 2 2) True
          $ ThreeCol 1 (3/100) (1/3)

     -- grid - all windows distributed as evenly as possible
     grid = renamed [Replace "Grid"]
          $ limitWindows 12
          $ spacingRaw True (Border 2 2 2 2) True (Border 2 2 2 2) True
          $ GridRatio (4/3) 

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 55/100

     -- Percent of screen to increment by when resizing panes
     delta   = 5/100

------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
msManageHook = composeAll
    [ className =? "Gimp"            --> doFloat
    , className =? "pcloud"          --> doCenterFloat
    , className =? "cloud-backup-ui" --> doCenterFloat
    , resource  =? "desktop_window"  --> doIgnore
    , resource  =? "kdesktop"        --> doIgnore ]

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
msEventHook = mempty

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
-- msLogHook = return ()
-- msLogHook :: X ()
-- msLogHook = fadeInactiveLogHook fadeAmount
--     where fadeAmount = 1.0

-- DRACULA
-- msLogHook dest = dynamicLogWithPP xmobarPP { 
--     ppOutput          = hPutStrLn dest
--   , ppCurrent         = xmobarColor "#f8f8f2,#6272a4" "" . wrap " " " "  -- Visible&Focussed workspace in xmobar
--   , ppVisible         = xmobarColor "#50fa7b,#93a1a1" "" . wrap " " ""   -- Visible but unfocussed workspace
--   , ppHidden          = xmobarColor msColorWorkspaceActive "" . wrap "^" ""           -- Hidden workspaces, 1+ windows
--   , ppHiddenNoWindows = xmobarColor "#f8f8f2" "" . wrap " " ""           -- Hidden workspaces, no windows
--   , ppTitle           = xmobarColor "#ff79c6" "" . wrap "<fc=#f8f8f2><fn=1>\xF120</fn></fc> " "" . shorten 65    -- Title of active window
--   , ppWsSep           = xmobarColor "#282a36" "" " "                     -- Separator between workspaces
--   , ppSep             = xmobarColor "#f8f8f2" "" "  ::  "                -- Separator between sections 
--   , ppUrgent          = xmobarColor "#ff5555" "" . wrap "!" "!"          -- Urgent workspace
--   , ppExtras          = [windowCount]                                    -- # of windows in focussed workspace
--   , ppOrder           = \(ws:l:t:ex) -> [ws,l]++ex++[t]
-- }

-- NORD
msLogHook dest = dynamicLogWithPP xmobarPP { 
    ppOutput          = hPutStrLn dest
  , ppCurrent         = xmobarColor "#d8dee9,#5e81ac" "" . wrap " " " "  -- Visible&Focussed workspace in xmobar
  , ppVisible         = xmobarColor "#88c0d0" "" . wrap " " ""   -- Visible but unfocussed workspace
  , ppHidden          = xmobarColor "#88c0d0" "" . wrap "^" ""           -- Hidden workspaces, 1+ windows
  , ppHiddenNoWindows = xmobarColor "#d8dee9" "" . wrap " " ""           -- Hidden workspaces, no windows
  , ppTitle           = xmobarColor "#88c0d0" "" . wrap "<fc=#8fbcbb><fn=1>\xF120</fn></fc> " "" . shorten 65    -- Title of active window
  , ppWsSep           = xmobarColor "#d8dee9" "" " "                     -- Separator between workspaces
  , ppSep             = xmobarColor "#d8dee9" "" "  ::  "                -- Separator between sections 
  , ppUrgent          = xmobarColor "#d08770" "" . wrap "!" "!"          -- Urgent workspace
  , ppExtras          = [windowCount]                                    -- # of windows in focussed workspace
  , ppOrder           = \(ws:l:t:ex) -> [ws,l]++ex++[t]
}
-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
msStartupHook = do
    -- start compositor
    spawnOnce "compton &"
    spawnOnce "volumeicon &"
    spawnOnce "feh --bg-center ~/.imgs/wallpaper_tuxedo_nord.png"
    spawnOnce "trayer --edge top --align right --iconspacing 5 \
               \ --widthtype percent --width 10 \
               \ --heighttype pixel --height 21 \
               \ --SetDockType true --SetPartialStrut true \
               \ --transparent true --alpha 0 \
               \ --tint 0xFF3B4252 \
               \ &"

               -- DRACULA
               -- \ --tint 0xFF282A36 \
               -- NORD
               -- \ --tint 0xFF3B4252 \
    spawnOnce "nm-applet &"
    -- start urxvt terminal daemon
    -- spawnOnce "urxvtd &" 
    spawnOnce "dropbox start -i &"
    spawnOnce "/home/matthias/AppImages/pcloud_60c9f3ef6145104afe72c51624811e97 &"
    spawnOnce "synology-cloud-station-backup &"
    spawnOnce "/usr/bin/tuxedo-control-center --tray &"

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
main = do
    -- xmproc <- spawnPipe "xmobar ~/.config/xmobar/xmobarrc_dracula"
    xmproc <- spawnPipe "xmobar ~/.config/xmobar/xmobarrc_nord"
    xmonad $ docks $ def {
        manageHook         = msManageHook
      , startupHook        = msStartupHook
      , layoutHook         = msLayout
      , handleEventHook    = msEventHook 
      , workspaces         = msWorkspaces
      , borderWidth        = msBorderWidth
      , terminal           = msTerminal
      , modMask            = msModMask
      , normalBorderColor  = msColorBorderInactive
      , focusedBorderColor = msColorBorderActive
      , logHook            = msLogHook xmproc
      , focusFollowsMouse  = False
    } `additionalKeysP` myKeys

