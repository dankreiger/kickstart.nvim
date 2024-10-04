-- Set leader key (assuming Space is your leader key)
vim.g.mapleader = ' '

-- Helper function for creating keymaps
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Existing mappings

-- Quick quit (Space + q)
map('n', '<leader>q', ':q<CR>', { desc = 'Quick quit' })

-- Quick source current file (Space + s + o)
map('n', '<leader>so', ':so %<CR>', { desc = 'Source current file' })

-- Text movement mappings (retained from original config)

-- Move lines up and down in normal mode (Alt + Up/Down Arrow)
map('n', '<M-Up>', ':m .-2<CR>==', { desc = 'Move line up' })
map('n', '<M-Down>', ':m .+1<CR>==', { desc = 'Move line down' })

-- Move lines up and down in insert mode (Alt + Up/Down Arrow)
map('i', '<M-Up>', '<Esc>:m .-2<CR>==gi', { desc = 'Move line up' })
map('i', '<M-Down>', '<Esc>:m .+1<CR>==gi', { desc = 'Move line down' })

-- Move lines up and down in visual mode (Alt + Up/Down Arrow)
map('v', '<M-Up>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })
map('v', '<M-Down>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })

-- Move visual block up and down (J/K in visual mode)
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move visual block down' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move visual block up' })

-- New helpful mappings

-- Save file (Space + w)
map('n', '<leader>w', ':w<CR>', { desc = 'Save file' })

-- UndoTree toggle (Space + u)
map('n', '<leader>u', ':UndotreeToggle<CR>', { desc = 'Toggle UndoTree' })

-- Better window navigation (Ctrl + h/j/k/l)
map('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Move to top window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- Resize with arrows (Ctrl + Arrow keys)
map('n', '<C-Up>', ':resize -2<CR>', { desc = 'Resize window up' })
map('n', '<C-Down>', ':resize +2<CR>', { desc = 'Resize window down' })
map('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Resize window left' })
map('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Resize window right' })

-- Navigate buffers (Shift + h/l)
map('n', '<S-l>', ':bnext<CR>', { desc = 'Next buffer' })
map('n', '<S-h>', ':bprevious<CR>', { desc = 'Previous buffer' })

-- Stay in indent mode (< and > in visual mode)
map('v', '<', '<gv', { desc = 'Unindent line' })
map('v', '>', '>gv', { desc = 'Indent line' })

-- Maintain the cursor position when yanking a visual selection
map('v', 'y', 'myy`y')

-- Paste replace visual selection without copying it
map('v', 'p', '"_dP')

-- Terminal-like shortcuts for insert mode

-- Ctrl + a: Move to beginning of line
-- map('i', '<C-a>', '<C-o>^', { desc = 'Move to beginning of line' })
map('i', '<C-a>', '<Esc>^i', { noremap = true, desc = 'Move to beginning of line' })

-- Ctrl + e: Move to end of line
map('i', '<C-e>', '<C-o>$', { desc = 'Move to end of line' })

-- Option + Right Arrow: Move to next word
-- Note: In many terminals, Option + Right Arrow sends 'f'
map('i', '<M-f>', '<C-o>w', { desc = 'Move to next word' })

-- Option + Left Arrow: Move to previous word
-- Note: In many terminals, Option + Left Arrow sends 'b'
map('i', '<M-b>', '<C-o>b', { desc = 'Move to previous word' })

-- Ctrl + k: Delete from cursor to end of line
map('i', '<C-k>', '<C-o>D', { desc = 'Delete to end of line' })

-- Ctrl + u: Delete from cursor to beginning of line
map('i', '<C-u>', '<C-u>', { desc = 'Delete to beginning of line' })

-- Ctrl + w: Delete word before cursor
map('i', '<C-w>', '<C-w>', { desc = 'Delete word before cursor' })

-- Ctrl + Left Arrow: Move to previous word
map('i', '<C-Left>', '<C-o>b', { desc = 'Move to previous word' })

-- Ctrl + Right Arrow: Move to next word
map('i', '<C-Right>', '<C-o>w', { desc = 'Move to next word' })

-- Set options
local options = {
  clipboard = 'unnamedplus', -- Use system clipboard
  ignorecase = true, -- Ignore case in search patterns
  smartcase = true, -- Override ignorecase if search contains uppercase
  mouse = 'a', -- Enable mouse support
  number = true, -- Show line numbers
  relativenumber = true, -- Use relative line numbers
  expandtab = true, -- Use spaces instead of tabs
  shiftwidth = 2, -- Number of spaces for autoindent
  tabstop = 2, -- Number of spaces a tab counts for
  termguicolors = true, -- Enable 24-bit RGB color in the TUI
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Additional Neovim configurations can be added here
map('n', '<leader>p', ':Telescope find_files<CR>', { desc = 'Find files' })

-- Plugin configurations would go here (using your preferred plugin manager)
-- Interactive Rebase mappings
map('n', '<leader>ps', ':%s/\\cpick\\c/squash/g<CR>', { desc = 'Squash commits' })

-- Select all text in the buffer
map('n', '<leader>a', 'ggVG', { desc = 'Select all text' })

-- NerdTree toggle (Space + m)
map('n', '<leader>n', ':NERDTreeToggle<CR>', { desc = 'Toggle NerdTree' })
vim.g.NERDTreeShowHidden = 1

-- Telescope mappings
map('n', '<leader>ff', ':Telescope find_files<CR>', { desc = 'Find files' })
map('n', '<leader>fg', ':Telescope live_grep<CR>', { desc = 'Live grep' })
map('n', '<leader>fb', ':Telescope buffers<CR>', { desc = 'List buffers' })
map('n', '<leader>fh', ':Telescope help_tags<CR>', { desc = 'Search help tags' })
map('n', '<leader>p', ':Telescope find_files<CR>', { desc = 'Find files' })
map('n', '<cmd>p', ':Telescope find_files<CR>', { desc = 'Find files' })
map('n', '<leader>ps', ':Telescope git_status<CR>', { desc = 'Git status' })
map('n', '<leader>pc', ':Telescope git_commits<CR>', { desc = 'Git commits' })
map('n', '<leader>pb', ':Telescope git_branches<CR>', { desc = 'Git branches' })

-- Window management
map('n', '<leader>sv', '<C-w>v', { desc = '[S]plit window [V]ertically' }) -- Split window vertically
map('n', '<leader>so', '<C-w>s', { desc = '[S]plit window H[orizontally' }) -- Split window horizontally
map('n', '<leader>me', '<C-w>=', { desc = '[M]ake splits [E]qual size' }) -- Equalize window sizes
map('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' }) -- Close

-- Tab management
map('n', '<leader>to', ':tabnew<CR>', { desc = '[Open] new tab' }) -- New tab
map('n', '<leader>tc', ':tabclose<CR>', { desc = '[Close] tab' }) -- Close tab
map('n', '<leader>tn', ':tabnext<CR>', { desc = '[Next] tab' }) -- Next tab
map('n', '<leader>tp', ':tabprevious<CR>', { desc = '[Previous] tab' }) -- Previous tab
map('n', '<leader>tf', ':tabnew %<CR>', { desc = '[Open] file in new tab' }) -- Open file in new tab
