-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  vim.keymap.set('n', '<A-n>', '<cmd>bnext<CR>'),
  vim.keymap.set('n', '<A-p>', '<cmd>bprevious<CR>'),

  vim.keymap.set('n', '<leader>mr', ':lua require("neotest").run.run()<CR>', { noremap = true, silent = true }),
  vim.keymap.set('n', '<leader>mo', ':lua require("neotest").output.open()<CR>', { noremap = true, silent = true }),

  vim.keymap.set('n', '<leader>ve', function()
    local venv = vim.fn.system { 'poetry', 'env', 'info', '-p' }
    local path = string.format('%s/bin/python', string.gsub(venv, '%c', ''))
    vim.cmd.PyrightSetPythonPath(path)
    -- vim.cmd.PyrightSetPythonPath '/home/nono/.cache/pypoetry/virtualenvs/flwls-users-e_oFCMpB-py3.10/bin/python'
    vim.notify(path)
  end, { desc = 'Activate virtual env from poetry' }),
}
