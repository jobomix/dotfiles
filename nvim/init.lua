require("config.lazy")
require("config.lsps")

vim.opt.number = true
vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "gar", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
vim.keymap.set("n", "gaa", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set({ "x" }, "[n", function()
  require("vim.treesitter._select").select_prev(vim.v.count1)
end, { desc = "Select previous treesitter node" })

vim.keymap.set({ "x" }, "]n", function()
  require("vim.treesitter._select").select_next(vim.v.count1)
end, { desc = "Select next treesitter node" })

vim.keymap.set({ "x", "o" }, "an", function()
  if vim.treesitter.get_parser(nil, nil, { error = false }) then
    require("vim.treesitter._select").select_parent(vim.v.count1)
  else
    vim.lsp.buf.selection_range(vim.v.count1)
  end
end, { desc = "Select parent treesitter node or outer incremental lsp selections" })

vim.keymap.set({ "x", "o" }, "in", function()
  if vim.treesitter.get_parser(nil, nil, { error = false }) then
    require("vim.treesitter._select").select_child(vim.v.count1)
  else
    vim.lsp.buf.selection_range(-vim.v.count1)
  end
end, { desc = "Select child treesitter node or inner incremental lsp selections" })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
