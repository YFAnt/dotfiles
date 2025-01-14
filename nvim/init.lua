--  .----------------.  .-----------------. .----------------.  .----------------.
-- | .--------------. || .--------------. || .--------------. || .--------------. |
-- | |     _____    | || | ____  _____  | || |     _____    | || |  _________   | |
-- | |    |_   _|   | || ||_   \|_   _| | || |    |_   _|   | || | |  _   _  |  | |
-- | |      | |     | || |  |   \ | |   | || |      | |     | || | |_/ | | \_|  | |
-- | |      | |     | || |  | |\ \| |   | || |      | |     | || |     | |      | |
-- | |     _| |_    | || | _| |_\   |_  | || |     _| |_    | || |    _| |_     | |
-- | |    |_____|   | || ||_____|\____| | || |    |_____|   | || |   |_____|    | |
-- | |              | || |              | || |              | || |              | |
-- | '--------------' || '--------------' || '--------------' || '--------------' |
--  '----------------'  '----------------'  '----------------'  '----------------'
-- neovide gui client: https://neovide.dev
if vim.g.neovide then
    require("client.neovide")
end

require("utils.settings")
require("utils.filetype")
require("config.lazy")
