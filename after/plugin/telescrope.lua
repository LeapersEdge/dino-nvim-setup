require('nvim-web-devicons').setup()

local builtin = require('telescope.builtin')

require('telescope').setup {
  defaults = {
    file_icons = true,
  },
}

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-f>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });	
end)
