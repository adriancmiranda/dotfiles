# =============================================================================
# :: Set personal aliases, overriding those provided by oh-my-zsh libs,
# :: plugins, and themes. Aliases can be placed here, though oh-my-zsh
# :: users are encouraged to define aliases within the ZSH_CUSTOM folder.
# :: For a full list of active aliases, run `alias`.
# =============================================================================

if [[ -r "$HOME/.secret.conf" ]]; then
	. "$HOME/.secret.conf"
else
	printf "${ERROR}ERROR(~/.bash_aliases):${NC} .secret.conf not found. Run:\n"
	printf "touch ~/.secret.conf\n"
fi


# =============================================================================
# ░░░░ FALLBACKS 
# =============================================================================

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias open='thunar'


# =============================================================================
# ░░░░ OVERRIDES 
# =============================================================================

# :: Pristine
# -----------------------------------------------------------------------------
alias mkdir='mkdir -pv'
alias grep='grep -n'
alias du='du -hsc'
alias df='df -kTh'
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias ls='ls -Ghpl --color=auto'

# :: Dirty
# -----------------------------------------------------------------------------
function cd {
	builtin cd "$@"
	printf "${Gre}[$(pwd)]${NC}\n"
	ls
}


# =============================================================================
# ░░░░ NAVIGATION
# =============================================================================

alias .-='cd -'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .......='cd ../../../../../../'
alias ........='cd ../../../../../../../'
alias .........='cd ../../../../../../../../'
alias ..........='cd ../../../../../../../../../'
alias ...........='cd ../../../../../../../../../../'
alias .1='cd ../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias .7='cd ../../../../../../../'
alias .8='cd ../../../../../../../../'
alias .9='cd ../../../../../../../../../'


# =============================================================================
# ░░░░ PROFILE
# =============================================================================

alias @='cd ~/'
alias @sites='cd ~/Sites/'
alias @downloads='cd ~/Downloads/'
alias @documents='cd ~/Documents/'
alias @pictures='cd ~/Pictures/'
alias @desktop='cd ~/Desktop/'
alias @videos='cd ~/Videos/'
alias @music='cd ~/Music/'


# =============================================================================
# ░░░░ DOTFILES
# =============================================================================

alias gitconfig='nvim ~/.gitconfig'
alias zshrc='nvim ~/.zshrc'
alias bashrc='nvim ~/.bashrc'
alias profile='nvim ~/.profile'
alias aliases='nvim ~/.bash_aliases'
alias bash_profile='nvim ~/.bash_profile'
alias bash_aliases='nvim ~/.bash_aliases'
alias ohmyzsh='nvim ~/.oh-my-zsh'
alias tmux.conf='nvim ~/.tmux.conf'
alias tmux.osx.conf='nvim ~/.tmux.osx.conf'
alias init.vim='nvim ~/.config/nvim/init.vim'
alias reload='
. ~/.zshrc &&\
. ~/.bashrc &&\
. ~/.profile &&\
. ~/.bash_profile &&\
. ~/.bash_aliases &&\
tmux source ~/.tmux.conf
'


# =============================================================================
# ░░░░ NIXOS
# =============================================================================

alias @nvim='cd ~/.config/nvim/'
alias @nixpkgs='cd ~/.config/nixpkgs/'
alias home.nix='sudo nvim ~/.config/nixpkgs/home.nix'
alias configuration.nix='sudo nvim /etc/nixos/configuration.nix'
alias nix-delete-old-generations='sudo nix-env -p /nix/var/nix/profiles/system --delete-generations old && nix-collect-garbage -d'


# =============================================================================
# ░░░░ EXTRAS 
# =============================================================================

# :: Shortcuts
# -----------------------------------------------------------------------------
alias npmr='npm run'
alias reload.audio='pulseaudio -k && sudo alsa force-reload'
alias unabled_to_download='sudo dpkg --configure -a && apt-get -f install && apt-get -f remove && apt-get update && apt-get upgrade'
alias iplocal="echo $(hostname -I)"
alias path='echo -e ${PATH//:/\\n}'
alias rsa='pbcopy < ~/.ssh/id_rsa.pub && echo -e "${BCya}RSA Key copied to clipboard! ${NC}"'
alias venv3='source ~/.local/bin/venv3/bin/activate'
alias source.list='sudo nvim /etc/apt/sources.list'
alias o='open'
alias o.='open .'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# :: Enable color support of ls and also add handy aliases
# -----------------------------------------------------------------------------
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# :: Make directory
# -----------------------------------------------------------------------------
function mkd {
    mkdir -p "$@" && cd "$_"
}

# :: Starts a HTTP server on port 8080 (which is the default port).
# -----------------------------------------------------------------------------
function localhost {
	python -m SimpleHTTPServer 8080 &> /dev/null &
	open http://localhost:8080/
}

# :: Allow you to kill a certain process
# -----------------------------------------------------------------------------
function killport {
	sudo kill -9 $(lsof -t -i tcp:$1)
}

# :: Test colors
# :: @see https://gist.github.com/adriancmiranda/0be5cf09c657955f81aa68ffdaf28f98
# -----------------------------------------------------------------------------
function testcolors {
	printf "\x1b[${bg};2;${red};${green};${blue}m\n"
	printf "\x1b[38;2;255;100;0mTRUECOLOR\x1b[0m\n"
	printf "\x1b[${bg}\n"
	awk 'BEGIN{
	   s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
	   for (colnum = 0; colnum<77; colnum++) {
	       r = 255-(colnum*255/76);
	       g = (colnum*510/76);
	       b = (colnum*255/76);
	       if (g>255) g = 510-g;
	       printf "\033[48;2;%d;%d;%dm", r,g,b;
	       printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
	       printf "%s\033[0m", substr(s,colnum+1,1);
	   }
	   printf "\n";
	}'
}

# :: Docker build & run
# -----------------------------------------------------------------------------
function dockerbr {
	local name=$1
	local port=$2
	printf "${Gre}[$name:$port]${NC}\n"
	{ docker stop $(docker ps -a -q --filter="name=$name"); } ||
	{ printf "$name was stopped!\n"; }
	docker rm $name
	docker rmi $name
	docker build --tag $name .
	docker run --publish $port:8080 --detach --name $name $name
	printf "${Gre}opening:${NC}http://localhost:$port\n"
	open "http://localhost:$port"
}

# :: Navigate to Sites directory
# -----------------------------------------------------------------------------
function sites {
	if [[ $@ ]]; then
		if [[ $@ =~ ^/ ]]; then
			cd "$SITES_DIR$@"
		else
			cd "$SITES_DIR/$@"
		fi
	else
		builtin cd "$SITES_DIR"
	fi
}

# :: Connect to timecapsule
# -----------------------------------------------------------------------------
function timecapsule {
	sudo mkdir -p $HOME/capsule
	sudo mount.cifs //10.0.1.1/Data $HOME/capsule -o user=adrian.miranda,sec=ntlm,vers=1.0
}
