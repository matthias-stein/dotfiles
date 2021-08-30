set tabstop=4
set expandtab
set number relativenumber
set autoindent

" VUNDLE PLUGINMANAGER
" to install
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
Plugin 'arcticicestudio/nord-vim'

" UTILITIES
Plugin 'ap/vim-css-color'

call vundle#end()
filetype plugin indent on

let g:airline_powerline_fonts = 1
" let g:airline_theme='dracula'
colorscheme nord
