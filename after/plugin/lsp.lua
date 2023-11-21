local lsp_zero = require('lsp-zero')

lsp_zero.omnifunc.setup({
  tabcomplete = true,
})

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'clangd', 'cmake', 'lua_ls'},
  handlers = {
    lsp_zero.default_setup,
  },
})

vim.keymap.set('n', '<leader>o', '[[:ClangdSwitchSourceHeader<CR>]]', { noremap = true, silent = true })
