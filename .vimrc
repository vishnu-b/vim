"Source plugin management file
so ~/.vim/plugins.vim

"Looks
filetype on
syntax on
colorscheme gruvbox
set number
set relativenumber
set noshowmode

set guifont=Fira\ Code\ Normal\ 9
set background=dark     "Setting dark mode

" Always show the status line
set laststatus=2

let mapleader=","
let g:mapleader=","
set hidden
set history=500


" move to beginning/end of line
nnoremap B ^
nnoremap E $

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Set auto read when file is changed form outside
set autoread

" Set desired autocompletion
set complete=.,w,b,u

" Fast saving
nmap <leader>w :w!<cr>

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Enable filetype plugins
filetype plugin on
filetype indent on

"Indentaion
set expandtab "Use spaces instead of tabs
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4

set ai "Auto indent
set si "Smart Indent
set nowrap "Don't wrap Lines
set linebreak    "Wrap lines at convenient points

" Set 7 lines to the cursor - when moving vertically using j/k
set so=5

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" Quickly access the vim rc
nmap <Leader>ev :tabedit ~/.vim/.vimrc<CR>
nmap <Leader>pl :tabedit ~/.vim/plugins.vim<CR>
nmap <Leader>e :e .<CR> " Open vinegar browser

" Legacy copy stuff
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Search
set ignorecase " Ignore case when searching
set smartcase " When searching try to be smart about cases
set hlsearch " Highlight search results
set incsearch " Makes search act like search in modern browsers
"remove th highlights on searched text
nmap <Leader><space> :nohlsearch<CR>

" Remove whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Show matching paranthesis
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

"Splits
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"Plugins

so ~/.vim/settings/php.vim
so ~/.vim/settings/fzf.vim

"Vinegar
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

"NerdTree
map <C-k><C-b> :NERDTreeToggle<CR>
let NERDTreeHijackNetrw = 0

"SuperTab
let g:SuperTabDefaultCompletionType = "<c-n>"

"Javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir = "~/.vim/plugged/ultisnips/UltiSnips"
let g:UltiSnipsEditSplit="vertical"

" Goyo
let g:goyo_width=120
let g:goyo_height="95%"
nmap <Leader>zen :Goyo<CR>

"PHP_CS_FIXER
nmap <Leader>fix :!php-cs-fixer fix --config=/home/vishnub/.vim/.php_cs '%:p'<CR>
set belloff=all

" Enable folding
set foldmethod=indent
set foldlevel=99

let g:neomake_php_phpcs_args_standard = 'PSR2'
