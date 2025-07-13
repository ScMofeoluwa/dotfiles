# Oh-My-Zsh
export ZSH="/Users/mofeoluwa/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(
  git
  timer
  zsh-autosuggestions
  zsh-syntax-highlighting
  fast-syntax-highlighting
  zsh-autocomplete
)
source $ZSH/oh-my-zsh.sh

# Shell behaviour
set -o vi

# Environment Variables
export EDITOR="nvim"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude .venv --exclude node_modules"
export PATH="$PATH:$HOME/.local/bin:$HOME/go/bin:/usr/local/go/bin:/opt/homebrew/bin"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"

# Aliases
alias ls='lsd'
alias cat='bat'
alias vim='nvim'
alias ae='source .venv/bin/activate'

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
