-- Keymaps for better default experience

-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- For conciseness
local opts = { noremap = true, silent = true }
local utils = require 'core.utils'

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Allow moving the cursor through wrapped lines with j, k
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Clear highlights
vim.keymap.set('n', '<Esc>', ':noh<CR>', { desc = 'Clear Search Highlights' })

-- Save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', { desc = 'Save File' })

-- Save file without auto-formatting
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', { desc = 'Save Without Formatting' })

-- Quit file
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', { desc = 'Quit' })

-- Delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll Down and Center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll Up and Center' })

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next Search Result' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Prev Search Result' })

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { desc = 'Prev Buffer' })
vim.keymap.set('n', '<leader>x', ':Bdelete!<CR>', { desc = 'Delete Buffer' })
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', { desc = 'New Buffer' })

-- Increment/decrement numbers
vim.keymap.set('n', '<leader>+', '<C-a>', { desc = 'Increment Number' })
vim.keymap.set('n', '<leader>-', '<C-x>', { desc = 'Decrement Number' })

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', { desc = 'Split Vertically' })
vim.keymap.set('n', '<leader>h', '<C-w>s', { desc = 'Split Horizontally' })
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Equal Window Size' })
vim.keymap.set('n', '<leader>xs', ':close<CR>', { desc = 'Close Split' })

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', { desc = 'Go to Upper Window' })
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', { desc = 'Go to Lower Window' })
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', { desc = 'Go to Left Window' })
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', { desc = 'Go to Right Window' })

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', { desc = 'New Tab' })
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', { desc = 'Close Tab' })
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', { desc = 'Next Tab' })
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', { desc = 'Prev Tab' })

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', { desc = 'Toggle Line Wrap' })

-- Press jk fast to exit insert mode
vim.keymap.set('i', 'jk', '<ESC>', { desc = 'Exit Insert Mode' })
vim.keymap.set('i', 'kj', '<ESC>', { desc = 'Exit Insert Mode' })

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', { desc = 'Indent Left' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent Right' })

-- Move text up and down
vim.keymap.set('v', '<A-j>', ':m .+1<CR>==', { desc = 'Move Line Down' })
vim.keymap.set('v', '<A-k>', ':m .-2<CR>==', { desc = 'Move Line Up' })
-- Move line up and down (Normal mode - like VSCode)
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move Line Down' })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move Line Up' })

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', { desc = 'Paste Without Yank' })

-- Replace word under cursor
vim.keymap.set('n', '<leader>j', '*``cgn', { desc = 'Replace Word Under Cursor' })

-- Explicitly yank to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank to System Clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Yank Line to System Clipboard' })

-- Toggle diagnostics
local diagnostics_active = true

vim.keymap.set('n', '<leader>do', function()
  diagnostics_active = not diagnostics_active

  if diagnostics_active then
    vim.diagnostic.enable(0)
  else
    vim.diagnostic.disable(0)
  end
end, { desc = 'Toggle Diagnostics' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Prev Diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next Diagnostic' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show Diagnostic' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostic List' })

-- Session management
vim.keymap.set('n', '<leader>ss', '<cmd>AutoSession save<CR>', { noremap = true, silent = true, desc = 'Save Session' })
vim.keymap.set('n', '<leader>sl', '<cmd>AutoSession search<CR>', { noremap = true, silent = true, desc = 'Load Session Picker' })

-- Writing and wrapping
vim.keymap.set('v', '<leader>rp', "<Esc><Cmd>lua require('core.utils').wrap_in_chars('(')<CR>", { desc = 'Wrap with Parentheses' })
vim.keymap.set('v', '<leader>rq', "<Esc><Cmd>lua require('core.utils').wrap_in_chars('\\'')<CR>", { desc = 'Wrap with Single Quotes' })
vim.keymap.set('v', '<leader>rQ', '<Esc><Cmd>lua require("core.utils").wrap_in_chars("\\\"")<CR>', { desc = 'Wrap with Double Quotes' })
vim.keymap.set('v', '<leader>rs', "<Esc><Cmd>lua require('core.utils').wrap_in_chars('[')<CR>", { desc = 'Wrap with Square Brackets' })
vim.keymap.set('v', '<leader>rc', "<Esc><Cmd>lua require('core.utils').wrap_in_chars('{')<CR>", { desc = 'Wrap with Curly Braces' })
vim.keymap.set('v', '<leader>rb', "<Esc><Cmd>lua require('core.utils').wrap_in_chars('`')<CR>", { desc = 'Wrap with Backticks' })
vim.keymap.set('v', '<leader>rh', "<Esc><Cmd>lua require('core.utils').wrap_in_chars('<')<CR>", { desc = 'Wrap with Angle Brackets' })

vim.keymap.set('v', '<leader>mb', "<Esc><Cmd>lua require('core.utils').wrap_in_chars('**')<CR>", { desc = 'Wrap Markdown Bold' })
vim.keymap.set('v', '<leader>mi', "<Esc><Cmd>lua require('core.utils').wrap_in_chars('_')<CR>", { desc = 'Wrap Markdown Italic' })
vim.keymap.set('v', '<leader>mc', "<Esc><Cmd>lua require('core.utils').wrap_in_chars('`')<CR>", { desc = 'Wrap Markdown Code' })

vim.keymap.set('n', '<leader>mcc', function()
  vim.api.nvim_put({
    '```',
    '',
    '```',
  }, 'l', true, true)
  vim.cmd 'normal! kk'
end, { desc = 'Insert Markdown Code Block' })

vim.keymap.set('n', '<leader>ml', function()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { '[Text](Link)' })
  vim.api.nvim_win_set_cursor(0, { row, col + 1 })
end, { desc = 'Insert Markdown Link' })

vim.keymap.set('n', '<leader>mim', function()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { '![Alt](Image)' })
  vim.api.nvim_win_set_cursor(0, { row, col + 2 })
end, { desc = 'Insert Markdown Image' })

vim.keymap.set('n', '<leader>rw', function()
  if vim.wo.wrap then
    vim.opt.wrap = false
    vim.opt.linebreak = false
    vim.opt.breakindent = false
    utils.notify('Soft wrap disabled')
  else
    vim.opt.wrap = true
    vim.opt.linebreak = true
    vim.opt.breakindent = true
    utils.notify('Soft wrap enabled')
  end
end, { desc = 'Toggle Soft Wrap' })

vim.keymap.set('n', '<leader>rf', function()
  vim.fn.setreg('+', vim.fn.expand '%:p')
  utils.notify 'Copied full file path'
end, { desc = 'Copy Full File Path' })

vim.keymap.set('n', '<leader>cw', function()
  utils.count_words()
end, { desc = 'Count Words' })
