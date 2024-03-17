return {
	"bloznelis/before.nvim",
	config = function()
		local before = require("before")
		require("before").setup({
			-- How many edit locations to store in memory (default: 10)
			-- history_size = 42,
			-- Use telescope quickfix picker for `show_edits` command (default: false)
			telescope_for_preview = true,
		})
		vim.keymap.set("n", "<C-h>", before.jump_to_last_edit, {})
		vim.keymap.set("n", "<C-l>", before.jump_to_next_edit, {})
		vim.keymap.set("n", "<leader>ra", before.show_edits_in_telescope, {})
		---- can telescope opts to the picker via show_edits_in_telescope arguments:
		vim.keymap.set("n", "<leader>re", function()
			before.show_edits_in_telescope(require("telescope.themes").get_dropdown())
		end, {})
	end,
}
