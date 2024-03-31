return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		require("legendary").setup({ extensions = { which_key = { auto_register = true } } })
		require("which-key").setup({
			plugins = {
				marks = true, -- shows a list of your marks on ' and `
				registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
				-- the presets plugin, adds help for a bunch of default keybindings in Neovim
				-- No actual key bindings are created

				spelling = {
					enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
					suggestions = 20, -- how many suggestions should be shown in the list?
				},

				presets = {
					operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
					motions = true, -- adds help for motions
					text_objects = true, -- help for text objects triggered after entering an operator
					windows = true, -- default bindings on <c-w>
					nav = true, -- misc bindings to work with windows
					z = true, -- bindings for folds, spelling and others prefixed with z
					g = true, -- bindings for prefixed with g
					ys = true,
					ds = true,
					cs = true,
				},
			},
			-- add operators that will trigger motion and text object completion
			-- to enable all native operators, set the preset / operators plugin above
			operators = { gc = "Comments", q = "substitution", ys = "add surround" },

			key_labels = {
				-- override the label used to display some keys. It doesn't effect WK in any other way.
				["<space>"] = "SPC",
			},

			icons = {
				breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
				separator = "➜", -- symbol used between a key and it's label
				group = "+", -- symbol prepended to a group
			},

			window = {
				border = "single", -- none, single, double, shadow
				position = "bottom", -- bottom, top
				margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
			},

			layout = {
				height = { min = 4, max = 25 }, -- min and max height of the columns
				width = { min = 20, max = 50 }, -- min and max width of the columns
				spacing = 5, -- spacing between columns
				align = "center", -- align columns left, center or right
			},

			ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
			hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
			show_help = true, -- show help message on the command line when the popup is visible
			triggers = "auto", -- automatically setup triggers
			-- triggers = {"<leader>"} -- or specify a list manually

			triggers_blacklist = {
				-- list of mode / prefixes that should never be hooked by WhichKey
				-- this is mostly relevant for key maps that start with a native binding
				-- most people should not need to change this
				i = { "j", "k" },
				v = { "j", "k" },
			},
		})
		local wk = require("which-key")
		wk.register({
			["1"] = { ":BufferGoto 1<CR>", "which_key_ignore" },
			["2"] = { ":BufferGoto 2<CR>", "which_key_ignore" },
			["3"] = { ":BufferGoto 3<CR>", "which_key_ignore" },
			["4"] = { ":BufferGoto 4<CR>", "which_key_ignore" },
			["8"] = { "*", "search word under cursor" },
			["9"] = { "<Cmd>BufferPick<CR>", "which_key_ignore" },
			["0"] = { "<C-^>", "last tab" },
			["-"] = { ":BufferPrevious<CR>", "bprev" },
			["="] = { ":BufferNext<CR>", "bnext" },
			[","] = { "<esc>A,<esc>", "add ," },
			[";"] = { "<esc>A;<esc>", "add ;" },
			["]"] = { "TDB", "TDB" },
			["["] = { "TDB", "TDB" },

			q = {
				name = "quickfix list", -- optional group name
				q = { ":TodoQuickFix<cr>", "FIND TODO" },
				j = { ":cnext<cr>", "next Qlist" },
				k = { ":cprev<cr>", "previous Qlist" },
			},

			w = {
				name = "wiki", -- optional group name
				-- f = { "<cmd>lua require('plugins.telescope').search_terminus()<CR>", "search terminus"},
				w = { "<Plug>VimwikiTabIndex", "Wiki Terminus Index" },
				d = { "<Plug>VimwikiMakeDiaryNote", "Wiki Diary TODAY" },
				i = { "Wiki diary index" },
			},

			-- e = { "desc"}

			E = { ":lua MiniFiles.open()<CR>", "File Browser [S]idebar" },
			r = {
				name = "Replace", -- optional group name
				f = { "filename" },
			},

			t = {
				name = "Text", -- optional group name
				o = {
					e = { ":TodoTelescope <cr>", "find all trouble" },
					d = { "OTODO:<Plug>(comment_toggle_linewise_current)<cr>kA", "create Todo" },
					f = { "OFIX:<Plug>(comment_toggle_linewise_current)<cr>kA", "create Fixme" },
					b = { "OBUG:<Plug>(comment_toggle_linewise_current)<cr>kA", "create Bug" },
					n = { "ONOTE:<Plug>(comment_toggle_linewise_current)<cr>kA", "create Note" },
					p = { "OPERF:<Plug>(comment_toggle_linewise_current)<cr>kA", "create Perf" },
					h = { "OHACK:<Plug>(comment_toggle_linewise_current)<cr>kA", "create Hack" },
					w = { "OWARNING:<Plug>(comment_toggle_linewise_current)<cr>kA", "create Warning" },
				},
				t = { ":lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", "Find Text" },
				T = { ":call OpenAndSearchPoEditor()<CR> ", "Poeditor" },
				w = { ":Telescope grep_string<cr>", "Find word under cursor" },
			},
			T = { ":Telescope<cr>", "Telescope" },

			y = {
				name = "config+", -- optional group name
				c = { "colorscheme" },
				h = { ":CccHighlighterToggle<CR>", "highlight colors" },
				o = {
					name = "options",
					b = { ":ToggleBackground<cr>", "background" },
					r = { ":set rnu!<cr>", "relative number lines toggle" },
				},
				p = { ":Lazy<CR>", "plugins" },
			},
			-- u = {},

			-- TODO: clean mappings

			-- -- i = {":e ~/terminus/work/maiia/maiia_notes.md<CR>/## TODO<CR>k:let @/ = ''<cr>o", "today",},

			o = {
				name = "Obsidian", -- optional group name
				o = { ":ObsidianSearch<cr>", "search text in obsidian" },
				f = { ":so % <cr>", "source file" },
			},

			p = {},
			a = {},
			s = {
				name = "Substitute or source", -- optional group name
				f = { ":so % <cr>", "source file" },
				j = { "[S]plit [J]oin" },
				s = { 'yiw:%s/"//g<left><left>', "replace word under cursor" },
				v = { ":vsplit<cr><C-w><C-w>", "[S]plit [V]ertical" },
			},

			d = {
				name = "delete", -- optional group name
				m = { "marks in buffer" },
				D = { "ggVGd", "delete content buffer" },
			},

			f = {
				name = "File", -- optional group name
				h = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
				-- p = { "<cmd>lua require('plugins.telescope').search_profiles()<CR>", "[F]ind [P]ro maiia"},
				-- w = { "<cmd>lua require('plugins.telescope').search_terminus()<CR>", "search terminus"},
				-- f = {"<cmd>lua require('plugins.telescope').git_files()<cr>", "search git files"},
				F = { "<cmd>lua require('plugins.telescope').find_files()<cr>", "search files" },
			},
			F = { ":Telescope resume<CR>", "Telescope repeat" },

			g = {
				name = "GIT & Go", -- optional group name
				t = { ":call OpenAndSearch()<CR> ", "Theme" },
				b = { " <cmd>lua require('telescope.builtin').git_branches()<cr>", "branches" },
				B = { ":GitBlameToggle<CR>", "doc blame" },
				c = { ":Git blame<CR>", "full doc blame" },
				r = { "Lsp Ref" }, -- telescope.vim
				g = { "LazyGit" },
			},

			-- h = {},

			j = {
				name = "jss", -- optional group name
				m = { "jss makestyle ➜ makestyle + theme" },
				c = { "jss div ➜ div className=''" },
				C = { "jss div ➜ div className={classes." },
				e = { "jss class ➜ '& .class'" },
				l = { "jss className='X' ➜ className={clsx('X'" },
				L = { "jss className={X} ➜ className={clsx(X," },
				o = { "jss div ➜ div className={clsx(" },
				S = { "jss classes.X ➜ 'X'" },
				s = { "jss 'X' ➜ classes.X" },
				t = { "jss makestyle ➜ makestyle(theme)" },
				i = {
					name = "imports", -- optional group name
					m = { "makestyle" },
					c = { "clsx" },
				},
			},

			-- k = {},
			K = { "<Plug>(devdocs-under-cursor)", "Devdocs" },

			-- l = {},
			L = {
				name = "LSP", -- optional group name
				a = { "actions" },
				r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
				n = { "<cmd>lua require('telescope.builtin').lsp_references()<cr>", "References" },
				d = { "<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>", "Diagnostic Doc" },
			},

			-- z = {},
			-- x = {},

			c = {
				name = "Copy or Color", -- optional group name
				a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "code actions " },
				c = { ":CccConvert<CR>:CccConvert<CR>", "hex to hsl" },
				C = { ":CccPick<CR>", "colorPicker" },
				d = { ":cd %:p:h<CR>", "moves to the current directory" },
				p = { "yap<S-}>p", "copy paragraph under cursor and paste it under" },
				o = { "console.log(VISUAL)" },
			},

			-- v = {},
			b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "buffer " },

			-- this one leaves the search in the search register, the let @/
			-- doesnt
			-- n = { ":let @/ = ''<cr>", "remove Highlight" },
			n = { ":noh<cr>", "remove Highlight" },

			m = { "add mark" },
			M = { "<cmd>lua require('telescope.builtin').marks()<cr>", "marks" },
		}, { prefix = "<leader>" })
	end,
}
