-- config: dankreiger

--------------------------------

-- Enable nerd font
vim.g.have_nerd_font = true

vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true

-- Local shortcut to set key mappings
local keyMapSet = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Set space as the leader key (already defined in parent)
-- vim.g.mapleader = ' '
-- keyMapSet('n', '<Space>', '', {})

-- Select all text
keyMapSet('n', '<leader>a', 'ggVG', { silent = true })
keyMapSet('n', '<C-a>', 'a', { silent = true })

-- Close buffers with leader + q
keyMapSet('n', '<leader>q', ':bd<CR>', opts)

-- NERDTree toggling
keyMapSet('n', '<leader>n', ':NERDTreeToggle<CR>', opts)

-- Undotree toggling
keyMapSet('n', '<leader>u', ':UndotreeToggle<CR>', opts)

-- Telescope mappings
local builtin = require 'telescope.builtin'
keyMapSet('n', '<leader>ff', builtin.find_files, {})
keyMapSet('n', '<leader>fg', builtin.live_grep, {})
keyMapSet('n', '<leader>fb', builtin.buffers, {})
keyMapSet('n', '<leader>fh', builtin.help_tags, {})

-- Line movement mappings
keyMapSet('n', '<M-Up>', ':m .-2<CR>==', opts)
keyMapSet('i', '<M-Up>', '<Esc>:m .-2<CR>==gi', opts)
keyMapSet('v', '<M-Up>', ":m '<-2<CR>gv=gv", opts)

keyMapSet('n', '<M-Down>', ':m .+1<CR>==', opts)
keyMapSet('i', '<M-Down>', '<Esc>:m .+1<CR>==gi', opts)
keyMapSet('v', '<M-Down>', ":m '>+1<CR>gv=gv", opts)

-- Move visual block up and down
keyMapSet('v', 'J', ":m '>+1<CR>gv=gv", opts)
keyMapSet('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- Interactive Rebase mappings
keyMapSet('n', '<leader>ri', ':G rebase -i<CR>', opts)
keyMapSet('n', '<leader>rp', ':G rebase -i HEAD~1<CR>', opts)

keyMapSet('n', '<leader>ps', ':%s/\\cpick/squash/gc<CR>', { noremap = true, silent = true })

-- Open Terminal in Split
vim.api.nvim_create_user_command('Term', function()
  vim.cmd 'split'
  vim.cmd 'terminal'
  vim.cmd 'resize 20'
  vim.cmd 'startinsert'
end, {})

-- Automatically create missing directories when saving a file
vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('auto_create_dir', { clear = true }),
  callback = function(event)
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
  end,
})
