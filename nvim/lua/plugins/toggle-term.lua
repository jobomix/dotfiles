return {
  "akinsho/toggleterm.nvim",
  version = "*",
  lazy = false,
  opts = {
    float_opts = {
      border = "curved",
    },
    open_mapping = [[<c-n>]],
    on_open = function(term)
      vim.cmd("startinsert!")
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
    -- function to run on closing the terminal
    on_close = function(term)
      vim.cmd("startinsert!")
    end,
  },
  keys = {
    { "<leader>Ta", "<cmd>ToggleTermToggleAll<cr>", desc = "Toggle all terminals" },
  },
}
