-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Theme
  use 'morhetz/gruvbox'

  -- Navbar
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  -- Git diff
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- Color highlighter
  use 'lilydjwg/colorizer'

  -- Singularity highlighter
  use { 'Maik93/singularity.lang' }
end)
