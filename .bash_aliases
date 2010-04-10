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
alias show-est="lsof -iTCP -sTCP:ESTABLISHED | awk '{print $1}' | sort -u"
# NOTE: pass options to head
alias apt-random='apt-cache search . | rl | head'
alias apt-fortune='apt-random -1'
