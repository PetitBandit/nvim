function! IsolateBracket()
normal! mp?{%ojkk%O'p
endfunction
:command! IsolateBracket :call IsolateBracket()
