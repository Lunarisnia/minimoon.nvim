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
					["gp"] = {
						function(state)
							local root = state.path
							vim.notify("git pull...", vim.log.levels.INFO)
							vim.fn.jobstart({ "git", "-C", root, "pull" }, {
								on_exit = function(_, code)
									vim.schedule(function()
										if code == 0 then
											vim.notify("git pull done", vim.log.levels.INFO)
											require("neo-tree.sources.manager").refresh("filesystem")
										else
											vim.notify("git pull failed", vim.log.levels.ERROR)
										end
									end)
								end,
							})
						end,
						desc = "Git Pull",
					},
					["gf"] = {
						function(state)
							local root = state.path
							vim.notify("git fetch...", vim.log.levels.INFO)
							vim.fn.jobstart({ "git", "-C", root, "fetch" }, {
								on_exit = function(_, code)
									vim.schedule(function()
										if code == 0 then
											vim.notify("git fetch done", vim.log.levels.INFO)
											require("neo-tree.sources.manager").refresh("filesystem")
										else
											vim.notify("git fetch failed", vim.log.levels.ERROR)
										end
									end)
								end,
							})
						end,
						desc = "Git Fetch",
					},
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
				mappings = {
					["gp"] = {
						function(state)
							local root = vim.fn.getcwd()
							vim.notify("git pull...", vim.log.levels.INFO)
							vim.fn.jobstart({ "git", "-C", root, "pull" }, {
								on_exit = function(_, code)
									vim.schedule(function()
										if code == 0 then
											vim.notify("git pull done", vim.log.levels.INFO)
											require("neo-tree.sources.manager").refresh("git_status")
										else
											vim.notify("git pull failed", vim.log.levels.ERROR)
										end
									end)
								end,
							})
						end,
						desc = "Git Pull",
					},
					["gf"] = {
						function(state)
							local root = vim.fn.getcwd()
							vim.notify("git fetch...", vim.log.levels.INFO)
							vim.fn.jobstart({ "git", "-C", root, "fetch" }, {
								on_exit = function(_, code)
									vim.schedule(function()
										if code == 0 then
											vim.notify("git fetch done", vim.log.levels.INFO)
											require("neo-tree.sources.manager").refresh("git_status")
										else
											vim.notify("git fetch failed", vim.log.levels.ERROR)
										end
									end)
								end,
							})
						end,
						desc = "Git Fetch",
					},
				},
				popup = {
					size = { height = "90%", width = "90%" },
				},
			},
		},
	},
}
