return {
  {
    'gxavier/omtheme',
    dir = vim.fn.stdpath 'config',
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true
      vim.cmd.colorscheme 'omtheme'
    end,
  },
}
