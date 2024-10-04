return {
  'github/copilot.vim', -- AI pair programmer
  'nvim-lua/plenary.nvim', -- Common utilities
  'nvim-telescope/telescope.nvim', -- Fuzzy finder
  'preservim/nerdtree', -- File explorer
  'mbbill/undotree', -- Undo tree
  'windwp/nvim-autopairs', -- Autopairs
  'numToStr/Comment.nvim', -- Commenting

  -- Additional completion sources
  'hrsh7th/cmp-nvim-lsp-signature-help', -- Signature help completions
  'hrsh7th/cmp-buffer', -- Buffer completions
  'hrsh7th/cmp-path', -- Path completions
  'hrsh7th/cmp-cmdline', -- Cmdline completions
  'hrsh7th/cmp-nvim-lua', -- Lua completions

  -- Snippet engines
  'L3MON4D3/LuaSnip', -- Snippet engine
  'saadparwaiz1/cmp_luasnip', -- Snippet completions

  -- Additional snippet sources
  'hrsh7th/cmp-vsnip', -- Vsnip completions
  'hrsh7th/vim-vsnip', -- Vsnip snippet engine

  -- Split navigation manager
  'christoomey/vim-tmux-navigator',

  -- Configure Comment.nvim
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },

  -- Configure nvim-autopairs
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {
        toggler = {
          line = 'gcc',
          block = 'gbc',
        },
        opleader = {
          line = 'g',
          block = 'g',
        },
        mappings = {
          basic = true,
          extra = false,
        },
      }
    end,
  },
}
