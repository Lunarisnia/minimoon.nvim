return {
  "lewis6991/satellite.nvim",
  event = "BufReadPost",
  opts = {
    current_only = false,
    winblend = 50,
    zindex = 40,
    excluded_filetypes = { "neo-tree", "lazy", "mason", "help" },
    handlers = {
      cursor = { enable = true },
      diagnostic = { enable = true },
      gitsigns = { enable = true },
      search = { enable = true },
    },
  },
}
