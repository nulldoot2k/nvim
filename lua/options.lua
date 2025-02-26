local g = vim.g
local o = vim.opt

-- Enable relative line numbers
o.nu = true
o.rnu = true

-- Set tabs to 2 spaces
o.tabstop = 2
o.softtabstop = 2
o.expandtab = true

-- Enable auto indenting and set it to spaces
o.smartindent = true
o.shiftwidth = 2

-- Enable smart indenting
o.breakindent = true

-- Enable incremental searching
o.incsearch = true
o.hlsearch = true

-- Disable text wrap
o.wrap = true

-- Set leader key to space
g.mapleader = " "
g.maplocalleader = " "

-- Better splitting
o.splitbelow = true
o.splitright = true

-- Enable mouse mode
o.mouse = "a"

-- Enable ignorecase + smartcase for better searching
o.ignorecase = true
o.smartcase = true

-- Decrease updatetime to 200ms
o.updatetime = 50

-- Set completeopt to have a better completion experience
o.completeopt = { "menuone", "noselect" }

-- Enable persistent undo history
o.undofile = true

-- Enable 24-bit color
o.termguicolors = true

-- Enable Grid
o.cursorcolumn = true

-- Enable the sign column to prevent the screen from jumping
o.signcolumn = "yes"

-- Copy
local function is_wsl()
  local uname = vim.loop.os_uname()
  local release = uname.release:lower()
  return release:find("microsoft") ~= nil
end
if is_wsl() then
  -- WSL2/Powershell
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = true,
  }
else
  -- Ubuntu
  vim.g.clipboard = {
    name = "xclip",
    copy = {
      ["+"] = "xclip -selection clipboard",
      ["*"] = "xclip -selection primary",
    },
    paste = {
      ["+"] = "xclip -selection clipboard -o",
      ["*"] = "xclip -selection primary -o",
    },
    cache_enabled = false,
  }
end
vim.o.clipboard = "unnamedplus"
-- End Copy

-- Enable cursor line highlight
o.cursorline = true

-- Set fold settings
-- These options were reccommended by nvim-ufo
-- See: https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
o.foldcolumn = "0"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true

-- Always keep 8 lines above/below cursor unless at start/end of file
o.scrolloff = 8

-- Other
g.markdown_recommended_style = 0
g.ui_notifications_enabled = true
g.icons_enabled = true
g.diagnostics_mode = 3
g.autopairs_enabled = true
g.cmp_enabled = true
g.lsp_handlers_enabled = true
g.codelens_enabled = true
o.viewoptions:remove "curdir"
o.shortmess:append { s = true, I = true }
o.backspace:append { "nostop" }
o.cmdheight = 0
o.copyindent = true
o.fileencoding = "utf-8"
o.fillchars = { eob = " ", fold = " ", vert = " " }
o.infercase = true
o.laststatus = 3
o.linebreak = true
o.preserveindent = true
o.pumheight = 10
o.relativenumber = true
o.showmode = false
o.showtabline = 2
o.sidescrolloff = 8
o.autoindent = true
o.timeoutlen = 500
o.virtualedit = "block"
o.writebackup = false

vim.opt.guicursor = {
  "n-v-c:block",                                  -- Normal, visual, command-line: block cursor
  "i-ci-ve:ver25",                                -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
  "r-cr:hor20",                                   -- Replace, command-line replace: horizontal bar cursor with 20% height
  "o:hor50",                                      -- Operator-pending: horizontal bar cursor with 50% height
  "a:blinkwait700-blinkoff400-blinkon250",        -- All modes: blinking settings
  "sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch: block cursor with specific blinking settings
}
