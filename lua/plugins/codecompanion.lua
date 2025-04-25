return {
  "olimorris/codecompanion.nvim",
  opts = {},
  dependencies = {
    "zbirenbaum/copilot.lua",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<leader>A", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle AI Assistant" },
  },
}
