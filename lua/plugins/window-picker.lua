return { -- windows click open file
  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    config = function()
      require'window-picker'.setup()
    end
  }
}
