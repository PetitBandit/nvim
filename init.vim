
scriptencoding utf-8
source $HOME/.config/nouveauvim/settings.vim
source $HOME/.config/nouveauvim/mapping.vim
source $HOME/.config/nouveauvim/mac.vim
source $HOME/.config/nouveauvim/functions/isolatebrackets.vim
source $HOME/.config/nouveauvim/functions/getmonth.vim
source $HOME/.config/nouveauvim/functions/max80char.vim
source $HOME/.config/nouveauvim/functions/openandsearch.vim
source $HOME/.config/nouveauvim/functions/indentfile.vim
source $HOME/.config/nouveauvim/functions/consolelog.vim
source $HOME/.config/nouveauvim/functions/bookmark.vim
lua require('plugin')
" $HOME/.config/nouveauvim/lua/plugin.lua
lua require('utils/highlightOnYank')
" $HOME/.config/nouveauvim/lua/utils/highlightOnYank.lua
" TODO: add emmet
" TODO: akinsho/git-conflict.nvim for merge conflict ?
" TODO: add pmizio/typescript-tools.nvim
" TODO: add nvimtools/none-ls.nvim
"
" base16-catppuccin-macchiato
" base16-eighties
" base16-everforest
" base16-gruvbox-material-dark-medium
" base16-woodland
