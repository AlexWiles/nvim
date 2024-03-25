local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
    lsp_zero.buffer_autoformat()



    local telescope = require('telescope.builtin')
    -- (l)sp --> (a)ction --> (r)ename
    vim.keymap.set('n', '<leader>lar', vim.lsp.buf.rename)

    -- (l)sp --> (a)ction --> (c)ode action
    vim.keymap.set('n', '<leader>lac', vim.lsp.buf.code_action)

    -- (l)sp --> (f)ind --> (r)eferences
    vim.keymap.set('n', '<leader>lfr', telescope.lsp_references)

    -- (l)sp --> (f)ind --> (d)efinitions
    vim.keymap.set('n', '<leader>lfd', telescope.lsp_definitions)

    -- (l)sp --> (f)ind --> (i)mplementations
    vim.keymap.set('n', '<leader>lfi', telescope.lsp_implementations)

    -- (l)sp --> (d)iagnostics --> (p)roject
    vim.keymap.set('n', '<leader>ldp', telescope.diagnostics)

    -- (l)sp --> (d)iagnostics --> (b)uffer
    vim.keymap.set('n', '<leader>ldb', function() telescope.diagnostics({ bufnr = 0 }) end)

    -- (l)sp --> (d)iagnostics --> (l)ine
    vim.keymap.set('n', '<leader>ldl', vim.diagnostic.open_float)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'elixirls' },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            require('lspconfig').lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' },
                        },
                    },
                },
            })
        end,
    },
})

-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/autocomplete.md
local cmp = require('cmp')

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- Use Enter to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }),

    -- preselect first item
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    }

})
