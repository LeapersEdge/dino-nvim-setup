require('nvim-web-devicons').setup()

local builtin = require('telescope.builtin')

local function find_telescope_ignore_file()
  local current_dir = vim.fn.getcwd()
  local file_name = ".telescope_ignore.lua"
  local config_file = current_dir .. "/" .. file_name

  if vim.fn.filereadable(config_file) == 1 then
    return config_file
  else
    return nil
  end
end

local function load_telescope_ignore_patterns()
  local config_file = find_telescope_ignore_file()
  if config_file then
    local ignore_config = dofile(config_file)
    if type(ignore_config) == 'table' then
      return ignore_config.ignore_folders or {}
    end
  end
  print(".telescope_ignore.lua is not pressent in dir where nvim was ran")
  return {}
end

-- examlpe for .telescope_ignore.lua
-- return {ignore_folders = { "example", "example2" }}

require('telescope').setup {
  defaults = {
    file_icons = true,
    file_ignore_patterns = load_telescope_ignore_patterns()
  },
}

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-f>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });	
end)
