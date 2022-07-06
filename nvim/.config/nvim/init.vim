set nocompatible            " disable compatibility vi
set showmatch               " show matching parenthesis, etc.
set ignorecase              " case insensitive on
set hlsearch                " highlight search on
set incsearch               " incremental search on
set tabstop=4               " width in spaces of a tab
set softtabstop=4           " multiple spaces are interpreted as tabstops
set expandtab               " tabs are replaced by =tabstop= number of spaces
set shiftwidth=4            " number of spaces for autoindents
set autoindent              " new lines are indented as the line before
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=79                   " set ruler to help with code width
filetype plugin indent on   " auto-indenting according to file type
syntax on                   " syntax highlighting on
set clipboard=unnamedplus   " use OS clipboard
set cursorline              " highlight line the cursor is currently on
set cursorcolumn            " highlight the column the cursor is currently on
set ttyfast                 " Speed up scrolling in Vim
set vb t_vb=                " Disable beep / flash
" vim-plug
" [[https://github.com/junegunn/vim-plug][GitHub - junegunn/vim-plug: Minimalist Vim Plugin Manager]]
" installation:
" sh -c 'curl -fLo
" "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim
" --create-dirs \
"         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
" curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" The default plugin directory will be as follows:
" stdpath('data') . '/plugged'
" :PlugInstall to install plugins

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:airline_powerline_fonts = 1

set background=dark
let g:gruvbox_contrast_dark='medium'
colorscheme gruvbox

" Auto start NERD tree when opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

" " Auto start NERD tree if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif

" Let quit work as expected if after entering :q the only window left open is NERD Tree itself
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" in multi-window situation, only highlight cursor line/column in active
" window
:hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
autocmd WinEnter * set local cursorline
autocmd WinEnter * set local cursorcolumn
autocmd WinLeave * set local nocursorline
autocmd WinLeave * set local nocursorcolumn
