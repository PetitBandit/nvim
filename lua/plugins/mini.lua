return {
	"echasnovski/mini.nvim",
	init = function()
		local function splitjoin_config()
			local mappings = {
				{
					"<leader>e",
					description = "Toggle split to multiple lines",
				},
			}
			require("legendary").keymaps(mappings)

			return {
				mappings = { toggle = "<leader>sj", split = "", join = "" },
			}
		end
		require("mini.splitjoin").setup(splitjoin_config())
		require("mini.ai").setup({ n_lines = 500 })
		require("mini.files").setup({
			options = { permanent_delete = false },
		})
		require("mini.pairs").setup()
		-- TODO: have a look at that when having the brainspace
		-- require("mini.visits").setup()
		require("mini.indentscope").setup({
			draw = {
				delay = 25,
				animation = require("mini.indentscope").gen_animation.cubic({ duration = 250, unit = "total" }),
			},
			symbol = "│",
		})
	end,
}
