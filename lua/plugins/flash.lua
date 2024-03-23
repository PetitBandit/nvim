return {
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {

			highlight = {
				-- show a backdrop with hl FlashBackdrop
				backdrop = true,
				-- Highlight the search matches
				matches = true,
				-- extmark priority
				priority = 5000,
				groups = {
					match = "FlashMatch",
					current = "FlashCurrent",
					backdrop = "FlashBackdrop",
					label = "FlashLabel",
				},
			},
			modes = {
				char = {
					enabled = false,
				},
			},
		},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    { "R", mode = { "n"}, function() require("flash").jump({pattern = vim.fn.expand("<cword>"),})end, desc = "Flash" },
  },
		config = function()
			vim.cmd([[
" hi HopNextKey guifg=#3cdd78
" hi guifg=#ecc94b
" hi FlashLabel guifg=#3cdd78
hi FlashLabel guifg=#3cdd78
" hi FlashLabel guibg=#000000
" hi FlashLabel guibg=#ecc94b
]])
		end,
	},
}
