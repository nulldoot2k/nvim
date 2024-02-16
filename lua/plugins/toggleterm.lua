return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require "toggleterm".setup {
      size = 13,
      open_mapping = [[<c-\>]],
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = '1',
      start_in_insert = true,
      persist_size = true,
      direction = 'horizontal'
    }
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)

      vim.keymap.set('t', '<A-j>', [[<Cmd>exec "resize -" . v:count1<CR>]], opts)
      vim.keymap.set('t', '<A-k>', [[<Cmd>exec "resize +" . v:count1<CR>]], opts)
      vim.keymap.set('t', '<A-h>', [[<Cmd>exec "vertical resize -" . v:count1<CR>]], opts)
      vim.keymap.set('t', '<A-l>', [[<Cmd>exec "vertical resize +" . v:count1<CR>]], opts)
    end
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
  end
}
