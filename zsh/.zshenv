export COLORTERM=truecolor

export HISTSIZE=5000
export SAVEHIST=5000
export HISTFILE=~/.zhistory

[ -f $HOME/.tokens ] && source $HOME/.tokens

# Scripts
export PATH=$PATH:$HOME/scripts

# Golang
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin

# Deno
export DENO_INSTALL=$HOME/.deno
export PATH="$DENO_INSTALL/bin:$PATH"

# Rust
. "$HOME/.cargo/env"

# Zig
export PATH=$PATH:$HOME/local/zig/bin
export PATH=$PATH:$HOME/local/zls/bin

# Neovim
export PATH=$PATH:$HOME/local/nvim/bin

# Lua language server
export PATH="$HOME/local/lua-language-server/bin:$PATH"

# NVM (Node)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
