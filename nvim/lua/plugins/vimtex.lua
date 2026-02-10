return {
  "lervag/vimtex",
  lazy = false,
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = "zathura"
    -- vim.g.maplocalleader = " " -- Customize local leader key
    vim.o.foldmethod = "expr"
    vim.o.foldexpr = "vimtex#fold#level(v:lnum)"
    vim.o.foldtext = "vimtex#fold#text()"
    vim.o.foldlevel = 2
  end,
}
