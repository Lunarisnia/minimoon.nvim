-- NOTE: For adding file or folder to be ignored by telescope
local file_ignore_patterns = {
	"vendor/.*",
}

return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"BurntSushi/ripgrep",
		"sharkdp/fd",
		"nvim-tree/nvim-web-devicons",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},
	config = function()
		require("keybindings.telescope")

		require("telescope").setup({
			defaults = {
				file_ignore_patterns = file_ignore_patterns,
				layout_strategy = "vertical",
				layout_config = {
					vertical = {
						preview_height = 0.70,
					},
					width = 0.99,
					height = 0.99,
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})
		require("telescope").load_extension("fzf")
	end,
}
