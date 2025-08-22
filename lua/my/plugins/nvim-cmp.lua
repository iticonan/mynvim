return {
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- condition below skips building regex on windows because has issues
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        config = {
          history = true,
        },
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          -- {
          --   'rafamadriz/friendly-snippets',
          --   config = function()
          --     require('luasnip.loaders.from_vscode').lazy_load()
          --   end,
          -- },
        },
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}
      local no_chars_after = function()
        unpack = unpack or table.unpack
        local row, col = unpack(vim.api.nvim_win_get_cursor(0)) -- Get the current cursor position (row, col)
        local line = vim.api.nvim_get_current_line() -- Get the current line
        return col >= #line -- Check if cursor column is before the end of the line
      end
      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noselect' },

        -- All the info is on `:help ins-completion`
        mapping = cmp.mapping.preset.insert {
          -- Select [n]ext or [p]revious popupMenu Item
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),

          -- rest of backward compatibility. Accept ([y]es) completion
          ['<C-y>'] = cmp.mapping.confirm { select = true },
          --['<CR>'] = cmp.mapping.confirm,

          -- Scroll the documentation window [b]ack / [f]orward
          ['<C-b>'] = cmp.mapping.scroll_docs(4),
          ['<C-f>'] = cmp.mapping.scroll_docs(-4),
          ['<C-down>'] = cmp.mapping.scroll_docs(4),
          ['<C-up>'] = cmp.mapping.scroll_docs(-4),

          -- when cursor at EOL confirms first else entry explicitly selected
          -- NOTE: LSP depending will auto-import or expand snippet .
          ['<Right>'] = cmp.mapping(function(fallback)
            if no_chars_after() then
              cmp.confirm { select = true } -- confirms first when no selection
            elseif cmp.core.view:get_selected_entry() then
              cmp.confirm()
            else
              fallback()
            end
          end),

          ['<Up>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.choice_active() then
              luasnip.change_choice(1)
            else
              fallback()
            end
          end),

          ['<Down>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.choice_active() then
              luasnip.change_choice(-1)
            else
              fallback()
            end
          end),

          -- Manually trigger a completion from nvim-cmp.
          ['<C-Space>'] = cmp.mapping.complete {},

          -- most cross environment way to jump nodes
          ['<Tab>'] = cmp.mapping(function(fallback)
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),

          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = 'lazydev' },
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
          { name = 'buffer', keyword_length = 5 },
        },
      }
    end,
  },
}
