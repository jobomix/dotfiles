return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"marilari88/neotest-vitest",
		"nvim-neotest/neotest-python",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("neotest").setup({
			log_level = vim.log.levels.DEBUG,
			adapters = {
				require("neotest-vitest"),
				require("neotest-python"),
			},
		})
	end,

	vim.keymap.set(
		"n",
		"<leader>tm",
		':lua require("neotest").run.run()<CR>',
		{ desc = "Run test [m]ethod above the cursor", noremap = true, silent = true }
	),
	vim.keymap.set(
		"n",
		"<leader>to",
		':lua require("neotest").output.open()<CR>',
		{ desc = "Open test [o]utput", noremap = true, silent = true }
	),

	vim.keymap.set(
		"n",
		"<leader>td",
		':lua require("neotest").run.run({strategy = "dap"})<CR>',
		{ desc = "[D]ebug test", noremap = true, silent = true }
	),

	vim.keymap.set(
		"n",
		"<leader>tf",
		':lua require("neotest").run.run(vim.fn.expand("%"))<CR>',
		{ desc = "Run all tests in [F]ile", noremap = true, silent = true }
	),
}
