# Oh-My-Zsh
export ZSH="/Users/mofeoluwa/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(
  git
  timer
  zsh-autosuggestions
  zsh-syntax-highlighting
  fast-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# --- Antigravity History Isolation ---
_antigravity_history_setup() {
    if [[ "$TERM_PROGRAM" == "vscode" ]]; then
        local current_dir=$(pwd -P)
        local root="$current_dir"

        while [[ "$root" != "/" && ! -d "$root/.git" && ! -d "$root/.antigravity" ]]; do
            root=$(dirname "$root")
        done

        if [[ "$root" != "/" ]]; then
            local hist_dir="$root/.antigravity"
            mkdir -p "$hist_dir"
            export HISTFILE="$hist_dir/history"

            [[ -f "$HISTFILE" ]] && fc -R "$HISTFILE"
        fi
    fi
}

# Run on startup
_antigravity_history_setup

# Re-run when changing directories
autoload -Uz add-zsh-hook
add-zsh-hook chpwd _antigravity_history_setup

# Shell behaviour
set -o vi
eval "$(atuin init zsh)"

# Environment Variables
export EDITOR="nvim"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude .venv --exclude node_modules"
export PATH="$PATH:$HOME/.local/bin:$HOME/go/bin:/usr/local/go/bin:/opt/homebrew/bin"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"

# Aliases
alias ls='lsd'
alias j='z'
alias cat='bat'
alias vim='nvim'
alias ae='source .venv/bin/activate'

# Ring bell after each command so tmux can detect completion in other windows
_tmux_bell() { printf '\a' }
add-zsh-hook precmd _tmux_bell

# Functions
portpid()
{
	if [[ ${#1} -eq 0 ]] then
		echo "Provide a port number whose PID you'd like to get"
		return 64
	fi

	lsof -i tcp:$1 -P | awk '{print $2}' | grep -e "[0-9]"
}

# Tools
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(zoxide init zsh)"

# NVM (Node.js)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# bun completions
[ -s "/Users/mofeoluwa/.bun/_bun" ] && source "/Users/mofeoluwa/.bun/_bun"

# Added by Antigravity
export PATH="/Users/mofeoluwa/.antigravity/antigravity/bin:$PATH"

# opencode
export PATH=/Users/mofeoluwa/.opencode/bin:$PATH
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
