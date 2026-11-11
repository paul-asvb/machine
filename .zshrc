export ZSH="$HOME/.config/zsh/ohmyzsh"

ZSH_THEME="agnoster"

plugins=(git aws bun colorize deno direnv docker kubectl node rust nvm yarn zsh-autosuggestions zsh-syntax-highlighting zsh-autocomplete)

source $ZSH/oh-my-zsh.sh

# add bin to path
export PATH="$HOME/.local/bin:$PATH"

# EDITOR
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

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

# cargo
export PATH="$HOME/.cargo/bin:$PATH"


# zoxide
export PATH="$HOME/.local/bin:$PATH"
eval "$(zoxide init zsh)"

check_kernel ()
{
    local running=$(uname -r);
    local on_disk=$(pacman -Q linux | awk '{print $2}');
    local running_clean=$(echo "$running" | sed 's/-/./');
    echo -e "Running: $running";
    echo -e "On Disk: $on_disk";
    if [[ "$on_disk" == "$running_clean" ]]; then
        echo -e "\e[32m✔ Kernel is up to date.\e[0m";
    else
        echo -e "\e[31m✘ Reboot required!\e[0m";
    fi
}

check_kernel();
