return {
  {
    'vhyrro/luarocks.nvim',
    priority = 1100, -- We'd like this plugin to load first out of the rest
    config = true, -- This automatically runs `require("luarocks-nvim").setup()`
  },
  {
    'nvim-neorg/neorg',
    dependencies = { 'luarocks.nvim', 'nvim-treesitter/nvim-treesitter' },
    -- put any other flags you wanted to pass to lazy here!
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {},
        },
      }
    end,
  },
}
