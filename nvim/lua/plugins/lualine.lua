-----------------------------------------------------------------------
-- 底部状态栏
-- docs: https://github.com/nvim-lualine/lualine.nvim
-----------------------------------------------------------------------
-- stylua: ignore
return {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
        -- nvim 运行的目录
        local function project_name()
            return table.remove(vim.fn.split(vim.fn.getcwd(), "/"))
        end

        return vim.tbl_deep_extend("force", opts, {
            options = {
                globalstatus         = true,                            -- 使用全局的状态栏(false 每个窗口显示不同的状态栏)
                component_separators = { left = "", right = "" },       -- 右侧默认: { left = "", right = "" },
                section_separators   = { left = "", right = "" },     -- 左侧分割符
            },
            sections = {
                lualine_a = { { "mode", icon = "󰕷" } },
                lualine_b = { { "branch", icon = "" } },
                lualine_c = { "diff", "diagnostics", "searchcount" },
                lualine_x = { "filetype", "encoding", "fileformat", "filesize" },
                lualine_y = { { "location", icon = "󰕟" } },
                lualine_z = { { project_name, icon = "" } },
            },
        })
    end,
}
