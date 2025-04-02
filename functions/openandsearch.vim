

function! OpenAndSearchPoEditor()
    :e $HOME/work/doca/maiia-frontend/packages/pro-frontend/public/locales/fr/common.json
    :Telescope current_buffer_fuzzy_find
endfunction
:command! OpenAndSearchPoEditor :call OpenAndSearchPoEditor()
