return {

    {
        "nvim-treesitter/nvim-treesitter", 
        build = ":TSUpdate",
        config = function() 

            --Treesitter


            local config = require("nvim-treesitter.configs")
            config.setup({
                ensure_installed = {"lua", "javascript","ocaml", "cpp"},
                highlight = { enable = true },
                indent = { enable = true },  
            })




        end
    }

}
