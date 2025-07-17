return {
	{
		"sindrets/diffview.nvim",
	},
	{
		"alex-popov-tech/store.nvim",
		dependencies = {
			"OXY2DEV/markview.nvim", -- optional, for pretty readme preview / help window
		},
		cmd = "Store",
		keys = {
			{ "<leader>S", "<cmd>Store<cr>", desc = "Open Plugin Store" },
		},
		opts = {
			-- optional configuration here
		},
	},
	-- {
	-- 	"iamcco/markdown-preview.nvim",
	-- 	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	-- 	ft = { "markdown" },
	-- 	build = function()
	-- 		vim.fn["mkdp#util#install"]()
	-- 	end,
	-- },
}
