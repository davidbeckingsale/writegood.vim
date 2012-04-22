"
" Testing text for the the writegood plugin, a vim plugin based on Matt Might's
" '3 shell scripts that can improve your writing'
" http://matt.might.net/articles/shell-scripts-for-passive-voice-weasel-words-duplicates/
"
" David Beckingsale 2012-04-22
"
if exists('g:loaded_writegood') || &cp
    finish
endif

let g:loaded_writegood = 1

function! s:WritegoodToggle()
    call writegood#toggle()
endfunction

function! s:WritegoodEnable()
    call writegood#enable()
endfunction

function! s:WritegoodDisable()
    call writegood#disable()
endfunction

command! -bar WritegoodToggle       call s:WritegoodToggle()
command! -bar WritegoodEnable       call s:WritegoodEnable()
command! -bar WritegoodDisable      call s:WritegoodDisable()

" Default mapping
nmap <leader>wg :WritegoodToggle<cr>
