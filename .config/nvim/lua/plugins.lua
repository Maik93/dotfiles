-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'morhetz/gruvbox'

  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

end)
