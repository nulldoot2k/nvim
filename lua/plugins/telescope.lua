return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local actions = require("telescope.actions")
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-x>"] = actions.delete_buffer,
            },
          },
          extensions = {
            ["ui-select"] = {
              require("telescope.themes").get_dropdown({}),
            },
          },
          hidden = true,
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<Leader>tg", builtin.live_grep, {})
      vim.keymap.set("n", "<Leader>tc", builtin.git_commits, {})
      vim.keymap.set("n", "<Leader>tb", builtin.git_branches, {})
      vim.keymap.set("n", "<Leader>ts", builtin.git_status, {})
      vim.keymap.set("n", "<Leader>tf", builtin.git_files, {})

      require("telescope").load_extension("ui-select")
    end,
  },
}
