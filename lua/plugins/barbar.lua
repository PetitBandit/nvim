return {

	-- {
	-- 	"akinsho/bufferline.nvim",
	-- 	version = "*",
	-- 	dependencies = "nvim-tree/nvim-web-devicons",
	-- 	config = function()
	-- 		vim.opt.termguicolors = true
	-- 		local bufferline = require("bufferline")
	-- 		local groups = require("bufferline.groups")
	-- 		bufferline.setup({
	--
	-- 			options = {
	-- 				numbers = "ordinal",
	-- 				show_buffer_close_icons = false,
	-- 				show_close_icon = false,
	-- 				-- separator_style = "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
	-- 				separator_style = "thick",
	-- 				indicator = {
	-- 					icon = "▎", -- this should be omitted if indicator style is not 'icon'
	-- 					style = "underline",
	-- 				},
	-- 				-- groups = {
	-- 				-- 	options = {
	-- 				-- 		toggle_hidden_on_enter = true,
	-- 				-- 	},
	-- 				-- 	items = {
	-- 				-- 		groups.builtin.pinned:with({ icon = "" }),
	-- 				-- 		groups.builtin.ungrouped,
	-- 				-- 		name = "Docs",
	-- 				-- 		highlight = { undercurl = true, sp = "green" },
	-- 				-- 		auto_close = true, -- whether or not close this group if it doesn't contain the current buffer
	-- 				-- 		matcher = function(buf)
	-- 				-- 			-- FIX: how group works, because right now they
	-- 				-- 			-- dont
	-- 				-- 			return buf.filename:match("%.md")
	-- 				-- 		end,
	-- 				-- 	},
	-- 				-- },
	-- 			},
	-- 		})
	-- 	end,
	-- },

	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},

		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {

			animation = false,

			-- -- Enable/disable auto-hiding the tab bar when there is a single buffer
			auto_hide = false,

			-- -- Enable/disable current/total tabpages indicator (top right corner)
			tabpages = true,
			clickable = false,
			-- -- Disable highlighting alternate buffers
			highlight_alternate = true,

			-- Disable highlighting file icons in inactive buffers
			highlight_inactive_file_icons = false,

			-- Enable highlighting visible buffers
			highlight_visible = true,

			icons = {
				-- Configure the base icons on the bufferline.
				buffer_index = true,
				buffer_number = false,
				-- Enables / disables diagnostic symbols
				diagnostics = {
					[vim.diagnostic.severity.ERROR] = { enabled = true, icon = "ﬀ" },
					[vim.diagnostic.severity.WARN] = { enabled = false },
					[vim.diagnostic.severity.INFO] = { enabled = false },
					[vim.diagnostic.severity.HINT] = { enabled = true },
				},
				filetype = {
					-- Sets the icon's highlight group.
					-- If false, will use nvim-web-devicons colors
					custom_colors = false,

					-- Requires `nvim-web-devicons` if `true`
					enabled = true,
				},
				separator = { left = "▎", right = "" },

				-- Configure the icons on the bufferline when modified or pinned.
				-- Supports all the base icon options.
				button = false,
				modified = { button = "●" },
				pinned = { button = "車" },

				-- Configure the icons on the bufferline based on the visibility of a buffer.
				-- Supports all the base icon options, plus `modified` and `pinned`.
				alternate = { filetype = { enabled = true } },
				current = { buffer_index = true },
				-- inactive = {button = '×'},
				visible = { modified = { buffer_number = false } },
			},

			-- If true, new buffers will be inserted at the start/end of the list.
			-- Default is to insert after current buffer.
			insert_at_end = false,
			insert_at_start = false,

			-- Sets the maximum padding width with which to surround each tab
			maximum_padding = 1,

			-- Sets the minimum padding width with which to surround each tab
			minimum_padding = 1,

			-- Sets the maximum buffer name length.
			maximum_length = 30,

			-- If set, the letters for each buffer in buffer-pick mode will be
			-- assigned based on their name. Otherwise or in case all letters are
			-- already assigned, the behavior is to assign letters in order of
			-- usability (see order below)
			semantic_letters = true,

			-- New buffer letters are assigned in this order. This order is
			-- optimal for the qwerty keyboard layout but might need adjustement
			-- for other layouts.
			letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",

			-- Sets the name of unnamed buffers. By default format is "[Buffer X]"
			-- where X is the buffer number. But only a static string is accepted here.
			no_name_title = nil,
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			-- animation = true,
			-- insert_at_start = true,
			-- …etc.
		},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},
}
