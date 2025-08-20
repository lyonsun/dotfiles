return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      show_close_icon = false, -- Hides the close icon in the bufferline
      show_buffer_close_icons = false, -- Hides the close icons for individual buffers
    },
  },
  -- https://github.com/LazyVim/LazyVim/pull/6354#issuecomment-3202799735
  init = function()
    local bufline = require("catppuccin.groups.integrations.bufferline")
    function bufline.get()
      return bufline.get_theme()
    end
  end,
}
