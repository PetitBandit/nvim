return {
	"mhinz/vim-startify",
	config = function()
		vim.cmd([[

function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction


let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
          \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]


let g:startify_bookmarks = [
            \ { 'i': '~/.config/nouveauvim/init.vim' },
            \ { ',': '~/.config/nouveauvim/lua/plugins/startify.lua' },
            \ { 'm': '~/.config/nouveauvim/mapping.vim' },
            \ { 'w': '~/.config/nouveauvim/lua/plugins/whichkey.lua' },
            \ { 'p': '~/.config/nouveauvim/lua/plugin.lua' },
            \ { 'K': '~/dotfiles/kitty/kitty.conf'},
            \ { 'z': '~/dotfiles/zsh/zshrc'},
            \ { 'e': '~/Library/Application Support/espanso/match/base.yml'},
            \ ]
            let g:startify_relative_path = 1

" The ASCII art read " الْعِلْمُ قَبْلَ الْقَوْلِ وَالْعَمَلِ" means "It is essential to know a thing first before saying or acting upon it."

let g:startify_custom_header = [
      \'                  ▄ ▄ ',
      \'              ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄',
      \'              █ ▄ █▄█ ▄▄▄ █ █▄█ █ █' ,
      \'           ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █',
      \'         ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄',
      \'         █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄',
      \'         █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █',
      \'       █▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █',
      \'           █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█',
      \'                                                      ',
      \]

      nnoremap <Leader><Leader> :Startify <CR>
     ]])
	end,
}
