local palette = require 'themes.omtheme.palette'

local group = vim.api.nvim_create_augroup('RedundantWhitespaceHighlight', { clear = true })

local M = {}

local function set_highlight()
  vim.api.nvim_set_hl(0, 'RedundantWhitespace', {
    bg = palette.blue_dark,
    undercurl = true,
    sp = palette.blue,
  })
end

local function add_match()
  if vim.w.redundant_whitespace_match then
    return
  end

  vim.w.redundant_whitespace_match = vim.fn.matchadd('RedundantWhitespace', [[\s\+$\| \+\ze\t]], 10)
end

local function remove_match()
  if vim.w.redundant_whitespace_match then
    pcall(vim.fn.matchdelete, vim.w.redundant_whitespace_match)
    vim.w.redundant_whitespace_match = nil
  end
end

function M.setup()
  set_highlight()

  vim.api.nvim_create_autocmd({ 'BufWinEnter', 'WinEnter' }, {
    group = group,
    callback = add_match,
  })

  vim.api.nvim_create_autocmd({ 'BufWinLeave', 'WinLeave' }, {
    group = group,
    callback = remove_match,
  })

  vim.api.nvim_create_autocmd('ColorScheme', {
    group = group,
    callback = function()
      vim.schedule(set_highlight)
    end,
  })
end

return M
