local function telescope_opt()
	local actions = require("telescope.actions")
	return {
		defaults = {
			prompt_prefix = "  ",
			selection_caret = " ",
			sorting_strategy = "ascending",
			path_display = { "smart" },
			set_env = { ["COLORTERM"] = "truecolor" },
			-- layout_strategy = "horizontal",
			-- disable_devicons = false,
			-- color_devicons = true,
			--
			-- border = {},
			-- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			layout_config = {
				horizontal = {
					prompt_position = "top",
					-- preview_width = 0.55,
					-- results_width = 0.8,
				},
				vertical = {
					-- mirror = false,
				},
				-- width = 0.87,
				-- height = 0.80,
				-- preview_cutoff = 120,
			},
			mappings = {
				i = {
					["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
					["<C-k>"] = actions.move_selection_previous,
					["<C-j>"] = actions.move_selection_next,
					["<CR>"] = actions.select_default + actions.center,
				},

				n = {
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
				},
			},
		},
		pickers = {
			buffers = {
				sort_lastused = true,
			},
		},

		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				--
				-- the default case_mode is "smart_case"
				-- fzf search algo
				-- Token  	Match type 	                Description
				-- sbtrkt 	fuzzy-match 	            Items that match sbtrkt
				-- 'wild  	exact-match (quoted)    	Items that include wild
				-- ^music 	prefix-exact-match 	        Items that start with music
				-- .mp3$  	suffix-exact-match 	        Items that end with .mp3
				-- !fire  	inverse-exact-match 	    Items that do not include fire
				-- !^music 	inverse-prefix-exact-match 	Items that do not start with music
				-- !.mp3$ 	inverse-suffix-exact-match 	Items that do not end with .mp3
				-- Use space to add new parameters to the search that can use those
				-- systems
			},
			["ui-select"] = {
				-- require("telescope.themes").get_cursor {
				--   -- even more opts
				-- }
				require("telescope.themes").get_dropdown(),

				-- pseudo code / specification for writing custom displays, like the one
				-- for "codeactions"
				-- specific_opts = {
				--   [kind] = {
				--     make_indexed = function(items) -> indexed_items, width,
				--     make_displayer = function(widths) -> displayer
				--     make_display = function(displayer) -> function(e)
				--     make_ordinal = function(e) -> string
				--   },
				--   -- for example to disable the custom builtin "codeactions" display
				--      do the following
				--   codeactions = false,
				-- }
			},
		},
	}
end

return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
			-- { 'nvim-telescope/telescope-fzy-native.nvim' }
		},
		opts = {},
		config = function()
			require("telescope").setup(telescope_opt())
			local builtin = require("telescope.builtin")
			require("telescope").load_extension("fzf")
			-- require("telescope").load_extension("ui-select")

			vim.keymap.set("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find({
					previewer = false,
				})
			end, { desc = "[/] Fuzzily search in current buffer" })

			vim.keymap.set("n", "<leader>fp", function()
				builtin.find_files(require("telescope.themes").get_ivy({
					prompt_title = "< PRO >",
					previewer = true,
					layout_config = {
						preview_width = 0.5,
						height = 0.99,
					},
					path_display = { "smart" },
					cwd = "~/work/doca/maiia-frontend/packages/pro-frontend/",
					file_ignore_patterns = { "index.ts", "index.stories.js" },
					wrap_results = true,
				}))
			end, { desc = "Pro files" })

			vim.keymap.set("n", "<leader>ff", function()
				builtin.find_files(require("telescope.themes").get_ivy({
					prompt_title = "< Files >",
					previewer = true,
					layout_config = {
						preview_width = 0.5,
						height = 0.99,
					},
					wrap_results = true,
				}))
			end, { desc = "Files" })

			vim.keymap.set("n", "<leader>fR", function()
				builtin.live_grep({
					prompt_title = "< VimRC >",
					cwd = vim.fn.stdpath("config"),
				})
			end, { desc = "[F]ind VimRC >" })

			vim.keymap.set("n", "<leader>fr", function()
				builtin.find_files({
					prompt_title = "< VimRC >",
					cwd = vim.fn.stdpath("config"),
				})
			end, { desc = "< [F]ind Vim[R]C Files>" })

			vim.keymap.set("n", "<leader>fd", function()
				builtin.help_tags({
					prompt_title = "< Documentation >",
				})
			end, { desc = "< help >" })

			vim.keymap.set("n", "<leader>fw", function()
				builtin.find_files({
					previewer = true,
					layout_config = {
						preview_width = 0.5,
						height = 0.99,
					},
					cwd = "~/terminus",
					prompt_title = "< [F]iles [W]iki >",
				})
			end, { desc = "< [F]iles [W]iki >" })

			vim.keymap.set("n", "\\", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [/] in Open Files" })

			vim.keymap.set("n", "<leader>wf", function()
				builtin.live_grep({
					prompt_title = "< [W]iki [F]ind Text>",
					previewer = true,
					layout_config = {
						preview_width = 0.5,
						height = 0.99,
					},
					cwd = "~/terminus",
				})
			end, { desc = "< [W]iki [F]ind >" })

			vim.keymap.set("n", "<leader>yc", function()
				builtin.colorscheme(require("telescope.themes").get_ivy({
					prompt_title = "< colorScheme >",
					enable_preview = 1,
					layout_config = {
						preview_width = 0.5,
						height = 0.99,
					},
				}))
			end, { desc = "ColorScheme" })
		end,
	},
}

--   Hey all, I've been working on a plugin for people who write redux in neovim which I wrote to learn how to write plugins, work with telescope and especially work with tree sitter!
--   I learned some cool stuff about telescope that you might find useful
--   You can write pre-filled live_grep queries into telescope.
--   :lua require('telescope.builtins').live_grep {default_text="function"}
--   This searches for the text function using the live_grep functionality. The cool thing is you can bind these customised prompts to keybindings like anything else
--   nmap <leader>lf :lua require('telescope.builtins').live_grep {default_text="function"}
--   To personalise it further you can customize the prompt title which replaces the "live grep" text above the prompt like this.
--   :lua require('telescope.builtins').live_grep {prompt_title="find all function definitions"}
--   In addition to prompt titles, you can specify file types to search for using ripgrep parameters by passing in a function referred to as additional_params
--   :lua require('telescope.builtins').live_grep {
--     additional_params=function()
--     return {'-g*.js', '-g*.ts', '-g*.jsx'}
--   end
-- }
-- (the -g parameter is a filetype glob filter)
-- This additional_params takes any and all parameters passed in the list returned by the function and passes them on to ripgrep. So this will call rg ... -g*.js -g*.ts -g *.jsx
-- The default_text and prompt_title parameters are available on I believe all telescope builtins with a prompt, so you can easily make many personalised prompts to fit the needs of your particular project.
