return {
  --   -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  --   -- Use `opts = {}` is equivalent to: require('comment').setup({})
  --   -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
  { -- to see what colorschemes are already installed, use `:Telescope colorscheme`.
    'dasupradyumna/midnight.nvim',
    name = 'midnight',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'midnight'
      --  vim.cmd.hi 'Comment gui=none' --(kickstart example of configuring highlights)
    end,
  },
  { -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  --   { -- navigation breadcrumbs
  --     'SmiteshP/nvim-navic',
  --     dependencies = { 'neovim/nvim-lspconfig' },
  --     opts = {
  --       lsp = {
  --         auto_attach = true,
  --         preference = nil,
  --       },
  --     },
  --   },
}
