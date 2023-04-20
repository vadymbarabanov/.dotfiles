setopt histignorealldups sharehistory

# Aliases
alias ls="ls -a --color=auto"
alias ll="ls -lah --color=auto"
alias vsc="code . && exit"
alias path="echo \"$PATH\" | tr \":\" \"\n\""
alias tree="tree -a -C -I \"node_modules|.git\""
alias src="source $HOME/.zshrc"

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

