return {
  'rmagatti/auto-session',
  lazy = false,
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    enabled = true,
    auto_save = true,
    auto_restore = true,
    auto_create = true,
    git_use_branch_name = true,
    legacy_cmds = true,
    suppressed_dirs = { '~/', '/', '~/Downloads' },
    close_filetypes_on_save = { 'checkhealth' },
    close_unsupported_windows = true,
    root_dir = vim.fn.stdpath 'data' .. '/sessions/',
    show_auto_restore_notif = false,
    session_lens = {
      load_on_setup = true,
      picker = 'telescope',
      previewer = 'summary',
    },
  },
}
