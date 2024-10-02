return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local breadcrump_sep = '/'
      require('lualine').setup {
        options = {
          globalstatus = true,
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = {
            {
              'filename',
              path = 1,
              separator = vim.trim(breadcrump_sep),
              fmt = function(str)
                local path_separator = package.config:sub(1, 1)
                return str:gsub(path_separator, breadcrump_sep)
              end,
            },
            {
              'navic',
              -- Component specific options
              color_correction = nil, -- Can be nil, "static" or "dynamic". This option is useful only when you have highlights enabled.
              navic_opts = {
                icons = {
                  File = '󰈙',
                  Module = '',
                  Namespace = '󰌗',
                  Package = '',
                  Class = '󰌗',
                  Method = '󰆧',
                  Property = '',
                  Field = ' ',
                  Constructor = '',
                  Enum = '󰕘',
                  Interface = '󰕘',
                  Function = '󰊕',
                  Variable = '󰆧',
                  Constant = '󰏿',
                  String = '󰀬 ',
                  Number = '󰎠',
                  Boolean = '◩',
                  Array = '󰅪',
                  Object = '󰅩',
                  Key = '󰌋 ',
                  Null = '󰟢',
                  EnumMember = ' ',
                  Struct = '󰌗',
                  Event = ' ',
                  Operator = '󰆕 ',
                  TypeParameter = '󰊄 ',
                },
                separator = ' > ',
                depth_limit = 3,
                depth_limit_indicator = '..',
              },
            },
          },
          lualine_c = {},
          lualine_x = { 'lsp_progress' },
          lualine_y = {
            'diagnostics',
            {
              'encoding',
              cond = function()
                -- UTF-8 is the de-facto standard encoding and is what
                -- most users expect by default. There's no need to
                -- show encoding unless it's something else.
                local fenc = vim.opt.fenc:get()
                return string.len(fenc) > 0 and string.lower(fenc) ~= 'utf-8'
              end,
            },
            'filetype',
            'fileformat',
            'progress',
          },
          lualine_z = { 'location' },
        },
      }
    end,
    options = { theme = 'gruvbox' },
  },
}
