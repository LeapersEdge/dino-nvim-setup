require("dino.remap")
require("dino.set")
print("Hello Dino :D")

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
     if vim.bo.modified and vim.bo.filetype == "text" then
      vim.cmd("write")
    end
  end,
})

