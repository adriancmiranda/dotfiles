# =============================================================================
# ░░░░ FIXES
# =============================================================================

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Terminal Tillix
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
if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi



# =============================================================================
# ░░░░ PATHS
# =============================================================================

export PATH="$HOME/.npm-packages/bin:$PATH"
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH


