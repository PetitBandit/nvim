
nnoremap [d vim.diagnostic.goto_prev<cr>
nnoremap ]d vim.diagnostic.goto_next<cr>
nnoremap [<space> msO`s
nnoremap ]<space> mso`s
nnoremap [p Op
nnoremap ]p op
nnoremap <C-q> :lua MiniBufremove.delete()<cr>
"--------------------------------------------------------------------------
" # Free easy mappings available
"--------------------------------------------------------------------------
"Ctrl + b
"Ctrl + e
      " nnoremap <C-j> g,
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

      "Indent file and keep cursor position
      nnoremap <C-f> :Lines<cr>


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
      map <leader>rf ciw<C-R>=expand("%:t:r")<CR>


    "add the filename
    imap \fn <C-R>=expand("%:t:r")<CR>




"--------------------------------------------------------------------------
" # JSX Mappings
"--------------------------------------------------------------------------

    " <div> --> <div className="">
    nmap <leader>jc f>i className=""i

    " <div> --> <div className={classes.
    nmap <leader>jC f>i className={classes.}i

    " classes.tomate --> 'tomate'
    nmap <leader>jS /classesdiwxysiw'ds{
    "  'tomate' --> classes.tomate
    nmap <leader>js /classwwyiwda"i{classes.pbds"

    " class --> '& .class'
    nmap <leader>je ysiw'li& .

    " <div> --> <div className={clsx()}>
    nmap <leader>jo f>i className={clsx(

     " className='tomate' --> className={clsx('tomate')}
    nmap <leader>jl f"lcs"{wysiw'ysiW(hiclsxlxf"lli,

     " className={test} --> className={clsx(test, )}
    nmap <leader>jL f{wi f}i bysiW(iclsxf)i, 

    "changes makestyle --> makestyle(theme ...
    nnoremap <leader>jt ?useStyles = makewwwC(theme => ({

    "import clsx
   nnoremap <leader>jic mw?import<cr>oimport clsx from "clsx";`w


"--------------------------------------------------------------------------
" # sort visual
"--------------------------------------------------------------------------
    xnoremap <leader>o mwoOgvoo'w
    xnoremap <leader>` li`gvoi`

    xnoremap <leader>ls :'<,'> sort <cr>
    xnoremap <leader>ld :'<,'> sort u<cr>
    xnoremap <leader>lD :'<,'> %sort! u<cr>
    xnoremap <leader>lS :'<,'> %sort! <cr>
    xnoremap <leader>co yoconsole.log(pA);
    nnoremap <leader>u o<C-R>=strftime("%c")<CR><Esc>0wdwwhpwdWI### <Esc>mto

    nnoremap <C--> <Plug>VimwikiMakeDiaryNote
    " i = {":e ~/Library/Mobile Documents/Icloud~md~obsidian/Documents/terminus/work/maiia/maiia_notes.md<CR>/## TODO<CR>k:let @/ = ''<cr>o", "today"},
" :echo strftime("%c")		   Sun Apr 28 11:49:23 1997
" :echo strftime("%Y %b %d %X")	   1997 Apr 27 11:53:25
" :echo strftime("%y%m%d %T")	   970427 11:53:55
" :echo strftime("%H:%M")	   11:55
