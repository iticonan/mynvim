return {
  'SmiteshP/nvim-navic',
  dependencies = { 'neovim/nvim-lspconfig' }, -- Ensure LSP is loaded
  config = function()
    local navic = require 'nvim-navic'

    -- Custom icons (modify these to your preference)
    local icons = {
      -- Module = ' ',
      -- Package = ' ',
      -- Array = ' ',
      -- Object = ' ',
      File = '📄',
      Module = '🗃️',
      Namespace = '%#Namespace#Ⓝ',
      Package = '📦',
      Class = '%#Type#󰌗',
      Method = '',
      Property = ' ',
      Field = '%#Field#',
      Constructor = ' ',
      Enum = ' ',
      Interface = ' ',
      Function = '%#Function#⨍',
      Variable = '%#Field# ',
      Constant = '',
      String = '🔤',
      Number = '🔢',
      Boolean = '◑',
      Array = '',
      Object = '',
      Key = '󰌋',
      Null = '∅',
      EnumMember = '%#Type# ',
      Struct = '%#Type# ',
      Event = '',
      Operator = ' ',
      TypeParameter = '',
    }

    navic.setup {
      icons = icons,
      highlight = true,
      separator = '〉',
      depth_limit = 0,
      depth_limit_indicator = '..',
    }

    -- Auto-attach to LSP clients that support symbols
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.server_capabilities.documentSymbolProvider then
          navic.attach(client, args.buf)
        end
      end,
    })

    -- Apply to all LSP clients (optional)
    require('lspconfig').util.default_config.on_attach = on_attach
  end,
}
