set tabstop=4
set expandtab
set number relativenumber
set autoindent

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'dracula/vim', { 'name': 'dracula' }

call vundle#end()
filetype plugin indent on

let g:airline_theme='deus'
