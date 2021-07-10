printf "Welcome to Oh My ZSH!"


# =============================================================================
# ░░░░ TMUX
# =============================================================================

# Start tmux on every shell login
[[ $TERM != "screen" ]] && [ -z "${TMUX}" ] && exec tmux


# =============================================================================
# ░░░░ TERMINAL HISTORY 
# =============================================================================

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install


# =============================================================================
# ░░░░  
# =============================================================================

# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit
# End of lines added by compinstall


# =============================================================================
# ░░░░ PATHS 
# =============================================================================

# NixOS ~ NodeJS modules
# @see https://stackoverflow.com/a/65521934/1345327
export PATH="$HOME/.npm-packages/bin:$PATH"
# End of lines added by NixOS ~ NodeJS

# home-manager
# @see https://github.com/nix-community/home-manager
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
# End of lines added by home-manager


# =============================================================================
# ░░░░ ALIASES
# =============================================================================
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# 
# Shared with bashrc
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# @see https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && . ~/.fzf.zsh
