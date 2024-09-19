return {
  'akinsho/toggleterm.nvim',    -- The plugin being configured
  version = '*',                -- Use the latest version of the plugin
  config = function()           -- Function to configure the plugin
    require('toggleterm').setup({
      size = 20,                -- Set the size of the terminal window to 20 lines
      open_mapping = [[<c-\>]], -- Use Ctrl+\ to open/close the terminal
      hide_numbers = true,      -- Hide line numbers in the terminal window
      shade_terminals = true,   -- Add a shade to the terminal
      start_in_insert = true,   -- Start terminal in insert mode
      insert_mappings = true,   -- Enable keymaps in insert mode
      persist_size = true,      -- Remember the size of the terminal between sessions
      direction = 'float',      -- Open the terminal as a floating window
      close_on_exit = true,     -- Close the terminal window when the process exits
      shell = vim.o.shell,      -- Use the default shell
    })
  end
}
