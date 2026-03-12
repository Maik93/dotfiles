-- Utility plugins
return {
  -- Color highlighter
  {
    "lilydjwg/colorizer",
    event = "VeryLazy",
  },
  
  -- Singularity language support
  {
    "Maik93/singularity.lang",
    event = "VeryLazy",
  },
  
  -- Git diff (currently disabled - uncomment to enable)
  -- {
  --   "sindrets/diffview.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim"
  --   },
  --   event = "VeryLazy",
  -- },
}
