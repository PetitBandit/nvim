return {
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

		-- -- Enables/disable clickable tabs
		-- --  - left-click: go to buffer
		-- --  - middle-click: delete buffer
		clickable = false,
		--
		-- -- Excludes buffers from the tabline
		-- -- exclude_ft = {'javascript'},
		-- exclude_name = {'package.json'},
		--
		-- -- A buffer to this direction will be focused (if it exists) when closing the current buffer.
		-- -- Valid options are 'left' (the default) and 'right'
		focus_on_close = "left",
		--
		-- -- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
		hide = { extensions = true },
		--
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
}
