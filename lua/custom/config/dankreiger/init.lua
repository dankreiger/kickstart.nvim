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

-- Even quicker source current file (Enter key)
-- Note: This overrides the default Enter key behavior in normal mode
map('n', '<CR>', function()
  if vim.bo.buftype == '' then -- Only for normal buffers
    vim.cmd 'write' -- Save the current file if it's a normal buffer
    vim.cmd 'source $MYVIMRC'
    vim.notify('Neovim config reloaded!', vim.log.levels.INFO)
  else
    -- Perform the default Enter key behavior
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<CR>', true, false, true), 'n', false)
  end
end, { desc = 'Save file and reload nvim config' })

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

-- Plugin configurations would go here (using your preferred plugin manager)
