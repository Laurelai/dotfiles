#!/bin/sh

usage ()
{
	echo "usage: <install|enable|disable> [ip exceptions]"
	exit
}

if [ -z $1 ]
then
	usage
fi

TORRC=/etc/tor/torrc
if [ $1 = "install" ]
then
	echo "installing tor..."
	apt-get -y install tor
	echo "configuring torrc..."
	echo "AutomapHostsOnResolve 1" >> $TORRC 
	echo "TransPort 9040" >> $TORRC
	echo "DNSPort 53" >> $TORRC
	echo "restarting tor..."
	/etc/init.d/tor restart
elif [ $1 = "enable" ]
then
	# destinations you don't want routed through Tor, space seperated list
	NON_TOR=`ifconfig | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}' | xargs echo`
	NON_TOR="$NON_TOR $*"
	echo "exceptions are: $NON_TOR"

	# the UID Tor runs as
	TOR_UID=`id -u debian-tor`

	# Tor's TransPort
	TRANS_PORT="9040"

	cp /etc/resolv.conf /etc/resolv.conf.orig
	echo "nameserver 127.0.0.1" > /etc/resolv.conf

	iptables -F
	iptables -t nat -F

	iptables -t nat -A OUTPUT -m owner --uid-owner $TOR_UID -j RETURN
	for NET in $NON_TOR 127.0.0.0/9 127.128.0.0/10; do
		iptables -t nat -A OUTPUT -d $NET -j RETURN
	done
	iptables -t nat -A OUTPUT -p udp --dport 53 -j REDIRECT --to-ports 53
	iptables -t nat -A OUTPUT -p tcp --syn -j REDIRECT --to-ports $TRANS_PORT

	iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
	for NET in $NON_TOR 127.0.0.0/8; do
		iptables -A OUTPUT -d $NET -j ACCEPT
	done
	iptables -A OUTPUT -m owner --uid-owner $TOR_UID -j ACCEPT
	iptables -A OUTPUT -j REJECT
elif [ $1 = "disable" ]
then
	iptables --flush
	cp /etc/resolv.conf.orig /etc/resolv.conf
else
	usage
fi
