--[[ return {

    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            --ColorScheme 
            vim.cmd.colorscheme "catppuccin"
            --vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end
    } 
} ]]
return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    }
}
