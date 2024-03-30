return {
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
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
			require("flash").setup({
				modes = {
					char = {
						enabled = false,
					},
				},
				jump = {
					-- save location in the jumplist
					jumplist = true,
					-- jump position
					pos = "start", ---@type "start" | "end" | "range"
					-- add pattern to search history
					history = false,
					-- add pattern to search register
					register = false,
					-- clear highlight after jump
					nohlsearch = false,
					-- automatically jump when there is only one match
					autojump = true,
					-- You can force inclusive/exclusive jumps by setting the
					-- `inclusive` option. By default it will be automatically
					-- set based on the mode.
					inclusive = nil, ---@type boolean?
					-- jump position offset. Not used for range jumps.
					-- 0: default
					-- 1: when pos == "end" and pos < current position
					offset = nil, ---@type number
				},
				label = {
					-- allow uppercase labels
					uppercase = true,
					-- add any labels with the correct case here, that you want to exclude
					exclude = "",
					-- add a label for the first match in the current window.
					-- you can always jump to the first match with `<CR>`
					current = true,
					-- show the label after the match
					after = true, ---@type boolean|number[]
					-- show the label before the match
					before = false, ---@type boolean|number[]
					-- position of the label extmark
					style = "overlay", ---@type "eol" | "overlay" | "right_align" | "inline"
					-- flash tries to re-use labels that were already assigned to a position,
					-- when typing more characters. By default only lower-case labels are re-used.
					reuse = "lowercase", ---@type "lowercase" | "all" | "none"
					-- for the current window, label targets closer to the cursor first
					distance = true,
					-- minimum pattern length to show labels
					-- Ignored for custom labelers.
					min_pattern_length = 0,
					-- Enable this to use rainbow colors to highlight labels
					-- Can be useful for visualizing Treesitter ranges.
					rainbow = {
						enabled = true,
						-- number between 1 and 9
						shade = 5,
					},
					-- With `format`, you can change how the label is rendered.
					-- Should return a list of `[text, highlight]` tuples.
					---@class Flash.Format
					---@field state Flash.State
					---@field match Flash.Match
					---@field hl_group string
					---@field after boolean
					---@type fun(opts:Flash.Format): string[][]
					format = function(opts)
						return { { opts.match.label, opts.hl_group } }
					end,
				},
			})
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
