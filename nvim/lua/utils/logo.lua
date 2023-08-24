--  .----------------.  .----------------.  .----------------.  .----------------.
-- | .--------------. || .--------------. || .--------------. || .--------------. |
-- | |   _____      | || |     ____     | || |    ______    | || |     ____     | |
-- | |  |_   _|     | || |   .'    `.   | || |  .' ___  |   | || |   .'    `.   | |
-- | |    | |       | || |  /  .--.  \  | || | / .'   \_|   | || |  /  .--.  \  | |
-- | |    | |   _   | || |  | |    | |  | || | | |    ____  | || |  | |    | |  | |
-- | |   _| |__/ |  | || |  \  `--'  /  | || | \ `.___]  _| | || |  \  `--'  /  | |
-- | |  |________|  | || |   `.____.'   | || |  `._____.'   | || |   `.____.'   | |
-- | |              | || |              | || |              | || |              | |
-- | '--------------' || '--------------' || '--------------' || '--------------' |
--  '----------------'  '----------------'  '----------------'  '----------------'
-- 随机获取一个 logo, 用于启动时候展示

local neovim_logos = {
    {
        "███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
        "████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
        "██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
        "██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
        "██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
        "╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
    },
    {
        "███╗░░██╗ ███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗",
        "████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║",
        "██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║",
        "██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║",
        "██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║",
        "╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝",
    },
    {
        "   ▄   ▄███▄   ████▄     ▄   ▄█ █▀▄▀█ ",
        "    █  █▀   ▀  █   █      █  ██ █ █ █ ",
        "██   █ ██▄▄    █   █ █     █ ██ █ ▄ █ ",
        "█ █  █ █▄   ▄▀ ▀████  █    █ ▐█ █   █ ",
        "█  █ █ ▀███▀           █  █   ▐    █  ",
        "█   ██                  █▐        ▀   ",
        "                        ▐             ",
    },
    {
        "                                           ███                 ",
        "                                          ░░░                  ",
        " ████████    ██████   ██████  █████ █████ ████  █████████████  ",
        "░░███░░███  ███░░███ ███░░███░░███ ░░███ ░░███ ░░███░░███░░███ ",
        " ░███ ░███ ░███████ ░███ ░███ ░███  ░███  ░███  ░███ ░███ ░███ ",
        " ░███ ░███ ░███░░░  ░███ ░███ ░░███ ███   ░███  ░███ ░███ ░███ ",
        " ████ █████░░██████ ░░██████   ░░█████    █████ █████░███ █████",
        "░░░░ ░░░░░  ░░░░░░   ░░░░░░     ░░░░░    ░░░░░ ░░░░░ ░░░ ░░░░░ ",
    },
    {
        [[███▄▄▄▄      ▄████████  ▄██████▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄  ]],
        [[███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄]],
        [[███   ███   ███    █▀  ███    ███ ███    ███ ███▌ ███   ███   ███]],
        [[███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███▌ ███   ███   ███]],
        [[███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███▌ ███   ███   ███]],
        [[███   ███   ███    █▄  ███    ███ ███    ███ ███  ███   ███   ███]],
        [[███   ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███]],
        [[ ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀    ▀█   ███   █▀ ]],
    },
    {
        " ▄▄        ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄               ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄       ▄▄ ",
        "▐░░▌      ▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌             ▐░▌▐░░░░░░░░░░░▌▐░░▌     ▐░░▌",
        "▐░▌░▌     ▐░▌▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌ ▐░▌           ▐░▌  ▀▀▀▀█░█▀▀▀▀ ▐░▌░▌   ▐░▐░▌",
        "▐░▌▐░▌    ▐░▌▐░▌          ▐░▌       ▐░▌  ▐░▌         ▐░▌       ▐░▌     ▐░▌▐░▌ ▐░▌▐░▌",
        "▐░▌ ▐░▌   ▐░▌▐░█▄▄▄▄▄▄▄▄▄ ▐░▌       ▐░▌   ▐░▌       ▐░▌        ▐░▌     ▐░▌ ▐░▐░▌ ▐░▌",
        "▐░▌  ▐░▌  ▐░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌    ▐░▌     ▐░▌         ▐░▌     ▐░▌  ▐░▌  ▐░▌",
        "▐░▌   ▐░▌ ▐░▌▐░█▀▀▀▀▀▀▀▀▀ ▐░▌       ▐░▌     ▐░▌   ▐░▌          ▐░▌     ▐░▌   ▀   ▐░▌",
        "▐░▌    ▐░▌▐░▌▐░▌          ▐░▌       ▐░▌      ▐░▌ ▐░▌           ▐░▌     ▐░▌       ▐░▌",
        "▐░▌     ▐░▐░▌▐░█▄▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄█░▌       ▐░▐░▌        ▄▄▄▄█░█▄▄▄▄ ▐░▌       ▐░▌",
        "▐░▌      ▐░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌        ▐░▌        ▐░░░░░░░░░░░▌▐░▌       ▐░▌",
        " ▀        ▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀          ▀          ▀▀▀▀▀▀▀▀▀▀▀  ▀         ▀ ",
    },
    {
        "::::    ::: :::::::::: ::::::::  :::     ::: ::::::::::: ::::    ::::  ",
        ":+:+:   :+: :+:       :+:    :+: :+:     :+:     :+:     +:+:+: :+:+:+ ",
        ":+:+:+  +:+ +:+       +:+    +:+ +:+     +:+     +:+     +:+ +:+:+ +:+ ",
        "+#+ +:+ +#+ +#++:++#  +#+    +:+ +#+     +:+     +#+     +#+  +:+  +#+ ",
        "+#+  +#+#+# +#+       +#+    +#+  +#+   +#+      +#+     +#+       +#+ ",
        "#+#   #+#+# #+#       #+#    #+#   #+#+#+#       #+#     #+#       #+# ",
        "###    #### ########## ########      ###     ########### ###       ### ",
    },
    {
        "##::: ##:'########::'#######::'##::::'##:'####:'##::::'##:",
        "###:: ##: ##.....::'##.... ##: ##:::: ##:. ##:: ###::'###:",
        "####: ##: ##::::::: ##:::: ##: ##:::: ##:: ##:: ####'####:",
        "## ## ##: ######::: ##:::: ##: ##:::: ##:: ##:: ## ### ##:",
        "##. ####: ##...:::: ##:::: ##:. ##:: ##::: ##:: ##. #: ##:",
        "##:. ###: ##::::::: ##:::: ##::. ## ##:::: ##:: ##:.:: ##:",
        "##::. ##: ########:. #######::::. ###::::'####: ##:::: ##:",
        ".::::..::........:::.......::::::...:::::....::..:::::..::",
    },
    {
        ".##....##.########..#######..##.....##.####.##.....##",
        ".###...##.##.......##.....##.##.....##..##..###...###",
        ".####..##.##.......##.....##.##.....##..##..####.####",
        ".##.##.##.######...##.....##.##.....##..##..##.###.##",
        ".##..####.##.......##.....##..##...##...##..##.....##",
        ".##...###.##.......##.....##...##.##....##..##.....##",
        ".##....##.########..#######.....###....####.##.....##",
    },
    {
        "##    ## ########  #######  ##     ## #### ##     ## ",
        "###   ## ##       ##     ## ##     ##  ##  ###   ### ",
        "####  ## ##       ##     ## ##     ##  ##  #### #### ",
        "## ## ## ######   ##     ## ##     ##  ##  ## ### ## ",
        "##  #### ##       ##     ##  ##   ##   ##  ##     ## ",
        "##   ### ##       ##     ##   ## ##    ##  ##     ## ",
        "##    ## ########  #######     ###    #### ##     ## ",
    },
    {
        "d8b   db d88888b  .d88b.  db    db d888888b .88b  d88. ",
        "888o  88 88'     .8P  Y8. 88    88   `88'   88'YbdP`88 ",
        "88V8o 88 88ooooo 88    88 Y8    8P    88    88  88  88 ",
        "88 V8o88 88      88    88 `8b  d8'    88    88  88  88 ",
        "88  V888 88.     `8b  d8'  `8bd8'    .88.   88  88  88 ",
        "VP   V8P Y88888P  `Y88P'     YP    Y888888P YP  YP  YP ",
    },
    {
        "___  __     ____     _____  ____    ___ ___ ___  __    __  ",
        "`MM 6MMb   6MMMMb   6MMMMMb `MM(    )M' `MM `MM 6MMb  6MMb  ",
        " MMM9 `Mb 6M'  `Mb 6M'   `Mb `Mb    d'       MM69 `MM69 `Mb ",
        " MM'   MM MM    MM MM     MM  YM.  ,P    MM  MM'   MM'   MM ",
        " MM    MM MMMMMMMM MM     MM   MM  M     MM  MM    MM    MM ",
        " MM    MM MM       MM     MM   `Mbd'     MM  MM    MM    MM ",
        " MM    MM YM    d9 YM.   ,M9    YMP      MM  MM    MM    MM ",
        "_MM_  _MM_ YMMMM9   YMMMMM9      M      _MM__MM_  _MM_  _MM_",
    },
    {
        "@@@  @@@  @@@@@@@@   @@@@@@   @@@  @@@  @@@  @@@@@@@@@@ ",
        "@@@@ @@@  @@@@@@@@  @@@@@@@@  @@@  @@@       @@@@@@@@@@@",
        "@@!@!@@@  @@!       @@!  @@@  @@!  @@@  @@!  @@! @@! @@!",
        "!@!!@!@!  !@!       !@!  @!@  !@!  @!@  !@!  !@! !@! !@!",
        "@!@ !!@!  @!!!:!    @!@  !@!  @!@  !@!  !!@  @!! !!@ @!@",
        "!@!  !!!  !!!!!:    !@!  !!!  !@!  !!!  !!!  !@!     !@!",
        "!!:  !!!  !!:       !!:  !!!  :!:  !!:  !!:  !!:     !!:",
        ":!:  !:!  :!:       :!:  !:!   ::!!:!   :!:  :!:     :!:",
        "::   ::   :: ::::   ::::: ::    ::::     ::  :::     :: ",
        "::   :    :  :  :   : :   ::     ::       :    :      : ",
    },
    {
        [[   _     _      _     _      _     _      _     _      _     _      _     _   ]],
        [[  (c).-.(c)    (c).-.(c)    (c).-.(c)    (c).-.(c)    (c).-.(c)    (c).-.(c)  ]],
        [[   / ._. \      / ._. \      / ._. \      / ._. \      / ._. \      / ._. \   ]],
        [[ __\( Y )/__  __\( Y )/__  __\( Y )/__  __\( Y )/__  __\( Y )/__  __\( Y )/__ ]],
        [[(_.-/'-'\-._)(_.-/'-'\-._)(_.-/'-'\-._)(_.-/'-'\-._)(_.-/'-'\-._)(_.-/'-'\-._)]],
        [[   || N ||      || E ||      || O ||      || V ||      || I ||      || M ||   ]],
        [[ _.' `-' '._  _.' `-' '._  _.' `-' '._  _.' `-' '._  _.' `-' '._  _.' `-' '._ ]],
        [[(.-./`-'\.-.)(.-./`-'\.-.)(.-./`-'\.-.)(.-./`-'\.-.)(.-./`-'\.-.)(.-./`-'\.-.)]],
        [[ `-'     `-'  `-'     `-'  `-'     `-'  `-'     `-'  `-'     `-'  `-'     `-' ]],
    },
}

local weekday_logos = {
    {
        "███████╗██╗   ██╗███╗   ██╗██████╗  █████╗ ██╗   ██╗",
        "██╔════╝██║   ██║████╗  ██║██╔══██╗██╔══██╗╚██╗ ██╔╝",
        "███████╗██║   ██║██╔██╗ ██║██║  ██║███████║ ╚████╔╝ ",
        "╚════██║██║   ██║██║╚██╗██║██║  ██║██╔══██║  ╚██╔╝  ",
        "███████║╚██████╔╝██║ ╚████║██████╔╝██║  ██║   ██║   ",
        "╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
    },
    {
        "███╗   ███╗ ██████╗ ███╗   ██╗██████╗  █████╗ ██╗   ██╗",
        "████╗ ████║██╔═══██╗████╗  ██║██╔══██╗██╔══██╗╚██╗ ██╔╝",
        "██╔████╔██║██║   ██║██╔██╗ ██║██║  ██║███████║ ╚████╔╝ ",
        "██║╚██╔╝██║██║   ██║██║╚██╗██║██║  ██║██╔══██║  ╚██╔╝  ",
        "██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██████╔╝██║  ██║   ██║   ",
        "╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
    },
    {
        "████████╗██╗   ██╗███████╗███████╗██████╗  █████╗ ██╗   ██╗",
        "╚══██╔══╝██║   ██║██╔════╝██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝",
        "   ██║   ██║   ██║█████╗  ███████╗██║  ██║███████║ ╚████╔╝ ",
        "   ██║   ██║   ██║██╔══╝  ╚════██║██║  ██║██╔══██║  ╚██╔╝  ",
        "   ██║   ╚██████╔╝███████╗███████║██████╔╝██║  ██║   ██║   ",
        "   ╚═╝    ╚═════╝ ╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
    },
    {
        "██╗    ██╗███████╗██████╗ ███╗   ██╗███████╗███████╗██████╗  █████╗ ██╗   ██╗",
        "██║    ██║██╔════╝██╔══██╗████╗  ██║██╔════╝██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝",
        "██║ █╗ ██║█████╗  ██║  ██║██╔██╗ ██║█████╗  ███████╗██║  ██║███████║ ╚████╔╝ ",
        "██║███╗██║██╔══╝  ██║  ██║██║╚██╗██║██╔══╝  ╚════██║██║  ██║██╔══██║  ╚██╔╝  ",
        "╚███╔███╔╝███████╗██████╔╝██║ ╚████║███████╗███████║██████╔╝██║  ██║   ██║   ",
        " ╚══╝╚══╝ ╚══════╝╚═════╝ ╚═╝  ╚═══╝╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
    },
    {
        "████████╗██╗  ██╗██╗   ██╗██████╗ ███████╗██████╗  █████╗ ██╗   ██╗",
        "╚══██╔══╝██║  ██║██║   ██║██╔══██╗██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝",
        "   ██║   ███████║██║   ██║██████╔╝███████╗██║  ██║███████║ ╚████╔╝ ",
        "   ██║   ██╔══██║██║   ██║██╔══██╗╚════██║██║  ██║██╔══██║  ╚██╔╝  ",
        "   ██║   ██║  ██║╚██████╔╝██║  ██║███████║██████╔╝██║  ██║   ██║   ",
        "   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
    },
    {
        "███████╗██████╗ ██╗██████╗  █████╗ ██╗   ██╗",
        "██╔════╝██╔══██╗██║██╔══██╗██╔══██╗╚██╗ ██╔╝",
        "█████╗  ██████╔╝██║██║  ██║███████║ ╚████╔╝ ",
        "██╔══╝  ██╔══██╗██║██║  ██║██╔══██║  ╚██╔╝  ",
        "██║     ██║  ██║██║██████╔╝██║  ██║   ██║   ",
        "╚═╝     ╚═╝  ╚═╝╚═╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
    },
    {
        "███████╗ █████╗ ████████╗██╗   ██╗██████╗ ██████╗  █████╗ ██╗   ██╗",
        "██╔════╝██╔══██╗╚══██╔══╝██║   ██║██╔══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝",
        "███████╗███████║   ██║   ██║   ██║██████╔╝██║  ██║███████║ ╚████╔╝ ",
        "╚════██║██╔══██║   ██║   ██║   ██║██╔══██╗██║  ██║██╔══██║  ╚██╔╝  ",
        "███████║██║  ██║   ██║   ╚██████╔╝██║  ██║██████╔╝██║  ██║   ██║   ",
        "╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
    },
}

return {
    get_random_nvim_logo = function()
        return neovim_logos[math.random(1, #neovim_logos)]
    end,
    get_weekday_logo = function()
        return weekday_logos[os.date("%w") + 1]
    end,
}
