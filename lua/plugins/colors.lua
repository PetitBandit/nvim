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
		end,
	},
	{
		"savq/melange-nvim",
		init = function()
			vim.cmd.colorscheme("melange")
		end,
	},
}
