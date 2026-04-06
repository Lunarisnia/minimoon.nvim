-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "<leader>cd", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
		{ "<leader>gs", ":Neotree git_status<CR>", desc = "NeoTree Git Status", silent = true },
	},
	opts = {
		default_component_configs = {
			indent = {
				with_expanders = false,
			},
		},
		event_handlers = {
			{
				event = "neo_tree_buffer_enter",
				handler = function()
					vim.cmd([[
              setlocal relativenumber
            ]])
				end,
			},
		},
		filesystem = {
			window = {
				position = "float",
				mappings = {
					["<leader>cd"] = "close_window",
				},
				popup = {
					size = { height = "75%", width = "80%" },
				},
			},
			filtered_items = {
				hide_by_name = { "__init__.py" },
			},
		},
		git_status = {
			window = {
				position = "float",
				popup = {
					size = { height = "90%", width = "90%" },
				},
			},
		},
	},
}
