return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- Formatting Start
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        -- Formatting End
        --
        -- Diagnostics Start
				null_ls.builtins.diagnostics.eslint,
        -- Dianostics End
        --
        -- Completions Start
				null_ls.builtins.completion.spell,
        -- Completions End
			},

			vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, {}),
		})
	end,
}
