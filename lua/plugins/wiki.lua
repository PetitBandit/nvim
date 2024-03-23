return {

	{
		"vimwiki/vimwiki",
		dependencies = {},
		init = function() --replace 'config' with 'init'
			vim.g.vimwiki_list = { { path = "~/terminus/", syntax = "markdown", ext = ".md" } }
			vim.g.vimwiki_markdown_link_ext = 1
			vim.g.vimwiki_listsyms = " ○◐●✓"
			vim.g.vimwiki_option_diary_frequency = "weekly"
			local commands = {
				itemgroup = "Obsidian",
				commands = {
					{ ":VimwikiIndex", description = "Index page" },
					{ ":VimwikiDeleteFile", description = "delete page" },
					{ "VimwikiTable", description = "table " },
					{ ":VimwikiTOC", description = "Table Of Content " },
				},
			}
			require("legendary").commands(commands)
		end,
	},

	-- 	{
	-- 		"renerocksai/telekasten.nvim",
	-- 		dependencies = { "nvim-telescope/telescope.nvim" },
	-- 		config = function()
	-- 			require("telekasten").setup({
	-- 				home = vim.fn.expand("~/terminus/"), -- Put the name of your notes directory here
	-- 			})
	-- 		end,
	-- 	},
}
