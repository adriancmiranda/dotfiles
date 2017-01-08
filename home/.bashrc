#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# Variables
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
iplocal=$(ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1' | sed '1 d' | head -n1);
ips=$(ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1');


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# Shortcuts
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias ..='cd ..';
alias ...='cd ../../';
alias ....='cd ../../../';
alias .....='cd ../../../../';
alias ......='cd ../../../../../';
alias .......='cd ../../../../../../';
alias ........='cd ../../../../../../../';
alias .........='cd ../../../../../../../../';
alias ..........='cd ../../../../../../../../../';
alias ...........='cd ../../../../../../../../../../';
alias .1='cd ../';
alias .2='cd ../../';
alias .3='cd ../../../';
alias .4='cd ../../../../';
alias .5='cd ../../../../../';
alias .6='cd ../../../../../../';
alias .7='cd ../../../../../../../';
alias .8='cd ../../../../../../../../';
alias .9='cd ../../../../../../../../../';
alias o='open';
alias o.='o .';
alias back='cd -';
alias apps='cd /Applications';
alias docs='cd ~/Documents';
alias sites='cd ~/Sites';
alias desktop='cd ~/Desktop';
alias sitesnginx='cd ~/SitesNginx';
alias gdrive='cd ~/Google\ Drive/';
alias jsc='/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc';
alias iplocal="echo $iplocal";
alias ip='curl icanhazip.com';
alias ips="echo '$ips'";
alias reboot='sudo /sbin/reboot';
alias whois="whois -h whois-servers.net";
alias poweroff='sudo /sbin/poweroff';
alias halt='sudo /sbin/halt';
alias shutdown='sudo /sbin/shutdown';
alias fhere="find . -name ";
alias ports='sudo lsof -iTCP -sTCP:LISTEN -P';
alias speedup="sudo rm -rf /private/var/log/asl/*";
alias update="sudo softwareupdate -i -a; brew update; brew upgrade";
alias emptyTrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; speedup";
alias clearTrash=emptyTrash;
alias showDotFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app';
alias hideDotFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app';
alias disableBonjour='sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist && sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.mDNSResponderHelper.plist';
alias enableBonjour='sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist && sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.mDNSResponderHelper.plist';
alias cleanBonjour='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder; say DNS cache flushed';
alias putTernJS='cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/tern_for_sublime && npm i && cd -';
alias npmr='npm run';

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# Overrides
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias mkdir='mkdir -pv';
alias grep='grep -n';
alias ls='ls -Ghpl';
alias df='df -kTh';
alias du='du -hsc'; # (only directory size)
alias rm='rm -iv';
alias cp='cp -iv';
alias mv='mv -iv';
alias now='date +"%T"';
alias nowdate='date +"%d-%m-%Y"';


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# Extras
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias edit='subl';
alias rrun='rerun foreman start web';
alias cleanupds="find . -type f -name '*.DS_Store' -or -type f -name 'Thumbs.db' -ls -delete";
alias rsa='pbcopy < "$HOME"/.ssh/id_rsa.pub && echo -e "${BCya}RSA Key copied to clipboard! ${NC}"';
alias reload='source "$HOME"/.bash_profile && source "$HOME"/.bashrc && dscacheutil -flushcache';
alias bashrc='edit "$HOME"/.bashrc';
alias gitconfig='edit "$HOME"/.gitconfig';
alias vimrc="edit $HOME/.vimrc";
alias tmux.conf="edit $HOME/.tmux.conf";
alias hosts='edit /private/etc/hosts';
alias httpd-vhosts='edit /private/etc/apache2/extra/httpd-vhosts.conf';
alias vhosts=httpd-vhosts;
alias httpdconf='edit /etc/apache2/httpd.conf';
alias httpdconfig=httpdconf;
alias bash_profile='edit "$HOME"/.bash_profile';
alias profile='edit "$HOME"/.profile';
alias resolvConf='edit /etc/resolv.conf';
alias nginxConf='edit /usr/local/etc/nginx/nginx.conf';
alias path='echo -e ${PATH//:/\\n}';
alias libpath='echo -e "${LD_LIBRARY_PATH//:/\\n}"';
alias top='xtitle Processes on "$HOST" && top';
alias make='xtitle Making $(basename "$PWD") ; make';
alias debug="set -o nounset; set -o xtrace";
alias venv3='source "$HOME"/.local/bin/venv3/bin/activate';
alias vtop='vtop --theme brew';
alias stopApache='sudo apachectl stop';
alias startApache='sudo apachectl start';
alias restartApache='sudo apachectl restart';
alias testApache='apachectl configtest';


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# Common
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function localhost() {
    local WORKSPACE="$HOME/Sites";
    local LOCALHOST="$(iplocal)";
    local DIRECTORY=$(pwd);
    local PORT='^[0-9]+$';
    if [[ -z $LOCALHOST ]]; then
        LOCALHOST='localhost';
    fi
    LOCALHOST="http://$LOCALHOST/~$USER";
    if [[ $1 =~ $PORT ]]; then
    # Launch a local web server from specific port
        open "http://localhost:$1";
    elif [ `echo "$DIRECTORY" | grep -o "$WORKSPACE.*"` ]; then
    # Launch a local web server from workspace
        AMBIENT=`echo "$DIRECTORY" | sed 's,'"$WORKSPACE"','"$LOCALHOST"','`;
        open "$AMBIENT/$1";
    else
    # Launch a local web server from a directory if isn't workspace folder
        python -m SimpleHTTPServer 8080 &> /dev/null &
        open http://localhost:8080/;
    fi
}

function mkd() {
    mkdir -p "$@" && cd "$_";
}

function cd() {
    builtin cd "$@";
    printf "${Gre}[$(pwd)]${NC}\n";
    ls;
}

function man() {
    for id ; do
        xtitle The $(basename $1|tr -d .[:digit:]) manual;
        command man -a "$id";
    done
}
