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
				{ ":CccPick<cr>", description = "Detect and replaces color under the cursor" },
				{ ":CccConvert<cr>", description = "Convert color directly" },
			}
			require("legendary").commands(commands)
		end,
	},

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
