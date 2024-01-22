 return {
  "lewis6991/gitsigns.nvim",
  requires = {
    "nvim-lua/plenary.nvim",
  },
   config = function ()
      require("gitsigns").setup({
       on_attach = function(bufnr)
         local gs = package.loaded["gitsigns"]
         vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { buffer = bufnr })
       end,
     })
   end
 }
