return {
  --   -- which-key has e.g of using using autocmd event VimEnter
  --   -- which-key has e.g of `config` which only runs after plugin has loaded
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      -- require('which-key').register {
      --   ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      --   ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
      --   ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
      --   ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
      --   ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      -- }
      require('which-key').add {
        { '<leader>c', group = '[C]ode' },
        { '<leader>c_', hidden = true },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>d_', hidden = true },
        { '<leader>r', group = '[R]ename' },
        { '<leader>r_', hidden = true },
        { '<leader>s', group = '[S]earch' },
        { '<leader>s_', hidden = true },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>1', hidden = true },
        { '<leader>2', hidden = true },
        { '<leader>3', hidden = true },
        { '<leader>4', hidden = true },
        { '<leader>5', hidden = true },
      }
    end,
  },
}
