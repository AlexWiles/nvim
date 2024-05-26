require('rose-pine').setup({
    variant = "moon",

    styles = {
        transparency = false,
    },
})

require("catppuccin").setup({
    flavor = "latte", -- latte, frappe, macchiato, mocha
    transparent_background = true,

    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
})

vim.cmd.colorscheme("catppuccin")

local auto_dark_mode = require('auto-dark-mode')

auto_dark_mode.setup({
    update_interval = 1000,
    set_dark_mode = function()
        vim.api.nvim_set_option('background', 'dark')
        vim.cmd('colorscheme catppuccin')
    end,
    set_light_mode = function()
        vim.api.nvim_set_option('background', 'light')
        vim.cmd('colorscheme catppuccin')
    end,
})
