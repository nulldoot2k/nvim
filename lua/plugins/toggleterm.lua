return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    local toggleterm = require("toggleterm")
    local Terminal = require("toggleterm.terminal").Terminal

    -- Define a float terminal (ID 1)
    local float_term = Terminal:new({
      direction = "float",
      size = function() return vim.o.columns * 0.4 end,
      float_opts = {
        border = 'single',
        width = function() return math.floor(vim.o.columns * 0.8) end,
        height = function() return math.floor(vim.o.lines * 0.8) end,
        winblend = 3,
        zindex = 10,
        title_pos = 'center',
      },
      on_open = function(t)
        vim.cmd("startinsert!")
      end,
      close_on_exit = true,
      id = 1,
    })

    -- Define a horizontal terminal (ID 2)
    local horizontal_term = Terminal:new({
      direction = "horizontal",
      size = 15,
      on_open = function(t)
        vim.cmd("startinsert!")
      end,
      close_on_exit = true,
      id = 2,
    })

    -- Base setup
    toggleterm.setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        elseif term.direction == "float" then
          return vim.o.columns * 0.4
        end
      end,
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = '1',
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      persist_mode = true,
      close_on_exit = true,
      shell = vim.o.shell,
      auto_scroll = true,
    })

    -- Toggle functions for each terminal
    local function toggle_float_term()
      float_term:toggle()
    end

    local function toggle_horizontal_term()
      horizontal_term:toggle()
    end

    local function toggle_vertical_term()
      vertical_term:toggle()
    end

    -- Function to set terminal keymaps
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

    -- Keybindings
    vim.keymap.set('n', [[<c-\>]], toggle_float_term, { noremap = true, silent = true }) -- Float
    vim.keymap.set('n', '<F5>', toggle_horizontal_term, { noremap = true, silent = true }) -- Horizontal
  end
}
