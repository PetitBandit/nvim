return {
	"mrjones2014/legendary.nvim",
	dependencies = {
		"kkharji/sqlite.lua",
		"stevearc/dressing.nvim",
	},
	keys = {
		{ "<C-p>", "<cmd>Legendary<cr>", desc = "Legendary" },
	},
	config = function()
		require("legendary").setup({
			commands = {
				{ ":Lazy", description = "Show lazy.nvim" },
				{ ":Getmonth", description = "print calendar of this month" },
				{ ":Maxchar", description = "cuts the line if it makes more than 80char" },
			},
			extensions = {
				lazy_nvim = false,
				which_key = {
					auto_register = true,
					use_groups = false,
					mappings = {},
					opts = {},
					do_binding = false,
				},
			},

			autocmds = {
				{
					"VimResized",
					":wincmd =",
				},
			},
			keymaps = {
				{ "<leader>l", description = "Preview markdown", filters = { ft = "obsidian" } },
			},

			select_prompt = " legendary.nvim ",
			col_separator_char = "│",
			default_item_formatter = nil,
			include_builtin = true,
			include_legendary_cmds = true,
			sort = {
				most_recent_first = true,
				user_items_first = true,
				item_type_bias = nil,
				frecency = {
					db_root = string.format("%s/legendary/", vim.fn.stdpath("data")),
					max_timestamps = 10,
				},
			},
			scratchpad = {
				view = "float",
				results_view = "float",
				float_border = "rounded",
				keep_contents = true,
			},
			cache_path = string.format("%s/legendary/", vim.fn.stdpath("cache")),
			log_level = "info",
		})
		require("dressing").setup({
			input = {
				-- Set to false to disable the vim.ui.input implementation
				enabled = true,

				-- Default prompt string
				default_prompt = "Input:",

				-- Can be 'left', 'right', or 'center'
				-- prompt_align = "center",
				prompt_align = "left",

				-- When true, <Esc> will close the modal
				insert_only = true,

				-- When true, input will start in insert mode.
				start_in_insert = true,

				-- These are passed to nvim_open_win
				-- anchor = "SW",
				border = "rounded",
				-- 'editor' and 'win' will default to being centered
				relative = "cursor",

				-- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
				prefer_width = 40,
				width = nil,
				-- min_width and max_width can be a list of mixed types.
				-- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
				max_width = { 140, 0.9 },
				min_width = { 20, 0.2 },

				buf_options = {},
				win_options = {
					-- Window transparency (0-100)
					winblend = 10,
					-- Disable line wrapping
					wrap = false,
				},

				-- Set to `false` to disable
				mappings = {
					n = {
						["<Esc>"] = "Close",
						["<CR>"] = "Confirm",
					},
					i = {
						["<C-p>"] = "Close",
						["<CR>"] = "Confirm",
						["<Up>"] = "HistoryPrev",
						["<Down>"] = "HistoryNext",
					},
				},

				override = function(conf)
					-- This is the config that will be passed to nvim_open_win.
					-- Change values here to customize the layout
					return conf
				end,

				-- see :help dressing_get_config
				get_config = nil,
			},
			select = {
				get_config = function(opts)
					if opts.kind == "legendary.nvim" then
						return {
							-- telescope = require("telescope.themes").get_cursor(),
							telescope = {
								-- sorter = require('telescope.sorters').fuzzy_with_index_bias({}),

								-- layout_config = {
								--   height = 10,
								--   width = 0.8,
								--   },

								-- sorting_strategy = "descending",
								-- layout_strategy = "vertical",
								-- theme = "ivy"
								-- theme = "cursor"
								initial_mode = "insert",
								selection_strategy = "reset",
								sorting_strategy = "ascending",
								layout_strategy = "horizontal",
								layout_config = {
									horizontal = {
										prompt_position = "top",
										preview_width = 0.55,
									},
									vertical = {
										mirror = false,
									},
									width = 0.87,
									height = 0.50,
									preview_cutoff = 120,
								},
								path_display = { "truncate" },
								winblend = 0,
								border = {},
								borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
								color_devicons = true,
								set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
							},
						}
					else
						return {}
					end
				end,
			},
		})
	end,
}
