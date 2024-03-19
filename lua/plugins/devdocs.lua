return {
	"rhysd/devdocs.vim",
	opts = {},
	config = function()
		local commands = {
			{
				":DevDocs<cr>",
				-- FIX: implement word under the cursor instead of just the doc
				description = "opens doc",
			},
		}
		require("legendary").commands(commands)
	end,
}
