return {
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<S-left>', '<cmd>TmuxNavigateLeft<cr>' },
      { '<S-down>', '<cmd>TmuxNavigateDown<cr>' },
      { '<S-up>', '<cmd>TmuxNavigateUp<cr>' },
      { '<S-right>', '<cmd>TmuxNavigateRight<cr>' },
      { '<m-s-\\>', '<cmd>TmuxNavigatePrevious<cr>' },
    },
  },
}
