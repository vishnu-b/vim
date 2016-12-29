"Source plugin management file
so ~/.vim/plugins.vim
so ~/.vim/settings/folds/php.vim


"Looks
filetype on
syntax on
colorscheme base16-onedark
set guifont=Monaco:h13
set colorcolumn=80
set number
set relativenumber
set noshowmode
"set ruler
set linespace=12
set guioptions-=e
set background=dark     "Setting dark mode

let mapleader=","
let g:mapleader=","
set hidden
set history=500

set cursorline          " highlight current line

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" highlight last inserted text
nnoremap gV `[v`]

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

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

"Indentaion
filetype indent on
filetype plugin on
filetype indent plugin on
set expandtab "Use spaces instead of tabs
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4

set ai "Auto indent
set si "Smart Indent
set nowrap "Don't wrap Lines
set linebreak    "Wrap lines at convenient points

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" Cleans the ui up
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=R  "remove right-hand scroll bar
set guioptions-=l  "remove left hand scrollbar
set guioptions-=L  "remove left hand scrollbar

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

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_custom_ignore = 'node_modules\DS_STORE\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"Vinegar
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
nmap <Leader>p :CtrlP<CR>

" Set no max file limit
let g:ctrlp_max_files = 0
" Search from current directory instead of project root
let g:ctrlp_working_path_mode = 0

" buffer through the tags in the file
nmap <C-R> :CtrlPBufTag<cr>
nmap <C-E> :CtrlPMRUFiles<cr>


"SuperTab
let g:SuperTabDefaultCompletionType = "<c-n>"

"Javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

"php
function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END

function! IPhpInsertUse()
    call PhpInsertUse()
        call feedkeys('a',  'n')
    endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

" pdv
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>


" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir = "~/.vim/bundle/ultisnips/UltiSnips"
let g:UltiSnipsEditSplit="vertical"

"Python
let python_highlight_all = 1

" Folding
set foldlevelstart=1
set foldmethod=indent
set foldnestmax=10
