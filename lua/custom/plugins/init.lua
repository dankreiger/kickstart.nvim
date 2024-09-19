-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'github/copilot.vim', -- AI pair programmer
  'nvim-lua/plenary.nvim', -- Common utilities
  'nvim-telescope/telescope.nvim', -- Fuzzy finder
  'neovim/nvim-lspconfig', -- LSP support
  { 'neoclide/coc.nvim', branch = 'release' }, -- Conquer of Completion
  'hrsh7th/nvim-cmp', -- Autocompletion plugin
  'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
  'preservim/nerdtree', -- File explorer
  'mbbill/undotree', -- Undo tree
  'kyazdani42/nvim-web-devicons', -- Icons

  -- Below: https://github.com/hrsh7th/nvim-cmp?tab=readme-ov-file#recommended-configuration

  'hrsh7th/cmp-nvim-lsp', -- LSP completions
  'hrsh7th/cmp-nvim-lsp-signature-help', -- Signature help completions
  'hrsh7th/cmp-buffer', -- Buffer completions
  'hrsh7th/cmp-path', -- Path completions
  'hrsh7th/cmp-cmdline', -- Cmdline completions

  'L3MON4D3/LuaSnip', -- Snippet engine
  'saadparwaiz1/cmp_luasnip', -- Snippet completions
  'hrsh7th/cmp-nvim-lua', -- Lua completions
  'windwp/nvim-autopairs', -- Autopairs
  'numToStr/Comment.nvim', -- Commenting
  'hrsh7th/cmp-vsnip', -- Vsnip completions
  'hrsh7th/vim-vsnip', -- Vsnip snippet engine
}
