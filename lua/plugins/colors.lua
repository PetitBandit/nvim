return {
	{
		"uga-rosa/ccc.nvim",
		init = function()
			vim.opt.termguicolors = true
			local ccc = require("ccc")

			ccc.setup({
				-- Your preferred settings
				-- Example: enable highlighter
				highlighter = {
					auto_enable = true,
					lsp = true,
				},
			})

			local commands = {
				{ ":CccPick<cr>", description = "pick color under the cursor, [i] to change type" },
				{ ":CccConvert<cr>", description = "Convert color directly" },
			}
			require("legendary").commands(commands)
		end,
	},
	-- brenoprata10/nvim-highlight-colors other color highlight plugin w/ different
	-- options
	{
		"RRethy/base16-nvim",
		config = function()
			local create_cmd = vim.api.nvim_create_user_command
			-- vim.cmd.colorscheme("base16-everforest")
			create_cmd("ToggleBackground", function()
				if vim.o.background == "dark" then
					vim.cmd("set bg=light")
				else
					vim.cmd("set bg=dark")
				end
			end, {})

			vim.cmd.colorscheme("base16-everforest")
		end,
	},

	{
		"savq/melange-nvim",
		init = function()
			vim.cmd.colorscheme("melange")
		end,
	},

	-- { -- You can easily change to a different colorscheme.
	-- 	-- Change the name of the colorscheme plugin below, and then
	-- 	-- change the command in the config to whatever the name of that colorscheme is.
	-- 	--
	-- 	-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
	-- 	"folke/tokyonight.nvim",
	-- 	priority = 1000, -- Make sure to load this before all the other start plugins.
	-- 	init = function()
	-- 		-- Load the colorscheme here.
	-- 		-- Like many other themes, this one has different styles, and you could load
	-- 		-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
	-- 		vim.cmd.colorscheme("tokyonight-night")
	--
	-- 		-- You can configure highlights by doing something like:
	-- 		vim.cmd.hi("Comment gui=none")
	-- 	end,
	-- },
}
