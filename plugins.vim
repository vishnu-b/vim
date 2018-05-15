set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'pangloss/vim-javascript'
Plug 'StanAngeloff/php.vim'
Plug 'tpope/vim-vinegar'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'tobyS/pdv'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'tobyS/vmustache'
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()
filetype plugin indent on    " required



