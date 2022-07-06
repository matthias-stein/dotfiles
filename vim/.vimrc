set tabstop=4
set expandtab
set number relativenumber
set autoindent
" set cmdheight=2

" VUNDLE PLUGINMANAGER
" to install
"     wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
"     wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
"     mv PowerlineSymbols.otf ~/.local/share/fonts/
"     fc-cache -vf ~/.local/share/fonts/
"     mkdir ~/.config/fontconfig/conf.d/
"     mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
"     git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" after adding new plugin:
"     :PluginInstall
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" MODELINE
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" COLOR SCHEMES
" Plugin 'dracula/vim', { 'name': 'dracula' }
" Plugin 'arcticicestudio/nord-vim'
Plugin 'morhetz/gruvbox'

" UTILITIES
Plugin 'ap/vim-css-color'

call vundle#end()
filetype plugin indent on

let g:airline_powerline_fonts = 1
" let g:airline_theme='dracula'

" NORD COLOR SCHEME
" colorscheme nord

" GRUVBOX COLOR SCHEME
set background=dark
let g:gruvbox_contrast_dark='medium'
colorscheme gruvbox
