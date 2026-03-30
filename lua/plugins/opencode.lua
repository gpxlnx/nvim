return {
  'NickvanDyke/opencode.nvim',
  version = '*',
  dependencies = {
    {
      'folke/snacks.nvim',
      optional = true,
      opts = {
        input = {},
        picker = {
          actions = {
            opencode_send = function(...) return require('opencode').snacks_picker_send(...) end,
          },
          win = {
            input = {
              keys = {
                ['<a-a>'] = { 'opencode_send', mode = { 'n', 'i' } },
              },
            },
          },
        },
        terminal = {},
      },
    },
  },
  config = function()
    local opencode_cmd = 'opencode --port'

    ---@type snacks.terminal.Opts
    local snacks_terminal_opts = {
      win = {
        position = 'right',
        width = 0.4,
        enter = false,
        on_win = function(win)
          require('opencode.terminal').setup(win.win)
        end,
      },
    }

    ---@type opencode.Opts
    vim.g.opencode_opts = {
      server = {
        start = function()
          require('snacks.terminal').open(opencode_cmd, snacks_terminal_opts)
        end,
        stop = function()
          require('snacks.terminal').get(opencode_cmd, snacks_terminal_opts):close()
        end,
        toggle = function()
          require('snacks.terminal').toggle(opencode_cmd, snacks_terminal_opts)
        end,
      },
    }

    -- Required for auto_reload
    vim.o.autoread = true

    -- Keymaps
    vim.keymap.set({ 'n', 'x' }, '<leader>aa', function()
      require('opencode').ask('@this: ', { submit = true })
    end, { desc = 'Ask OpenCode' })

    vim.keymap.set({ 'n', 'x' }, '<leader>ax', function()
      require('opencode').select()
    end, { desc = 'OpenCode Actions' })

    vim.keymap.set({ 'n', 'x' }, '<leader>ap', function()
      require('opencode').prompt('@this')
    end, { desc = 'Prompt OpenCode' })

    vim.keymap.set('n', '<leader>at', function()
      require('opencode').toggle()
    end, { desc = 'Toggle OpenCode' })

    -- Prompts da biblioteca
    vim.keymap.set({ 'n', 'x' }, '<leader>ae', function()
      require('opencode').prompt('explain')
    end, { desc = 'Explain Code' })

    vim.keymap.set({ 'n', 'x' }, '<leader>ao', function()
      require('opencode').prompt('optimize')
    end, { desc = 'Optimize Code' })

    vim.keymap.set({ 'n', 'x' }, '<leader>ad', function()
      require('opencode').prompt('document')
    end, { desc = 'Document Code' })

    vim.keymap.set({ 'n', 'x' }, '<leader>aT', function()
      require('opencode').prompt('test')
    end, { desc = 'Generate Tests' })

    vim.keymap.set({ 'n', 'x' }, '<leader>ar', function()
      require('opencode').prompt('review')
    end, { desc = 'Review Code' })

    vim.keymap.set('n', '<leader>aD', function()
      require('opencode').prompt('diagnostics')
    end, { desc = 'Explain Diagnostics' })

    vim.keymap.set('n', '<leader>af', function()
      require('opencode').prompt('fix')
    end, { desc = 'Fix Diagnostics' })

    vim.keymap.set('n', '<leader>ag', function()
      require('opencode').prompt('diff')
    end, { desc = 'Review Git Diff' })

    -- Session commands (nova API: pontos em vez de underscores)
    vim.keymap.set('n', '<leader>an', function()
      require('opencode').command('session.new')
    end, { desc = 'New Session' })

    vim.keymap.set('n', '<leader>as', function()
      require('opencode').command('session.share')
    end, { desc = 'Share Session' })

    vim.keymap.set('n', '<leader>ai', function()
      require('opencode').command('session.interrupt')
    end, { desc = 'Interrupt Session' })

    vim.keymap.set('n', '<leader>ac', function()
      require('opencode').command('session.compact')
    end, { desc = 'Compact Session' })

    -- Navigation commands (nova API)
    vim.keymap.set('n', '<leader>au', function()
      require('opencode').command('session.half.page.up')
    end, { desc = 'Scroll Up' })

    vim.keymap.set('n', '<leader>aj', function()
      require('opencode').command('session.half.page.down')
    end, { desc = 'Scroll Down' })

    -- Listen for opencode events (novo padrão: OpencodeEvent:*)
    vim.api.nvim_create_autocmd('User', {
      pattern = 'OpencodeEvent:*',
      callback = function(args)
        if args.data.event.type == 'session.idle' then
          vim.notify('OpenCode finished responding', vim.log.levels.INFO)
        end
      end,
    })
  end,
}
