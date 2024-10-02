-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '«', vim.diagnostic.goto_prev, { desc = 'Go to prev [D]iagnostic msg' })
vim.keymap.set('n', '»', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic msg' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Diagnostic [E]rror msgs' })
vim.keymap.set('n', '<leader>f', vim.diagnostic.setloclist, { desc = 'Diagnostic quick[F]ix list' })

-- NOTE: exit from build-in terminal mode (May not work) default is <C-\><C-n>
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Shift+arrows to move between windows
vim.keymap.set('n', '<S-Left>', '<C-w><C-h>')
vim.keymap.set('n', '<S-Down>', '<C-w><C-j>')
vim.keymap.set('n', '<S-Up>', '<C-w><C-k>')
vim.keymap.set('n', '<S-Right>', '<C-w><C-l>')
vim.keymap.set('i', '<S-Left>', '<C-o><C-w><C-h>')
vim.keymap.set('i', '<S-Down>', '<C-o><C-w><C-j>')
vim.keymap.set('i', '<S-Up>', '<C-o><C-w><C-k>')
vim.keymap.set('i', '<S-Right>', '<C-o><C-w><C-l>')

--pane/window/terminal-pane management
vim.keymap.set('n', "<M-S-'>", ':vs<CR>', { silent = true })
vim.keymap.set('i', "<M-S-'>", '<Esc>:vs<CR>', { silent = true })
vim.keymap.set('n', '<M-S-5>', ':sp<CR>', { silent = true })
vim.keymap.set('i', '<M-S-5>', '<Esc>:sp<CR>', { silent = true })
vim.keymap.set('n', '<M-Space>', ':sp<CR>:terminal<CR>', { silent = true })
vim.keymap.set('n', '<M-CR>', ':vs<CR>:terminal<CR>', { silent = true })
vim.keymap.set('n', '<M-S-=>', '<C-w>+', { silent = true })
vim.keymap.set('n', '<M-->', '<C-w>-', { silent = true })
vim.keymap.set('n', '<M-S-,>', '<C-w><', { silent = true })
vim.keymap.set('n', '<M-S-.>', '<C-w>>', { silent = true })
vim.keymap.set('n', '<C-Tab>', ':+tabn<CR>', { silent = true })
vim.keymap.set('n', '<C-S-Tab>', ':-tabn<CR>', { silent = true })
vim.keymap.set('n', '<M-c>', ':tabnew<CR>:terminal<CR>', { silent = true })
vim.keymap.set({ 'n', 't' }, '<M-1>', '<C-\\><C-n>:1tabn<CR>', { silent = true })
vim.keymap.set({ 'n', 't' }, '<M-2>', '<C-\\><C-n>:2tabn<CR>', { silent = true })
vim.keymap.set({ 'n', 't' }, '<M-3>', '<C-\\><C-n>:3tabn<CR>', { silent = true })
vim.keymap.set({ 'n', 't' }, '<M-4>', '<C-\\><C-n>:4tabn<CR>', { silent = true })
vim.keymap.set({ 'n', 't' }, '<M-5>', '<C-\\><C-n>:5tabn<CR>', { silent = true })
vim.keymap.set({ 'n', 't' }, '<M-6>', '<C-\\><C-n>:6tabn<CR>', { silent = true })
vim.keymap.set({ 'n', 't' }, '<M-7>', '<C-\\><C-n>:7tabn<CR>', { silent = true })
vim.keymap.set({ 'n', 't' }, '<M-8>', '<C-\\><C-n>:8tabn<CR>', { silent = true })
vim.keymap.set({ 'n', 't' }, '<M-9>', '<C-\\><C-n>:$tabn<CR>', { silent = true })

-- ctrl+f4 => :q (mainly to quickly close windows)
vim.keymap.set('n', '<F28>', ':q<CR>', { silent = true })
vim.keymap.set('t', '<F28>', '<C-\\><C-n>:q<CR>', { silent = true })

-- C-BackSpace (as gui editors) for insert mode
vim.keymap.set('i', '<C-BS>', '<C-o>dF<space>')
-- C-BS is the same as   (window commands) Guess I can live without next line
vim.keymap.set('n', '<C-BS>', 'dF<space>')

-- C-Delete delete word backwards
vim.keymap.set('n', '<C-Del>', 'daw')
vim.keymap.set('i', '<C-Del>', '<C-o>daw')

-- faster switch to cmd mode. I got used to it
vim.keymap.set({ 'n', 'v' }, ';', ':')
vim.keymap.set({ 'n', 'v' }, ':', ';')

-- plugin keymaps
vim.keymap.set('n', '-', ':lua MiniFiles.open()<cr>', { desc = '', silent = true })
vim.keymap.set('n', '<leader>o', '<cmd>AerialToggle! float<CR>')

-- stuff stolen from theprimeagen
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
---- greatest remap ever
vim.keymap.set('x', '<leader>p', [["_dP]])
---- next greatest remap ever : asbjornHaland
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

-- LuaSnip reload function
function _G.reload_luasnips()
  local ls = require 'luasnip'
  ls.cleanup() -- Clear old snippets
  require('luasnip.loaders.from_lua').load { paths = '~/.config/nvim/lua/snips' }
  print 'LuaSnip snippets reloaded!' -- Optional confirmation message
end

vim.keymap.set('n', '<leader>rs', ':lua reload_luasnips()<CR>', { noremap = true, silent = true })
-- this is
-- this is test line
-- this is test line
--
-- this is test line
-- vim.keymap.set('i', '<C-h>', '<C-w>')
-- vim.keymap.set('c', '<C-BS>', '<C-w>')
-- vim.keymap.set('c', '<C-H>', '<C-w>')
