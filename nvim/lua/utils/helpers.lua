--  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.
-- | .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
-- | |  ____  ____  | || |  _________   | || |   _____      | || |   ______     | || |  _________   | || |  _______     | || |    _______   | |
-- | | |_   ||   _| | || | |_   ___  |  | || |  |_   _|     | || |  |_   __ \   | || | |_   ___  |  | || | |_   __ \    | || |   /  ___  |  | |
-- | |   | |__| |   | || |   | |_  \_|  | || |    | |       | || |    | |__) |  | || |   | |_  \_|  | || |   | |__) |   | || |  |  (__ \_|  | |
-- | |   |  __  |   | || |   |  _|  _   | || |    | |   _   | || |    |  ___/   | || |   |  _|  _   | || |   |  __ /    | || |   '.___`-.   | |
-- | |  _| |  | |_  | || |  _| |___/ |  | || |   _| |__/ |  | || |   _| |_      | || |  _| |___/ |  | || |  _| |  \ \_  | || |  |`\____) |  | |
-- | | |____||____| | || | |_________|  | || |  |________|  | || |  |_____|     | || | |_________|  | || | |____| |___| | || |  |_______.'  | |
-- | |              | || |              | || |              | || |              | || |              | || |              | || |              | |
-- | '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
--  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'

local M = {}

--- get nvim current mode string
---@return string
function M.get_mode()
    local modes = {
        ["n"] = "NORMAL",
        ["no"] = "OP",
        ["nov"] = "OP",
        ["noV"] = "OP",
        ["no"] = "OP",
        ["niI"] = "NORMAL",
        ["niR"] = "NORMAL",
        ["niV"] = "NORMAL",
        ["v"] = "VISUAL",
        ["V"] = "V-LINE",
        [""] = "V-BLOCK",
        ["s"] = "SELECT",
        ["S"] = "SELECT",
        [""] = "V-BLOCK",
        ["i"] = "INSERT",
        ["ic"] = "INSERT",
        ["ix"] = "INSERT",
        ["R"] = "REPLACE",
        ["Rc"] = "REPLACE",
        ["Rv"] = "V-REPLACE",
        ["Rx"] = "REPLACE",
        ["c"] = "COMMAND",
        ["cv"] = "COMMAND",
        ["ce"] = "COMMAND",
        ["r"] = "ENTER",
        ["rm"] = "MORE",
        ["r?"] = "CONFIRM",
        ["!"] = "SHELL",
        ["t"] = "TERMINAL",
        ["nt"] = "NORMAL",
        ["null"] = "NONE",
    }
    return modes[vim.api.nvim_get_mode().mode]
end

-- toggle auto completation enabled status
function M.toggle_completation_status()
    if vim.g.enable_auto_completation then
        vim.g.enable_auto_completation = false
        print("auto completion disabled")
    else
        vim.g.enable_auto_completation = true
        print("auto completion enabled")
    end
end

-- toggle space characters invisible
M.toggle_invisible_characters = function()
    local opt = vim.opt
    if opt.list:get() then
        opt.list = false
    else
        opt.list = true
    end
end

-- open in vscode
local open_in_vscode = function(is_current_buffer)
    if not vim.fn.executable("code") then
        return function()
            print("[helpers]please install vscode first")
        end
    end

    return function()
        local path = nil
        if is_current_buffer then
            path = vim.fn.expand("%:p")
        else
            path = vim.fn.getcwd()
        end
        vim.cmd("silent !code " .. path)
    end
end

M.buf_open_in_vscode = open_in_vscode(true)
M.cwd_open_in_vscode = open_in_vscode(false)

return M
