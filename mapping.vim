nnoremap [d vim.diagnostic.goto_prev<cr>
nnoremap ]d vim.diagnostic.goto_next<cr>
nnoremap [<space> msO`s
nnoremap ]<space> mso`s
nnoremap [p Op
nnoremap ]p op
nnoremap <C-q> :lua MiniBufremove.delete()<cr>
" Select pasted text
nnoremap gp `[v`]

"--------------------------------------------------------------------------
" # Free easy mappings available
"--------------------------------------------------------------------------
"Ctrl + b
"Ctrl + e
      " nnoremap <C-j> g,
      " nnoremap <C-f> :Lines<cr>
      " nnoremap <C-k> g;
      " nnoremap <C-l> :cnext<cr>
      " nnoremap <C-h> :cp<cr>
      " nnoremap <A-0>
      " nnoremap <A-h> :cprev<cr>zz
      " nnoremap <A-l> :cnext<cr>zz
      ""navigate the QuickFixList

"--------------------------------------------------------------------------
" # Use Alt + hjkl
"--------------------------------------------------------------------------
      nnoremap <A-=>   :vertical resize +20<CR>
      nnoremap <A-->   :vertical resize -20<CR>

      " move line downwards
      nnoremap <A-j>   <Esc>:m .+1<CR>
      " move line upwards
      nnoremap <A-k>   <Esc>:m .-2<CR>

" ESC
inoremap jk <Esc>



"--------------------------------------------------------------------------
" # Behind the scenes
"--------------------------------------------------------------------------

" move in visual mode up and down the visual selection
      vnoremap J :m '>+1<CR>gv=gv
      vnoremap K :m '<-2<CR>gv=gv

      vnoremap < <gv " Better tabbing
      vnoremap > >gv " Better tabbing

      " undo break point
      inoremap , ,<c-g>u
      inoremap . .<c-g>u
      inoremap ! !<c-g>u
      inoremap ? ?<c-g>u

      " Jumps remap
      " nnoremap <expr> k (v:count > 1 ? "m`" . v:count : '') . 'k'
      " nnoremap <expr> j (v:count > 1 ? "m`" . v:count : '') . 'j'

"--------------------------------------------------------------------------
" # File Manipulation
"--------------------------------------------------------------------------

      nnoremap <silent> <C-S> :w<cr>



"--------------------------------------------------------------------------
" # Navigation
"--------------------------------------------------------------------------
      map H ^
      map L $

      nnoremap Q q
      nnoremap Y yg_

      ""navigate the changeList
      nnoremap <bs> g;
      nnoremap <S-BS> g,




      " keeping centered while browsing
      nnoremap n nzz
      nnoremap N Nzz

      " Marks
      nnoremap M m
      nnoremap m '



      nnoremap <Up>   <C-W>+
      nnoremap <Down> <C-W>-
        nnoremap <Left> <C-W><
      nnoremap <Right> <C-W>>




"--------------------------------------------------------------------------
" # Cut, Manipulate text
"--------------------------------------------------------------------------



      " + or _ will cut a line and paste it here
      nnoremap + :<C-u>+m.<left><left>
      nnoremap _ :<C-u>-m.<left><left>


      " - Smash that dot '.' multiple times to change all the other occurrences of the word
      nnoremap cn *``cgn
      nnoremap c. /\V<C-r>"<CR>cgn<C-a><Esc>

      " replace word under cursor with the filename without the extension
      map <leader>Rf ciw<C-R>=expand("%:t:r")<CR>


    "add the filename
    imap \fn <C-R>=expand("%:t:r")<CR>

    "search for files that have the current filename
    " nmap <leader>fn :lua require'telescope.builtin'.find_files({cwd = vim.fn.expand(".")})<cr>
    nmap <leader>fn :Telescope find_files search_dirs=.<cr>



"--------------------------------------------------------------------------
" # JSX Mappings
"--------------------------------------------------------------------------

    " <div> --> <div className="">
    nmap <leader>jc f>i class=""i

    nmap <leader>jj obackground-color: tomato; //delete me:w<cr>




"--------------------------------------------------------------------------
" # visual
"--------------------------------------------------------------------------
    xnoremap <leader>o mwoOgvoo'w
    xnoremap <leader>o mwoOgvoo'w
    xnoremap <leader>` li`gvoi`

"sort
    xnoremap <leader>ls :'<,'> sort <cr>
    xnoremap <leader>ld :'<,'> sort u<cr>
    xnoremap <leader>lD :'<,'> %sort! u<cr>
    xnoremap <leader>lS :'<,'> %sort! <cr>
    xnoremap <leader>co yoconsole.log(pA);
    nnoremap <leader>u o<C-R>=strftime("%c")<CR><Esc>
    vnoremap <leader><space> :g/^$/d<CR><Esc>


    "search terms visually selected
    xnoremap <leader>t <cmd> Telescope grep_string <CR>
    " i = {":e ~/Library/Mobile Documents/Icloud~md~obsidian/Documents/terminus/work/maiia/maiia_notes.md<CR>/## TODO<CR>k:let @/ = ''<cr>o", "today"},
" :echo strftime("%c")		   Sun Apr 28 11:49:23 1997
" :echo strftime("%Y %b %d %X")	   1997 Apr 27 11:53:25
" :echo strftime("%y%m%d %T")	   970427 11:53:55
" :echo strftime("%H:%M")	   11:55
