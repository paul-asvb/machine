
export ZSH="$HOME/.config/zsh/ohmyzsh"

ZSH_THEME="agnoster"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git aws bun colorize deno direnv docker frontend-search jsontools kubectx kubectl node rust rsync npm nvm yarn zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete zsh-interactive-cd)

source $ZSH/oh-my-zsh.sh

# EDITOR
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# deno
export DENO_INSTALL="/home/letis/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# zoxide
export PATH="$HOME/.local/bin:$PATH"
alias z="zoxide"
