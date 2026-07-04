vim.lsp.enable("biome")
vim.lsp.enable("vtsls")

vim.lsp.enable("dockerls")
vim.lsp.enable("docker_compose_language_service")
vim.lsp.enable("jsonls")
vim.lsp.enable("yamlls")
vim.lsp.enable("markdown_oxide")

vim.lsp.enable("kotlin_lsp")
vim.lsp.enable("gradle_ls")
vim.lsp.enable("jdtls")

vim.lsp.enable("clangd")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("cmake")
vim.lsp.enable("terraformls")

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          vim.fn.stdpath("config") .. "/lua",
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
vim.lsp.enable("lua_ls")
