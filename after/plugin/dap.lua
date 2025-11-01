vim.keymap.set('n', '<leader>db', '<cmd> DapToggleBreakpoint <CR>')
vim.keymap.set('n', '<leader>dr', '<cmd> DapContinue <CR>')

local dap, dapui = require("dap"), require("dapui")
dapui.setup({
  sidebar = {
    elements = {
      { id = 'breakpoints', size = 0.25 },
      { id = 'watches', size = 0.25 },
      { id = 'stacks', size = 0.25 },
      { id = 'scopes', size = 0.25 },
    },
    size = 15, -- You can adjust the size as needed
    position = 'bottom', -- Set the position to 'bottom'
  },
})
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
