return {
	{
		"cbochs/portal.nvim",
		-- Optional dependencies
		dependencies = {
			"cbochs/grapple.nvim",
			"ThePrimeagen/harpoon",
		},
		config = function()
			vim.keymap.set("n", "<leader>o", "<cmd>Portal jumplist backward<cr>")
			vim.keymap.set("n", "<leader>i", "<cmd>Portal jumplist forward<cr>")

			require("portal").setup({
				---@type "debug" | "info" | "warn" | "error"
				log_level = "warn",

				---base filter applied to every search.
				---@type Portal.SearchPredicate | nil
				filter = nil,

				---The maximum number of results for any search.
				---@type integer | nil
				max_results = nil,

				---The maximum number of items that can be searched.
				---@type integer
				lookback = 100,

				---An ordered list of keys for labelling portals.
				---Labels will be applied in order, or to match slotted results.
				---@type string[]
				labels = { "j", "k", "h", "l" },

				---Select the first portal when there is only one result.
				select_first = false,

				---Keys used for exiting portal selection. Disable with [{key}] = false
				---to `false`.
				---@type table<string, boolean>
				escape = {
					["<esc>"] = true,
				},

				---The raw window options used for the portal window
				window_options = {
					relative = "cursor",
					width = 80,
					height = 9,
					col = 2,
					focusable = false,
					border = "single",
					noautocmd = true,
				},
			})
			vim.keymap.set(
				"n",
				"<leader>l",
				"<cmd>lua require('portal.builtin').changelist.tunnel({  max_results = 9,})<cr>"
			)
			vim.keymap.set(
				"n",
				"<leader>i",
				"<cmd>lua require('portal.builtin').grapple.tunnel({  max_results = 9,})<cr>"
			)
		end,
	},
}
