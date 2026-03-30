return {
  -- Presentations inside Neovim
  'aspeddro/slides.nvim',
  event = 'BufEnter',
  config = function()
    require('slides').setup {
      bin = 'slides',   -- path to binary
      fullscreen = true, -- open in fullscreen
    }
  end,
}
