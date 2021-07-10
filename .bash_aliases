# =============================================================================
# ░░░░ TEST COLORS 
# =============================================================================

# Welcome
curl -L git.io/unix

# @see https://gist.github.com/adriancmiranda/0be5cf09c657955f81aa68ffdaf28f98
#printf "\x1b[${bg};2;${red};${green};${blue}m\n"
#printf "\x1b[38;2;255;100;0mTRUECOLOR\x1b[0m\n"
#printf "\x1b[${bg}\n"
#awk 'BEGIN{
#    s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
#    for (colnum = 0; colnum<77; colnum++) {
#        r = 255-(colnum*255/76);
#        g = (colnum*510/76);
#        b = (colnum*255/76);
#        if (g>255) g = 510-g;
#        printf "\033[48;2;%d;%d;%dm", r,g,b;
#        printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
#        printf "%s\033[0m", substr(s,colnum+1,1);
#    }
#    printf "\n";
#}'


# =============================================================================
# ░░░░ ALIASES 
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

alias @='cd ~/'
alias @sites='cd ~/Sites'
alias @downloads='cd ~/Downloads'
alias @documents='cd ~/Documents'
alias @pictures='cd ~/Pictures'
alias @desktop='cd ~/Desktop'
alias @videos='cd ~/Videos'
alias @music='cd ~/Music'

alias @nvim='cd ~/.config/nvim'
alias @nixpkgs='cd ~/.config/nixpkgs'

alias gitconfig='nvim ~/.gitconfig'
alias zshrc='nvim ~/.zshrc'
alias bashrc='nvim ~/.bashrc'
alias profile='nvim ~/.profile'
alias aliases='nvim ~/.bash_aliases'
alias bash_profile='nvim ~/.bash_profile'
alias bash_aliases='nvim ~/.bash_aliases'
alias ohmyzsh='nvim ~/.oh-my-zsh'
alias tmux.conf='nvim ~/.tmux.conf'
alias reload='
. ~/.zshrc &&\
. ~/.bashrc &&\
. ~/.profile &&\
. ~/.bash_profile &&\
. ~/.bash_aliases &&\
tmux source ~/.tmux.conf
'

alias npmr='npm run'

alias home.nix='sudo nvim ~/.config/nixpkgs/home.nix'
alias configuration.nix='sudo nvim /etc/nixos/configuration.nix'
alias nix-delete-old-generations='sudo nix-env -p /nix/var/nix/profiles/system --delete-generations old && nix-collect-garbage -d'


# =============================================================================
# ░░░░ OVERRIDES 
# =============================================================================

alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'


# =============================================================================
# ░░░░ FUNCTIONS 
# =============================================================================


