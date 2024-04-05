return {
	"nvim-pack/nvim-spectre",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("spectre").setup()
		local mapping = {

			{
				"<leader>rr",
				":lua require('legendary').find({ itemgroup = 'Spectre', select_prompt = 'Spectre'  })<cr>",
				desc = "spectre",
			},
		}
		local commands = {
			itemgroup = "Spectre",
			commands = {
				{ ":Spectre<CR>", description = "Toggle Spectre" },
				{
					"<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
					description = "Search current word",
				},
				{
					"<cmd>lua require('spectre').open_file_search({select_word=true})<CR>",
					description = "Search on current file",
				},
			},
		}
		require("legendary").commands(commands)
		require("legendary").keymaps(mapping)
	end,
}
