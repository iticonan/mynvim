return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()
      local function map(lhs, rhs, opts)
        vim.keymap.set('n', lhs, rhs)
      end
      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end, { desc = '[A]dd this buffer to harpoon list' })
      vim.keymap.set('n', '<leader>m', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'harpoon [M]arks list' })
      map('<leader>1', function()
        harpoon:list():select(1)
      end)
      map('<leader>2', function()
        harpoon:list():select(2)
      end)
      map('<leader>3', function()
        harpoon:list():select(3)
      end)
      map('<leader>4', function()
        harpoon:list():select(4)
      end)
      map('<leader>5', function()
        harpoon:list():select(5)
      end)
    end,
  },
}
