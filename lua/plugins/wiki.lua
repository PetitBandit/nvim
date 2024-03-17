return {
    'vimwiki/vimwiki',
  dependencies = { },
    init = function () --replace 'config' with 'init'
      vim.g.vimwiki_list = {{path = '~/terminus/', syntax = 'markdown', ext = '.md'}}
      vim.g.vimwiki_markdown_link_ext = 1
      vim.g.vimwiki_listsyms = ' ○◐●✓'

    end
  }
