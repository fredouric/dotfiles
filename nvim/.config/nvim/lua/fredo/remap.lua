vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

local function open_vertical_buffer_at_100()
end

-- Map the function to a key
vim.keymap.set('n', '<leader>nb', function()
        vim.cmd('vnew')
        vim.cmd('wincmd l')
        local col = vim.fn.winwidth(0)
        vim.cmd('vertical resize +25')
        col = col - vim.fn.winwidth(0)
        vim.cmd('normal ' .. col .. 'i')
    end,
    { noremap = true, silent = true })
