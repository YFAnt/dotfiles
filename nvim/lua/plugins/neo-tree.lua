-----------------------------------------------------------------------
-- 侧边栏目录树
-- docs: https://github.com/nvim-neo-tree/neo-tree.nvim
-----------------------------------------------------------------------
return {
    "nvim-neo-tree/neo-tree.nvim",
    event = "VeryLazy",
    keys = {
        { "<leader>e", false },
        { "<leader>E", false },
        {
            "<c-e>",
            "<cmd>Neotree toggle<cr>",
            desc = "Toggle file explorer",
        },
    },
    opts = function(_, opts)
        ------------------------------------------
        -- event handlers
        ------------------------------------------
        local events = require("neo-tree.events")
        local event_handlers = {
            {
                -- 创建文件后立即编辑
                event = events.FILE_ADDED,
                handler = function(filepath)
                    if vim.fn.filereadable(filepath) == 1 then
                        vim.cmd("silent edit " .. filepath)
                    end
                end,
            },
            {
                -- 文件删除后立即关闭对应的 buffer 标签页
                event = events.FILE_DELETED,
                handler = function(filepath)
                    local ok, bufremove = pcall(require, "mini.bufremove")
                    if not ok then
                        return
                    end
                    local buflist = vim.api.nvim_list_bufs()
                    for _, bufnr in ipairs(buflist) do
                        local bufpath = vim.fn.fnamemodify(vim.fn.bufname(bufnr), ":p")
                        if filepath == bufpath then
                            bufremove.delete(bufnr, true)
                            break
                        end
                    end
                end,
            },
        }

        ------------------------------------------
        -- commands
        ------------------------------------------
        local commands = {
            remove2trash = {
                nowait = true,
                command = function(state)
                    local node = state.tree:get_node()
                    local strfmt = string.format
                    local inputs = require("neo-tree.ui.inputs")
                    local confirm_msg = strfmt("Are you sure to remove %s ?", node.name)
                    inputs.confirm(confirm_msg, function(confirmed)
                        if not confirmed then
                            return
                        end
                        -- 移动到垃圾桶 & 通知事件处理器关闭 node.path 对应的 buffer
                        vim.cmd(strfmt("silent !mv %s ~/.Trash/", node.path))
                        events.fire_event(events.FILE_DELETED, node.path)
                    end)
                end,
            },
            copy_filename = {
                nowait = true,
                command = function(state)
                    local node = state.tree:get_node()
                    vim.fn.setreg("+", node.name)
                end,
            },
            copy_filepath = {
                nowait = true,
                command = function(state)
                    local node = state.tree:get_node()
                    vim.fn.setreg("+", node:get_id())
                end,
            },
            preview_image_in_wezterm = {
                nowait = true,
                command = function(state)
                    local node = state.tree:get_node()
                    if not node.type == "file" then
                        return
                    end
                    require("utils.image-preview").preview_image_in_wezterm(node.path)
                end,
            },
        }

        ------------------------------------------
        -- keys
        ------------------------------------------
        local keys = {
            -- :h neo-tree-mappings
            top_window = {
                ["<space>"] = "toggle_node",
                ["o"] = "open",
                ["<enter>"] = "open",
                ["<esc>"] = "revert_preview",
                ["P"] = { "toggle_preview", config = { use_float = true } },
                ["l"] = "focus_preview",
                ["S"] = "open_split",
                ["s"] = "open_vsplit",
                ["Z"] = "close_node",
                ["q"] = "close_window",
                ["R"] = "refresh",
                ["?"] = "show_help",
                ["<s-tab>"] = "prev_source",
                ["<tab>"] = "next_source",
            },
            filesystem_window = {
                ["/"] = "fuzzy_finder", -- filter_on_submit
                ["<c-x>"] = "clear_filter",
                ["<c-k>"] = "prev_git_modified",
                ["<c-j>"] = "next_git_modified",
                ["."] = "set_root",
                ["<bs>"] = "navigate_up",
                ["a"] = "add",
                ["A"] = "add_directory",
                -- ["x"] = "delete", -- force delete from disk
                ["r"] = "rename",
                ["y"] = "copy_to_clipboard",
                ["d"] = "cut_to_clipboard",
                ["p"] = "paste_from_clipboard",
                ["m"] = "move",
                ["x"] = commands.remove2trash,
                ["i"] = commands.preview_image_in_wezterm,
                ["Y"] = commands.copy_filename,
                ["<C-y>"] = commands.copy_filepath,
            },
            filesystem_fuzzy_finder = {
                ["<c-j>"] = "move_cursor_down",
                ["<c-k>"] = "move_cursor_up",
            },
            buffers_window = {
                ["<bs>"] = "buffer_delete",
            },
            git_status_window = {
                ["gu"] = "git_unstage_file",
                ["ga"] = "git_add_file",
                ["gA"] = "git_add_all",
                ["gr"] = "git_revert_file",
                ["gc"] = "git_commit",
                ["gp"] = "git_push",
            },
        }

        return vim.tbl_deep_extend("force", opts, {
            close_if_last_window = true,
            popup_border_style = "single",
            hide_root_node = true,
            use_default_mappings = false,
            event_handlers = event_handlers,
            sources = { "filesystem", "buffers", "git_status" },
            source_selector = {
                winbar = true,
            },
            default_component_configs = {
                indent = {
                    with_expanders = false,
                    indent_size = 2,
                    padding = 1,
                    with_markers = true,
                },
            },
            window = {
                position = "left",
                mappings = keys.top_window,
            },
            filesystem = {
                bind_to_cwd = true,
                follow_current_file = {
                    enabled = true,
                },
                use_libuv_file_watcher = true,
                filtered_items = {
                    visible = true,
                    hide_gitignored = true,
                    hide_hidden = true,
                    hide_dotfiles = false,
                    hide_by_name = { ".DS_Store" },
                    never_show = { ".DS_Store" },
                },
                window = {
                    mappings = keys.filesystem_window,
                    fuzzy_finder_mappings = keys.filesystem_fuzzy_finder,
                },
            },
            buffers = {
                follow_current_file = {
                    enabled = true,
                },
                group_empty_dirs = false,
                show_unloaded = true,
                window = {
                    mappings = keys.buffers_window,
                },
            },
            git_status = {
                window = {
                    mappings = keys.git_status_window,
                },
            },
        })
    end,
}
