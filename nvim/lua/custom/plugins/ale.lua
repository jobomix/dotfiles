return {
  "dense-analysis/ale",
  config = function()
    -- Configuration goes here.
    local g = vim.g
    g.ale_python_mypy_auto_poetry = 1
    g.ale_python_mypy_auto_uv = 1
    g.ale_linters = {
      python = { "mypy" },
      typescript = { "eslint" },
    }
  end,
}
