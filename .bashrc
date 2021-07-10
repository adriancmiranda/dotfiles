# =============================================================================
# ░░░░ FIXES
# =============================================================================
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# -----------------------------------------------------------------------------
# If not running interactively, don't do anything
case $- in *i*) ;; *) return;; esac

# Terminal Tillix
# -----------------------------------------------------------------------------
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  if [ -x /etc/profile.d/vte.sh ]; then
    . /etc/profile.d/vte.sh
  fi
fi


# =============================================================================
# ░░░░ WELCOME
# =============================================================================

printf "Welcome to Bourne Again Shell"


# =============================================================================
# ░░░░ TMUX
# =============================================================================

# Start tmux on every shell login
[[ $TERM != "screen" ]] && [ -z "${TMUX}" ] && exec tmux


# =============================================================================
# ░░░░ ALIASES
# =============================================================================

# Shared with zshrc
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# @see https://github.com/junegunn/fzf
[ -f ~/.fzf.bash ] && . ~/.fzf.bash


# =============================================================================
# ░░░░ PATHS
# =============================================================================

# NixOS paths
export PATH="$HOME/.npm-packages/bin:$PATH"
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH

