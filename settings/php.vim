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
let g:pdv_template_dir = $HOME ."/.vim/plugged/pdv/templates_snip"
autocmd FileType php nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>

"phpunit
function! RunPHPUnitTestForFunction()
    let result = system("./vendor/bin/phpunit --filter " . cfi#get_func_name() . " " . bufname("%"))
    echo result
endfunction
function! RunPHPUnitTestForClass()
    let result = system("./vendor/bin/phpunit " . bufname("%"))
    echo result
endfunction
"autocmd FileType php nnoremap <Leader>tt :exe !phpunit --filter cfi#get_func_name()
autocmd FileType php nnoremap <Leader>tf :call RunPHPUnitTestForFunction()<CR>
autocmd FileType php nnoremap <Leader>tc :call RunPHPUnitTestForClass()<CR>
