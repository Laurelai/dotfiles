# directory listing
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
# ssh aliases
alias assh='ssh -A'
alias twitter='twidge'
alias tweet='twidge update'
alias recent='twidge lsrecent'
alias tweets='watch -n 10 twidge lsrecent'
# network
alias show-est-osx="lsof -iTCP -sTCP:ESTABLISHED | awk '{print $1}' | sort -u"
alias show-est="netstat -npt4 | grep ESTABLISHED"
alias show-listen='netstat -nptl4 | grep -v 127.0.0.1'
# NOTE: pass options to head
alias apt-random='apt-cache search . | rl | head'
alias apt-fortune='apt-random -1'
alias push='pushd'
alias pop='popd'
alias lsd='dirs'
# NOTE: conflicts with using default windows
#alias screen='/usr/bin/byobu'
alias torrent='transmissioncli -D -u 100 -w `pwd`'
alias untar='tar -xzvf'
alias untgz=untar
alias setbg='feh --bg-fill'
alias wallpaper='setbg ~/.wallpaper'
