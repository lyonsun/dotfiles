return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    table.insert(opts.ensure_installed, "black")
    table.insert(opts.ensure_installed, "svelte-language-server")
  end,
}
