# =============================================================================
# ░░░░ FIXES
# =============================================================================

# :: Terminal Tillix
# -----------------------------------------------------------------------------
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  if [ -x /etc/profile.d/vte.sh ]; then
    . /etc/profile.d/vte.sh
  fi
fi


# =============================================================================
# ░░░░ WELCOME
# =============================================================================

printf "Welcome to Oh My ZSH! "


# =============================================================================
# ░░░░ OH-MY-ZSH
# =============================================================================

# :: Start tmux on every shell login
[[ $TERM != "screen" ]] && [ -z "${TMUX}" ] && exec tmux

# :: If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# :: Path to your oh-my-zsh installation.
[ -d ~/.oh-my-zsh ] && export ZSH=~/.oh-my-zsh

# :: Set name of the theme to load --- if set to "random", it will
# :: load a random theme each time oh-my-zsh is loaded, in which case,
# :: to know which specific one was loaded, run: echo $RANDOM_THEME
# :: @see https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME=random
ZSH_THEME="terminalparty"

# :: Set list of themes to pick from when loading at random
# :: Setting this variable when ZSH_THEME=random will cause zsh to load
# :: a theme from this variable instead of looking in $ZSH/themes/
# :: If set to an empty array, this variable will have no effect.
ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" "imajes"  "ys" "jonathan" "amuse" "blinks" "kardan" "terminalparty" "theunraveler" "wedisagree" "wezm")

# :: Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# :: Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# :: Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# :: Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# :: Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=6

# :: Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# :: Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# :: Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# :: Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# :: Uncomment the following line to display red dots whilst waiting for completion.
# :: @caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# :: @see https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

# :: Uncomment the following line if you want to disable marking untracked files
# :: under VCS as dirty. This makes repository status check for large repositories
# :: much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# :: Uncomment the following line if you want to change the command execution time
# :: stamp shown in the history command output.
# :: You can set one of the optional three formats:
# :: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# :: or set a custom format using the strftime function format specifications,
# :: @see 'man strftime' for details.
HIST_STAMPS="yyyy/mm/dd"

# :: Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# @see https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# :: Which plugins would you like to load?
# :: Standard plugins can be found in $ZSH/plugins/
# :: Custom plugins may be added to $ZSH_CUSTOM/plugins/
# :: Example format: plugins=(rails git textmate ruby lighthouse)
# :: Add wisely, as too many plugins slow down shell startup.
plugins=(git gitignore vscode nvm npm node ng man aws docker cargo nmap python pip virtualenv colorize ansible bundler colored-man-pages zsh-syntax-highlighting zsh-autosuggestions zsh-navigation-tools zsh_reload)

# :: Runtime oh-my-zsh.sh always when I do
[ -x $ZSH/.oh-my-zsh ] && source $ZSH/oh-my-zsh.sh


# =============================================================================
# ░░░░ USER CONFIGURATION
# =============================================================================

# export MANPATH="/usr/local/man:$MANPATH"

# :: You may need to manually set your language environment
# export LANG=en_US.UTF-8
export LANG=pt_BR.UTF-8

# :: Preferred editor for local and remote sessions
#------------------------------------------------------------------------------
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='micro'
else
	export EDITOR='micro'
fi

# :: Compilation flags
#------------------------------------------------------------------------------
# export ARCHFLAGS="-arch x86_64"


# =============================================================================
# ░░░░ TERMINAL HISTORY 
# =============================================================================

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e


# =============================================================================
# ░░░░ PATHS 
# =============================================================================

# :: NixOS ~ NodeJS modules
# :: @see https://stackoverflow.com/a/65521934/1345327
export PATH="$HOME/.npm-packages/bin:$PATH"

# :: Home manager
# :: @see https://github.com/nix-community/home-manager
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH


# =============================================================================
# ░░░░ ALIASES
# =============================================================================
# :: Set personal aliases, overriding those provided by oh-my-zsh libs,
# :: plugins, and themes. Aliases can be placed here, though oh-my-zsh
# :: users are encouraged to define aliases within the ZSH_CUSTOM folder.
# :: For a full list of active aliases, run `alias`.
#
# :: Example aliases
# :: alias zshconfig="mate ~/.zshrc"
# :: alias ohmyzsh="mate ~/.oh-my-zsh"
# 
# :: Shared with bashrc
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# :: @see https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && . ~/.fzf.zsh

# :: @see https://starship.rs
[ -x starship ] && eval "$(starship init zsh)"

