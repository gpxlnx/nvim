local M = {}

function M.notify(message, level, timeout)
  vim.notify(message, level or vim.log.levels.INFO, {
    title = 'nvim',
    timeout = timeout or 2000,
  })
end

vim.api.nvim_create_user_command('Notify', function(opts)
  local message = opts.fargs[1] or 'NO MESSAGE'
  local level = opts.fargs[2] or vim.log.levels.INFO
  local timeout = tonumber(opts.fargs[3]) or 2000

  M.notify(message, level, timeout)
end, {
  nargs = '*',
  desc = 'Show a Neovim notification',
})

function M.count_words()
  local bufnr = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local content = table.concat(lines, ' ')
  local _, count = content:gsub('%S+', '')

  M.notify('Words: ' .. count)
end

vim.api.nvim_create_user_command('CountWords', function()
  M.count_words()
end, {
  desc = 'Count words in the current buffer',
})

function M.wrap_in_chars(left, right)
  local pairs = {
    ['('] = ')',
    ['['] = ']',
    ['{'] = '}',
    ['<'] = '>',
    ["'"] = "'",
    ['"'] = '"',
    ['`'] = '`',
    ['«'] = '»',
    ['“'] = '”',
    ['‘'] = '’',
    ['‹'] = '›',
  }

  left = left and vim.trim(left) or ''
  right = right and vim.trim(right) or ''

  if left == '' then
    M.notify('Provide the wrapping characters.', vim.log.levels.WARN)
    return
  end

  right = right ~= '' and right or pairs[left] or left

  local bufnr = vim.api.nvim_get_current_buf()
  local start_row, start_col = unpack(vim.api.nvim_buf_get_mark(bufnr, '<'))
  local end_row, end_col = unpack(vim.api.nvim_buf_get_mark(bufnr, '>'))

  if start_row == end_row and start_col == end_col then
    M.notify('Empty or invalid selection.', vim.log.levels.WARN)
    return
  end

  local end_line = vim.api.nvim_buf_get_lines(bufnr, end_row - 1, end_row, false)[1]
  if end_line and end_col > #end_line then
    end_col = #end_line
  end

  local lines = vim.api.nvim_buf_get_text(bufnr, start_row - 1, start_col, end_row - 1, end_col + 1, {})

  lines[1] = left .. lines[1]
  lines[#lines] = lines[#lines] .. right

  vim.api.nvim_buf_set_text(bufnr, start_row - 1, start_col, end_row - 1, end_col + 1, lines)
  M.notify('Wrapped selection with ' .. left .. right)
end

vim.api.nvim_create_user_command('WrapIn', function(opts)
  local left = opts.fargs[1]
  local right = opts.fargs[2]

  M.wrap_in_chars(left, right)
end, {
  nargs = '*',
  range = true,
  desc = 'Wrap the visual selection in the provided characters',
})

vim.api.nvim_create_user_command('Rename', function(opts)
  local old_name = vim.fn.expand '%:p'
  local new_name = vim.fn.fnamemodify(opts.args, ':p')

  if old_name == new_name then
    M.notify('New name matches the current file.', vim.log.levels.WARN)
    return
  end

  vim.cmd('saveas ' .. vim.fn.fnameescape(new_name))
  vim.cmd('bd ' .. vim.fn.fnameescape(old_name))
  vim.cmd('silent !rm ' .. vim.fn.shellescape(old_name))
end, {
  nargs = 1,
  complete = 'file',
  desc = 'Rename the current file',
})

return M
