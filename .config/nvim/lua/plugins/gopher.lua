return {
  "olexsmir/gopher.nvim",
  requires = { -- dependencies
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  commands = {
    go = "go",
    gomodifytags = "gomodifytags",
    gotests = "~/go/bin/gotests", -- also you can set custom command path
    impl = "impl",
    iferr = "iferr",
  },
}
