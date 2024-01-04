local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
    lsp_zero.buffer_autoformat()
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'rust_analyzer', 'elixirls', },
    handlers = {
        lsp_zero.default_setup,
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
