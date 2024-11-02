return {
    {
        "brenoprata10/nvim-highlight-colors",
        config = function()
            require("nvim-highlight-colors").setup({})
        end,
    },
    {
        "AckslD/nvim-neoclip.lua",
        dependencies = {
            { "nvim-telescope/telescope.nvim" },
        },
        config = function()
            require("neoclip").setup({
                history = 1000,
                enable_persistent_history = false,
                length_limit = 1048576,
                continuous_sync = false,
                db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
                filter = nil,
                preview = true,
                prompt = nil,
                default_register = '"',
                default_register_macros = "q",
                enable_macro_history = true,
                content_spec_column = false,
                disable_keycodes_parsing = false,
                on_select = {
                    move_to_front = false,
                    close_telescope = true,
                },
                on_paste = {
                    set_reg = false,
                    move_to_front = false,
                    close_telescope = true,
                },
                on_replay = {
                    set_reg = false,
                    move_to_front = false,
                    close_telescope = true,
                },
                on_custom_action = {
                    close_telescope = true,
                },
                keys = {
                    telescope = {
                        i = {
                            select = "<cr>",
                            paste = "<c-j>",
                            paste_behind = "<c-k>",
                            replay = "<c-q>", -- replay a macro
                            delete = "<c-d>", -- delete an entry
                            edit = "<c-e>", -- edit an entry
                            custom = {},
                        },
                        n = {
                            select = "<cr>",
                            paste = "p",
                            --- It is possible to map to more than one key.
                            -- paste = { 'p', '<c-p>' },
                            paste_behind = "P",
                            replay = "q",
                            delete = "d",
                            edit = "e",
                            custom = {},
                        },
                    },
                },
            })

            vim.keymap.set("n", "<leader>o", "<cmd>Telescope neoclip<CR>", { desc = "Telescope Neoclip" })
        end,
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
        opts = {
            focus = true,
        },
        cmd = "Trouble",
        keys = {
            { "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open trouble workspace diagnostics" },
            {
                "<leader>xd",
                "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
                desc = "Open trouble document diagnostics",
            },
            { "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", desc = "Open trouble quickfix list" },
            { "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Open trouble location list" },
            { "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "Open todos in trouble" },
        },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        --event = { "BufReadPre", "BufNewFile" },
        --opts = { indent = { char = "┊" } },
        enabled = true,
        --event = "LazyFile",
        opts = {
            indent = {
                char = "┊",
                tab_char = "",
            },
            scope = { enabled = true },
            exclude = {
                filetypes = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                },
            },
        },
        main = "ibl",
    },
    {
        "voldikss/vim-floaterm",
    },
}
