local telescope = require("telescope")
telescope.load_extension("file_browser")
telescope.setup({
    defaults = {
        layout_config = {
            horizontal = { width = 0.75 }
        },
    },
    pickers = {
        find_files = {
            theme = "dropdown",
            layout_config = {
                width = 0.75
            },
        },
        git_files = {
            theme = "dropdown",
            layout_config = {
                width = 0.75
            },
        },
        grep_string = {
            theme = "dropdown",
            layout_config = {
                width = 0.75
            },
        },
        live_grep = {
            theme = "dropdown",
            layout_config = {
                width = 0.75
            },
        },
        lsp_references = {
            theme = "dropdown",
            layout_config = {
                width = 0.75
            },
        },
        diagnostics = {
            theme = "dropdown",
            layout_config = {
                width = 0.75
            },
        },
    },
})

local function mergeTables(t1, t2)
    for k, v in pairs(t2) do
        t1[k] = v
    end
    return t1
end

local function with_defaults(picker_fn, opts)
    local defaults = {
        theme = "dropdown",
        layout_config = {
            width = 0.75
        },
    }

    opts = opts or {}
    local merged_opts = mergeTables(defaults, opts)

    return function()
        picker_fn(merged_opts)
    end
end

local builtin = require('telescope.builtin')

-- project navigation
vim.keymap.set('n', '<leader>pf', with_defaults(builtin.find_files))
vim.keymap.set('n', '<C-p>', with_defaults(builtin.git_files), {})
vim.keymap.set('n', '<leader>ps', with_defaults(builtin.grep_string), {})
vim.keymap.set('n', '<leader>pl', with_defaults(builtin.live_grep), {})
vim.keymap.set('n', '<leader>pr', with_defaults(builtin.resume), {})


vim.api.nvim_set_keymap(
    "n",
    "<space>fb",
    ":Telescope file_browser theme=dropdown path=%:p:h select_buffer=true<CR>",
    { noremap = true }
)
