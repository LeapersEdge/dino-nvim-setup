vim.g.mapleader = " "
vim.keymap.set("n", "<leader>fe", vim.cmd.Ex)

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") 
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") 

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


vim.keymap.set('i', '(', '()<Left>', { noremap = true, silent = true })
vim.keymap.set('i', '[', '[]<Left>', { noremap = true, silent = true })
vim.keymap.set('i', '{', '{}<Left>', { noremap = true, silent = true })

function BuildProject()
    local cmd = [[
        cd build && make -j 8 && ./build && cd ..
    ]]
    vim.cmd('! ' .. cmd)
end
vim.keymap.set('n', '<leader>cmb', BuildProject, { noremap = true, silent = true })

-- Function to create a file in both include and src folders
function createFile(extension)
    local filename = vim.fn.input('Enter file name: ')
    local srcfile = filename
    local inclfile = filename

    -- Append extension based on the input
    if extension == "cpp" then
        inclfile = inclfile .. ".h"
        srcfile = srcfile .. ".cpp"
    elseif extension == "c" then
        inclfile = inclfile .. ".h"
        srcfile = srcfile .. ".c"
    end

    -- Define the file paths
    local includeFilePath = 'include/' .. inclfile
    local srcFilePath = 'src/' .. srcfile

    -- Create the files
    local includeFile = io.open(includeFilePath, 'w')
    local srcFile = io.open(srcFilePath, 'w')

    -- Close the file handles
    includeFile:close()
    srcFile:close()

    -- Print a message indicating the created files
    print("Created files: " .. includeFilePath .. " and " .. srcFilePath)
end

-- Function to create a file in both include and src folders
function createHeader()
    local filename = vim.fn.input('Enter header file name: ')
    local inclfile = filename

    -- Append extension based on the input
    inclfile = inclfile .. ".h"

    -- Define the file paths
    local includeFilePath = 'include/' .. inclfile

    -- Create the files
    local includeFile = io.open(includeFilePath, 'w')

    -- Close the file handles
    includeFile:close()

    -- Print a message indicating the created files
    print("Created file: " .. includeFilePath)
end

vim.api.nvim_set_keymap('n', '<leader>cfc', [[:lua createFile('cpp')<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cfp', [[:lua createFile('c')<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cfh', [[:lua createHeader()<CR>]], { noremap = true, silent = true })

vim.cmd("cabbrev W w")
