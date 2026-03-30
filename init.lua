require 'core.options' -- Load general options
require 'core.keymaps' -- Load general keymaps
require 'core.snippets' -- Custom code snippets
require 'core.spell' -- Enable multilingual spellcheck for writing and code
require('core.redundant-whitespace').setup() -- Highlight trailing whitespace

-- Install package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require('lazy').setup({
  require 'plugins.themes.omtheme',
  require 'plugins.telescope',
  require 'plugins.treesitter',
  require 'plugins.lsp',
  require 'plugins.autocompletion',
  require 'plugins.none-ls',
  require 'plugins.lualine',
  require 'plugins.bufferline',
  require 'plugins.neo-tree',
  require 'plugins.alpha',
  require 'plugins.debug',
  require 'plugins.gitsigns',
  require 'plugins.database',
  require 'plugins.misc',
  require 'plugins.harpoon',
  -- require 'plugins.avante',
  -- require 'plugins.chatgpt',
  require 'plugins.aerial',
  require 'plugins.vim-tmux-navigator',
  require 'plugins.copilot',
  require 'plugins.opencode',
  require 'plugins.snacks',
  require 'plugins.noice',
  require 'plugins.slides',
  require 'plugins.markdown-preview',
  require 'plugins.auto-session',
}, {
  ui = {
    -- If you have a Nerd Font, set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- Handle Neo-tree opening after plugins are loaded
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    if vim.g.neotree_opened_directory then
      vim.schedule(function()
        local arg = vim.fn.argv(0)
        vim.cmd 'silent! bdelete'
        vim.cmd('Neotree show dir=' .. vim.fn.fnameescape(vim.fn.fnamemodify(arg, ':p')))
      end)
    end
  end,
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
