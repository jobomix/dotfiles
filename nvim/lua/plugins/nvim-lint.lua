return {
  -- Linting
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      markdown = { "markdownlint" },
      javascript = { "biomejs", "eslint" },
      typescript = { "biomejs", "eslint" },
      typescriptreact = { "biomejs", "eslint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>L", function()
      lint.try_lint()
    end, { desc = "Toggle [l]inting for the current buffer" })
  end,
}
