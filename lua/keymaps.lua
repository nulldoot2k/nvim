local map = vim.api.nvim_set_keymap

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>', { desc = "Move cursor up a window" })
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>', { desc = "Move cursor down a window" })
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>', { desc = "Move cursor left a window" })
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>', { desc = "Move cursor right a window" })

map('i', 'jk', '<ESC>', { noremap = true, silent = true })
map('i', 'kj', '<ESC>', { noremap = true, silent = true })

--

map('n', '<S-j>', ':resize -2<CR>', {noremap = true, silent = true})
map('n', '<S-k>', ':resize +2<CR>', {noremap = true, silent = true})
map('n', '<S-h>', ':vertical resize -2<CR>', {noremap = true, silent = true})
map('n', '<S-l>', ':vertical resize +2<CR>', {noremap = true, silent = true})

map('n', '|', ':vsplit<CR>', { noremap = true, silent = true, desc = "Vertical Split" })
map('n', '\\', ':split<CR>', { noremap = true, silent = true, desc = "Horizontal Split" })

map('n', 'r', ':redo<CR>', { noremap = true, silent = true, desc = "Redo" })
map('n', 'u', ':undo<CR>', { noremap = true, silent = true, desc = "Undo" })

map('n', '<Tab>', ':bnext<CR>', {noremap = true, silent = true})
map('n', '<S-Tab>', ':bprevious<CR>', {noremap = true, silent = true})
map('n', '<leader>w', ':w<CR>', {noremap = true, silent = true})
map('n', 'q', ':q<CR>', {noremap = true, silent = true})

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Copy and Paste
-- if os.getenv("WSL_DISTRO_NAME") ~= nil then
--   vim.keymap.set({ "n", "x" }, "<leader>y", [["+y]]) -- copy to system clipboard
--   vim.keymap.set({ "n", "x" }, "<leader>p", [["+p]]) -- paste from system clipboard
-- end
