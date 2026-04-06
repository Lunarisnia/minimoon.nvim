return { -- Collection of various small independent plugins/modules
	"echasnovski/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup()

		-- Simple and easy statusline.
		--  You could remove this setup call if you don't like it,
		--  and try some other statusline plugin
		local statusline = require("mini.statusline")
		-- set use_icons to true if you have a Nerd Font
		statusline.setup({ use_icons = vim.g.have_nerd_font })

		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return "%2l:%-2v"
		end

		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_git = function()
			local branch = vim.b.gitsigns_head or ""
			if branch == "" then
				return ""
			end
			local status = vim.b.gitsigns_status or ""
			if status ~= "" then
				return " " .. branch .. "  " .. status
			end
			return " " .. branch
		end

		---@diagnostic disable-next-line: duplicate-set-field
		statusline.active = function()
			local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
			local git = statusline.section_git()
			local filename = statusline.section_filename({ trunc_width = 140 })
			local fileinfo = statusline.section_fileinfo({ trunc_width = 120 })
			local location = statusline.section_location()
			return statusline.combine_groups({
				{ hl = mode_hl, strings = { mode } },
				{ hl = "MiniStatuslineDevinfo", strings = { git } },
				"%<",
				{ hl = "MiniStatuslineFilename", strings = { filename } },
				"%=",
				{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
				{ hl = mode_hl, strings = { location } },
			})
		end

		-- Keybind hints: shows a popup after 800ms when you pause mid-sequence.
		-- Only fires when you actually forget a binding — never during normal use.
		local clue = require("mini.clue")
		clue.setup({
			triggers = {
				{ mode = "n", keys = "<Leader>" },
				{ mode = "x", keys = "<Leader>" },
				{ mode = "n", keys = "g" },
				{ mode = "n", keys = "'" },
				{ mode = "n", keys = "`" },
				{ mode = "n", keys = '"' },
				{ mode = "i", keys = "<C-r>" },
				{ mode = "c", keys = "<C-r>" },
			},
			clues = {
				clue.gen_clues.g(),
				clue.gen_clues.marks(),
				clue.gen_clues.registers(),
				{ mode = "n", keys = "<Leader>s", desc = "+Search" },
				{ mode = "n", keys = "<Leader>g", desc = "+Git" },
				{ mode = "n", keys = "<Leader>y", desc = "+Yank path" },
				{ mode = "n", keys = "<Leader>d", desc = "+Document" },
				{ mode = "n", keys = "<Leader>w", desc = "+Workspace" },
			},
			window = {
				delay = 0,
				config = { width = "auto" },
			},
		})

		-- ... and there is more!
		--  Check out: https://github.com/echasnovski/mini.nvim
	end,
}
