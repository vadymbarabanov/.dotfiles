export HISTSIZE=5000
export SAVEHIST=5000
export HISTFILE=$HOME/.cache/zsh/zhistory
export ZSH_COMPDUMP=$HOME/.cache/zsh/zcompdump

export COLORTERM=truecolor
export EDITOR=helix

export PATH=$PATH:$HOME/scripts

[ -f $HOME/.tokens ] && source $HOME/.tokens

# Golang
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin

# Rust
[ -f $HOME/.cargo/env ] && . "$HOME/.cargo/env"

# Zig
export PATH=$PATH:$HOME/.local/zig/bin
export PATH=$PATH:$HOME/.local/zls/bin

# Neovim
export PATH=$PATH:$HOME/local/nvim/bin

# Lua language server
export PATH="$HOME/local/lua-language-server/bin:$PATH"

# pnpm
export PNPM_HOME="${HOME}/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

