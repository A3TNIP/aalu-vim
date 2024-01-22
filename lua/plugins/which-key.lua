return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")
		local mappings = {
			f = {
        name = "File",
				g = { "Live GREP" },
        f = "Format File",
			},
			c = {
				name = "Code",
				a = { "Code Action" },
			},
      g = {
        f = { "Format" },
      },
      ["D"] = "Type Definition"
		}
		wk.register(mappings, { prefix = "<leader>" })
	end,
	opts = {

		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
}
