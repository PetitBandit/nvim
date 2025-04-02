
function! Bookmark()
  redir >> ~/terminus/index.md
  echo "- [ ] [".expand("%t")."](" expand("%:p").':'.line('.').")"
  echo " "
  redir END
endfunction
:command! Bookmark :call Bookmark()

function! Trim() range
    execute a:firstline .. ',' .. a:lastline .. 'g/^$/d'
endfunction
xnoremap <leader>n :call Trim()<CR>
:command! Trim :call Trim()
