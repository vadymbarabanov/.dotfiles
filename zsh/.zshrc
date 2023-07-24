setopt histignorealldups sharehistory

# Aliases
alias ls="ls -a --color=auto"
alias ll="ls -lah --color=auto"
alias vsc="code . && exit"
alias path="echo \"$PATH\" | tr \":\" \"\n\""
alias tree="tree -a -C -I \"node_modules|.git|dist|build\""
alias src="source $HOME/.zshrc"
alias nv="nvim"

# Git integration to prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%F{green}git(%f%F{magenta}%b%f%F{green})%f '

setopt PROMPT_SUBST
PROMPT='%F{green}%T%f %F{white}%1~%f ${vcs_info_msg_0_}%F{green}%#%f '

# Completion
autoload -Uz compinit; compinit

zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' group-name ''
# completion end

# Lua
alias luamake=$HOME/local/lua-language-server/3rd/luamake/luamake
# Lua end

# pnpm
alias p="pnpm"

export PNPM_HOME="/home/vadym/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end


# bun completions
[ -s "/home/vadym/.bun/_bun" ] && source "/home/vadym/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
