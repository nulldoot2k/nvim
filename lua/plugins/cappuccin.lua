return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin"
      vim.keymap.set("n", "<leader>c", ":colorscheme <C-z><S-Tab>", {})
    end
  }
}
