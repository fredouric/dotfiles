require("fredo.remap")
require("fredo.set")

require("fredo.lazy_init")

local augroup = vim.api.nvim_create_augroup
local FredoGroup = augroup('Fredo', {})

local autocmd = vim.api.nvim_create_autocmd

autocmd('LspAttach', {
    group = FredoGroup,
    callback = function(e)
        local opts = { buffer = e.buf }

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "dn", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "dp", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vfr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end
})

