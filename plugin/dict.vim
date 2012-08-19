" vim-dict - The Dict client for Vim
" Maintainer:   Szymon Wrozynski
" Version:      1.1.0
"
" Installation:
" Place in ~/.vim/plugin/dict.vim or in case of Pathogen:
"
"     cd ~/.vim/bundle
"     git clone https://github.com/szw/vim-dict.git
"
" License:
" Copyright (c) 2012 Szymon Wrozynski. Distributed under the same terms as Vim itself.
" See :help license
"
" Usage:
" https://github.com/szw/vim-dict/blob/master/README.md
"

if exists("g:loaded_dict") || &cp || v:version < 700
    finish
endif

let g:loaded_dict = 1

if !exists("g:dict_hosts")
    let g:dict_hosts = [["dict.org", ["all"]]]
endif

if !exists("g:dict_leave_pw")
    let g:dict_leave_pw = 0
endif

command! -nargs=? Dict :call s:dict("<args>")
command! DictShowDb :call s:dict_show_db()
command! -range DictSelection :call s:dict(getline("'<")[getpos("'<")[2] - 1:getpos("'>")[2] - 1])

fun! s:dict(...)
    let word = a:0 > 0 ? a:1 : ""

    if empty(word)
        let word = expand("<cword>")
    endif

    let word = "\"" . substitute(tolower(word), '^\s*\(.\{-}\)\s*$', '\1', '') . "\""

    silent! exe "noautocmd botright pedit Dict"
    noautocmd wincmd P
    set buftype=nofile
    for host in g:dict_hosts
        for db in host[1]
            silent! exe "noautocmd r! curl -s dict://" . host[0] . "/d:" . word . ":" . db
        endfor
    endfor
    silent! exe "%s///g"
    silent! exe "%s/^151 //g"
    silent! exe "%s/^153 //g"
    silent! exe "%s/^\.$/--------------------------------------------------------------------------------/g"
    silent! exe "g/^[0-9][0-9][0-9]/d_"
    silent! exe "1d_"

    if line("$") == 1
        silent! exe "normal a Nothing found for " . word
    endif

    if g:dict_leave_pw
        noautocmd wincmd p
    endif
endfun

fun! s:dict_show_db()
    silent! exe "noautocmd botright pedit Dict:show:db"
    noautocmd wincmd P
    set buftype=nofile
    for host in g:dict_hosts
        silent! exe "normal I--------------------------------------------------------------------------------\r"
        silent! exe "normal IServer: " . host[0] . "\r"
        silent! exe "normal I--------------------------------------------------------------------------------\r"
        silent! exe "noautocmd r! curl -s dict://" . host[0] . "/show:db"
    endfor
    silent! exe "%s///g"
    silent! exe "%s/^110 //g"
    silent! exe "%s/^\.$//g"
    silent! exe "g/^\s*[0-9][0-9][0-9]/d_"
    silent! exe "g/^$/d_"
    silent! exe "0"

    if g:dict_leave_pw
        noautocmd wincmd p
    endif
endfun
