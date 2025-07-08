return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		-- preset = "helix",
		spec = {
			{ "<leader>c", group = "[C]opy or [C]olor" },
			{ "<leader>d", group = "[D]ocument" },
			{ "<leader>d", group = "delete" },
			{ "<leader>g", group = "[G]IT and [G]o" },
			{ "<leader>f", group = "[F]ile" }, -- group
			{ "<leader>o", group = "[O]bsidian" }, -- group
			{ "<leader>r", group = "[R]ename" },
			{ "<leader>s", group = "[S]earch or [S]nippet" },
			{ "<leader>t", group = "[T]ext" },
			{ "<leader>w", group = "[W]orkspace" },
			{ "<leader>y", group = "config+" },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},

		{ "<leader>,", "<esc>A,<esc>", desc = "add ," },

		{ "<leader>0", "<C-^>", desc = "last tab" },
		{ "<leader>1", ":BufferGoto 1<CR>", desc = "which_key_ignore" },
		{ "<leader>2", ":BufferGoto 2<CR>", desc = "which_key_ignore" },
		{ "<leader>3", ":BufferGoto 3<CR>", desc = "which_key_ignore" },
		{ "<leader>4", ":BufferGoto 4<CR>", desc = "which_key_ignore" },
		{ "<leader>8", "*", desc = "search word under cursor" },
		{ "<leader>9", "<Cmd>BufferPick<CR>", desc = "which_key_ignore" },
		{ "<leader>;", "<esc>A;<esc>", desc = "add ;" },
		{ "<leader>-", "<Cmd>BufferPrevious<CR>", "bprev" },
		{ "<leader>=", "<Cmd>BufferNext<CR>", "bnext" },

		{ "<leader>q", ":BqfToggle<CR>", "quickfix toggle" },
		{ "<leader>F", ":Telescope resume<CR>", "Telescope repeat" },
		{ "<leader>fn", "search for current filename" },
		{ "<leader>K", "<Plug>(devdocs-under-cursor)", "Devdocs" },
		{ "<leader>M", "<cmd>lua require('telescope.builtin').marks()<cr>", "marks" },
		{ "<leader>T", ":Telescope<cr>", "Telescope" },

		{ "<leader>b", "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = "buffers" },

		{ "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", "code actions " },
		{ "<leader>cC", ":CccPick<CR>", "colorPicker" },
		{ "<leader>cc", ":CccConvert<CR>:CccConvert<CR>", "hex to hsl" },
		{ "<leader>cp", "yip]p", "hex to hsl" },
		{ "<leader>cd", ":cd %:p:h<CR>", "moves to the current directory" },
		{ "<leader>co", "console.log(VISUAL)" },

		{ "<leader>dD", "ggVGd", "delete content buffer" },
		{ "<leader>dm", "marks in buffer" },

		{ "<leader>gB", " <cmd>lua require('telescope.builtin').git_branches()<cr>", "branches" },
		{ "<leader>gb", ":GitBlameToggle<CR>", "doc blame" },
		{ "<leader>gg", "LazyGit" },
		{ "<leader>gr", "Lsp Ref" },

		{ "<leader>m", "add mark" },
		{ "<leader>n", ":noh<cr>", "remove Highlight" },

		{ "<leader>ob", ":ObsidianSearch<cr>", "search text in obsidian" },
		{ "<leader>oo", ":IsolateBracket<cr>", "source file" },

		{ "<leader>r", ":lua MiniFiles.open()<CR>", "File Browser [S]idebar" },
		{ "<leader>rf", desc = "replace word under cursor w/ [f]ilename" },

		{ "<leader>sf", ":so % <cr>", "source file" },
		{ "<leader>sj", desc = "[S]plit [J]oin" },
		{ "<leader>ss", 'yiw:%s/"//g<left><left>', "replace word under cursor" },
		{ "<leader>sv", ":vsplit<cr><C-w><C-w>", "[S]plit [V]ertical" },

		{ "<leader>te", ":TodoTelescope <cr>", "find all trouble" },
		{ "<leader>tob", "OBUG:<Plug>(comment_toggle_linewise_current)<cr>kA", "create Bug" },
		{ "<leader>tod", "OTODO:<Plug>(comment_toggle_linewise_current)<cr>kA", "create Todo" },
		{ "<leader>tof", "OFIX:<Plug>(comment_toggle_linewise_current)<cr>kA", "create Fixme" },
		{ "<leader>toh", "OHACK:<Plug>(comment_toggle_linewise_current)<cr>kA", "create Hack" },
		{ "<leader>ton", "ONOTE:<Plug>(comment_toggle_linewise_current)<cr>kA", "create Note" },
		{ "<leader>top", "OPERF:<Plug>(comment_toggle_linewise_current)<cr>kA", "create Perf" },
		{ "<leader>tow", "OWARNING:<Plug>(comment_toggle_linewise_current)<cr>kA", "create Warning" },
		{ "<leader>tt", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", "Find Text" },
		{ "<leader>tw", ":Telescope grep_string<cr>", "Find word under cursor" },

		{ "<leader>u", desc = "add day and time" },

		{ "<leader>yb", ":ToggleBackground<cr>", "background" },
		{ "<leader>yc", "colorscheme" },
		{ "<leader>yp", ":Lazy<CR>", "plugins" },
		{ "<leader>yr", ":set rnu!<cr>", "relative number lines toggle" },
	},
}
