return {
	{ "sindrets/diffview.nvim" },
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			open_mapping = [[<c-\>]],
			hide_numbers = true, -- hide the number column in toggleterm buffers
			persist_size = true,
			direction = "float",
			border = "double",
			highlights = {
				border = "Normal",
				background = "Normal",
			},
		},
		init = function()
			local Terminal = require("toggleterm.terminal").Terminal
			local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
			function _lazygit_toggle()
				lazygit:toggle()
			end
			vim.api.nvim_set_keymap(
				"n",
				"<leader>gg",
				"<cmd>lua _lazygit_toggle()<CR>",
				{ noremap = true, silent = true }
			)
		end,
	},
}
