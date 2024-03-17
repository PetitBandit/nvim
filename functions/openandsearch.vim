
function! OpenAndSearch()
    :e $HOME/work/doca/maiia-frontend/packages/pro-frontend/src/theme/index.js
    :Telescope current_buffer_fuzzy_find
endfunction
:command! OpenAndSearch :call OpenAndSearch()

function! OpenAndSearchPoEditor()
    :e $HOME/work/doca/maiia-frontend/packages/pro-frontend/public/locales/fr/common.json
    :Telescope current_buffer_fuzzy_find
endfunction
:command! OpenAndSearchPoEditor :call OpenAndSearchPoEditor()
