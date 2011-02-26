# directory listing
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -la'
alias l='ls -CF'
# ssh aliases
alias assh='ssh -A'
alias twitter='twidge'
alias tweet='twidge update'
alias recent='twidge lsrecent'
alias tweets='watch -n 10 twidge lsrecent'
# network
alias show-est-osx="sudo lsof -iTCP -sTCP:ESTABLISHED | awk '{print $1}' | sort -u"
# NOTE: pass options to head
alias apt-random='apt-cache search . | rl | head'
alias apt-fortune='apt-random -1'
alias push='pushd'
alias pop='popd'
alias pd='pushd .'
alias pp='popd'
alias lsd='dirs'
# NOTE: conflicts with using default windows
#alias screen='/usr/bin/byobu'
alias torrent='transmissioncli -D -u 100 -w `pwd`'
alias untar='tar -xzvf'
alias untgz=untar
alias setbg='feh --bg-fill'
alias emacs='emacs -nw'
alias js='rlwrap nodejs-repl'
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias bgd='bg && disown'
alias ipaddress='curl -s http://checkip.dyndns.org/ | grep -o "[[:digit:].]\+"'
