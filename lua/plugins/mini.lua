return {
	"echasnovski/mini.nvim",
	init = function()
		local function splitjoin_config()
			local mappings = {
				{
					"<leader>sj",
					description = "Toggle Split Join",
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
			mappings = {
				close = "q",
				go_in = "l",
				go_in_plus = "<cr>",
				go_out = "h",
				go_out_plus = "H",
				reset = "<BS>",
				reveal_cwd = "@",
				show_help = "?",
				synchronize = "=",
				trim_left = "<",
				trim_right = ">",
			},
			-- Customization of explorer windows
			windows = {
				-- Maximum number of windows to show side by side
				max_number = math.huge,
				-- Whether to show preview of file/directory under cursor
				preview = true,
				-- Width of focused window
				width_focus = 50,
				-- Width of non-focused window
				width_nofocus = 15,
				-- Width of preview window
				width_preview = 50,
			},
		})
		require("mini.bufremove").setup()
		require("mini.cursorword").setup({
			delay = 1000,
		})
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
