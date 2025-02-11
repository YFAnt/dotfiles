#!/usr/local/bin/bash

# vi
alias vi='nvim'

# clear
alias c='clear'

# cp
alias cp='cp -r'

# lsd: https://github.com/Peltoche/lsd
alias ls='lsd'
alias la='ls -al'

# tmux: https://github.com/tmux/tmux
alias tmxn='tmux new -s'
alias tmxa='tmux attach'
alias tmxd='tmux detach'

# vifm: https://github.com/vifm/vifm
# joshuto: https://github.com/kamiyaa/joshuto
# yazi: https://yazi-rs.github.io/
# alias fm='vifm'
alias fm='yazi'
# alias fm='joshuto'

# vscode: https://code.visualstudio.com/
# vscodium: https://vscodium.com/
alias code='/usr/local/bin/code'
alias codium='/usr/local/bin/codium'

# neofetch: https://github.com/fastfetch-cli/fastfetch
alias fetch='fastfetch'

# git: https://git-scm.com/
# lazygit: https://github.com/jesseduffield/lazygit
# czgit: https://github.com/Zhengqbbb/cz-git
alias lg='lazygit'
alias gs='git status'
alias gitcmt='czg'

# docker: https://www.docker.com/
# docker & dockerc-compose
alias d='docker'
alias dc='docker-compose'

# pnpm: https://pnpm.io/
alias pi='pnpm install'
alias pr='pnpm remove'
alias pu='pnpm update'
alias pU='pnpm i -g pnpm'

# bun: https://bun.sh/
alias bd='bun run dev'
alias bt='bun run test'
alias bb='bun run build'
alias bs='bun run start'
alias bm='bun run mock'

# neovim: https://github.com/neovim/neovim
# helix:  https://helix-editor.com/
alias v='nvim'

# enable or disable clashx proxies
alias setproxy='export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890'
alias resetproxy="export https_proxy='' http_proxy='' all_proxy=''"
setproxy
