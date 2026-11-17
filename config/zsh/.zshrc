# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in snippets (loaded in background so startup never freezes)
zinit ice wait lucid; zinit snippet OMZP::git
zinit ice wait lucid; zinit snippet OMZP::sudo
zinit ice wait lucid; zinit snippet OMZP::archlinux
zinit ice wait lucid; zinit snippet OMZP::command-not-found
zinit ice wait lucid; zinit snippet OMZP::aws
zinit ice wait lucid; zinit snippet OMZP::kubectl
zinit ice wait lucid; zinit snippet OMZP::kubectx
zinit ice wait lucid; zinit snippet OMZP::dnf

# Add in zsh plugins
zinit light zsh-users/zsh-completions

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e
bindkey '^P' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

# Homebrew
[[ -x /home/linuxbrew/.linuxbrew/bin/brew ]] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export JAVA_HOME=/usr/lib/jvm/java-17-temurin-jdk
export PATH=$JAVA_HOME/bin:$PATH
setopt INTERACTIVE_COMMENTS

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH

export EDITOR="nvim"
export VISUAL="nvim"
export SYSTEMD_EDITOR="nvim"

export PATH="/home/sam/texlive/2026/bin/x86_64-linux:$PATH"

export PATH=/opt/cuda/bin:$PATH
export LD_LIBRARY_PATH=/opt/cuda/lib64:$LD_LIBRARY_PATH

# for sudo systemctl edit cmds
alias systemctl-edit='sudo SYSTEMD_EDITOR=/usr/bin/nvim systemctl edit'

# Ventoy Web UI Shortcut downloaded from cachy repo
alias ventoy-web='sudo /opt/ventoy/VentoyWeb.sh'

alias pacdiff='sudo DIFFPROG="nvim -d" pacdiff'

# for ac bypass battery laptop
alias bypass-on="echo 1 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode"
alias bypass-off="echo 0 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode"
