return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")

      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })

      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      local angular_cmd =
      { "ngserver", "--stdio", "--tsProbeLocations", "node_modules", "--ngProbeLocations", "node_modules" }

      lspconfig.angularls.setup({
        capabilities = capabilities,
        cmd = angular_cmd,
        on_new_config = function(new_config, new_root_dir)
          new_config.cmd = angular_cmd
        end,
        filetypes = { "typescript", "typescriptreact", "typescript.tsx", "html", "css", "scss" },
      })

      local opts = {}

      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup({})
      vim.keymap.set("n", "<C-F>", ":Lspsaga finder<CR>")
      vim.keymap.set({'n','t'}, '<A-t>', '<cmd>Lspsaga term_toggle<CR>')
      vim.keymap.set({ "n", "i"}, "<A-a>", "<cmd>Lspsaga code_action<CR>")
      vim.keymap.set({"n", "i"}, "<A-h>", "<cmd>Lspsaga hover_doc<CR>")
      vim.keymap.set({"n", "i"}, "<A-d>", "<cmd>Lspsaga peek_definition<CR>")
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvm-tree/nvim-web-devicons',
    },
  }
}
