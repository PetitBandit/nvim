return {
	{
		"junegunn/limelight.vim",
		keys = {
			{ "z", mode = "v", ":'<,'>Limelight0.9<cr>", desc = "visual limelight" },

			{ "<leader>z", ":ZenMode<cr>", desc = "Zenmode" },

			{ "<leader>Z", ":Limelight0.9<cr>", desc = "limelight paragraph" },
		},
		lazy = false,
	},
	{
		"folke/zen-mode.nvim",
		dependencies = { "junegunn/limelight.vim" },
		config = function()
			require("zen-mode").setup({
				window = {
					backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
					-- height and width can be:
					-- * an absolute number of cells when > 1
					-- * a percentage of the width / height of the editor when <= 1
					-- * a function that returns the width or the height
					width = 120, -- width of the Zen window
					height = 1, -- height of the Zen window
					-- by default, no options are changed for the Zen window
					-- uncomment any of the options below, or add other vim.wo options you want to apply
					options = {
						-- signcolumn = "no", -- disable signcolumn
						-- number = false, -- disable number column
						-- relativenumber = false, -- disable relative numbers
						-- cursorline = false, -- disable cursorline
						-- cursorcolumn = false, -- disable cursor column
						foldcolumn = "0", -- disable fold column
						list = false, -- disable whitespace characters
					},
				},
				plugins = {
					-- disable some global vim options (vim.o...)
					-- comment the lines to not apply the options
					options = {
						enabled = true,
						ruler = false, -- disables the ruler text in the cmd line area
						showcmd = false, -- disables the command in the last line of the screen
						-- you may turn on/off statusline in zen mode by setting 'laststatus'
						-- statusline will be shown only if 'laststatus' == 3
						laststatus = 0, -- turn off the statusline in zen mode
					},
					gitsigns = { enabled = false }, -- disables git signs
					-- this will change the font size on kitty when in zen mode
					-- to make this work, you need to set the following kitty options:
					-- - allow_remote_control socket-only
					-- - listen_on unix:/tmp/kitty
					kitty = {
						enabled = true,
						font = "+4", -- font size increment
					},
				},
				-- callback where you can add custom code when the Zen window opens
				on_open = function(win)
					vim.cmd("Limelight0.9")
					-- vim.cmd.colorscheme("melange")
				end,
				-- callback where you can add custom code when the Zen window closes
				on_close = function()
					vim.cmd("Limelight!")
					-- vim.cmd.colorscheme("base16-everforest")
				end,
			})
		end,
	},
}
