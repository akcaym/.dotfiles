return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lazy_status = require("lazy.status")
        local colors = {
            blue = "#65D1FF",
            green = "#3EFFDC",
            violet = "#FF61EF",
            yellow = "#FFDA7B",
            red = "#FF4A4A",
            fg = "#c3ccdc",
            bg = "#112638",
            inactive_bg = "#2c3043",
        }

        local my_lualine_theme = {
            normal = {
                a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            insert = {
                a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            visual = {
                a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            command = {
                a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            replace = {
                a = { bg = colors.red, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            inactive = {
                a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
                b = { bg = colors.inactive_bg, fg = colors.semilightgray },
                c = { bg = colors.inactive_bg, fg = colors.semilightgray },
            },
        }
        -- local function hello()
        --     return [[hello world]]
        -- end
        local function get_venv(variable)
            local venv = os.getenv(variable)
            if venv ~= nil and string.find(venv, "/") then
                local orig_venv = venv
                for w in orig_venv:gmatch("([^/]+)") do
                    venv = w
                end
                venv = string.format("%s", venv)
            end
            return venv
        end

        local function has_env()
            local venv = get_venv("CONDA_DEFAULT_ENV") or get_venv("VIRTUAL_ENV")
            if venv ~= nil then
                return true
            end
            return false
        end
        local function print_env()
            return get_venv("CONDA_DEFAULT_ENV") or get_venv("VIRTUAL_ENV") or "NO ENV"
        end

        require("lualine").setup({
            options = {
                theme = my_lualine_theme,
            },
            sections = {
                lualine_mode = {
                    "mode",
                },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = {
                    { "filename", path = 1 },
                },
                lualine_x = {
                    --{ "fileformat", "filetype" },
                    { "searchcount" },
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        --require("noice").api.statusline.mode.get,
                        --cond = require("noice").api.statusline.mode.has,
                        color = { fg = "#ff9e64" },
                    },
                    {
                        print_env,
                        cond = has_env,
                        color = { fg = "#ff9e64" },
                    },
                },
                lualine_y = { "progress", "encoding", "fileformat", "filetype" },
                lualine_z = { "location" },
            },
            extensions = {
                "fugitive",
                "quickfix",
                "fzf",
                "lazy",
                "mason",
                "nvim-dap-ui",
                "oil",
                "trouble",
                "neo-tree",
            },
        })
    end,
}
