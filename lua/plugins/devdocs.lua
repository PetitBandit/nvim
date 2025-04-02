return {
	"rhysd/devdocs.vim",
	opts = {},
	config = function()
		local commands = {
			{
				":DevDocs<cr>",
				description = "opens doc",
			},
		}
		require("legendary").commands(commands)
	end,
}
