" vim-dict - The Dict client for Vim
" Maintainer:   Szymon Wrozynski
" Version:      1.0
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

if !exists("g:vim_dict_default_database")
    let g:vim_dict_default_database = "all"
endif

if !exists("g:vim_dict_leave_pw")
    let g:vim_dict_leave_pw = 0
endif

if !exists("g:vim_dict_host")
    let g:vim_dict_host = "dict://dict.org"
endif

command! -nargs=* Dict :call s:dict(g:vim_dict_default_database, "<args>")
command! -nargs=+ DictCustom :call s:dict_custom("<args>")
command! -nargs=? -range DictSelection :call s:dict_selection("<args>")

fun! s:dict(dictionary, ...)
    let word = a:0 > 0 ? a:1 : ""

    if empty(word)
        let word = expand("<cword>")
    endif

    let word = "\"" . substitute(tolower(word), '^\s*\(.\{-}\)\s*$', '\1', '') . "\""

    silent! exe "noautocmd botright pedit Dict:" . a:dictionary
    noautocmd wincmd P
    set buftype=nofile
    exe "noautocmd r! curl " . g:vim_dict_host . "/d:" . word . ":" . a:dictionary . " | grep -v ^[0-9] || :"
    silent! exe "%s///g"
    silent! exe "1,4d_"

    if line("$") == 1
        silent! exe "normal a Nothing found for " . word . " (dictionary: " . a:dictionary . ")"
    endif

    if g:vim_dict_leave_pw
        noautocmd wincmd p
    endif
endfun

fun! s:dict_custom(word_with_d)
    let lst = split(a:word_with_d, " ")
    call s:dict(lst[0], join(lst[1:], " "))
endfun

fun! s:dict_selection(dictionary)
    let dictionary = empty(a:dictionary) ? g:vim_dict_default_database : a:dictionary
    let word = getline("'<")[getpos("'<")[2] - 1:getpos("'>")[2] - 1]
    call s:dict(dictionary, word)
endfun
