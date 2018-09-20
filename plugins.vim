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
Plug 'SirVer/ultisnips'
Plug 'morhetz/gruvbox'
Plug 'tobyS/vmustache'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'joshdick/onedark.vim'
Plug 'shawncplus/phpcomplete.vim'

call plug#end()
filetype plugin indent on    " required

