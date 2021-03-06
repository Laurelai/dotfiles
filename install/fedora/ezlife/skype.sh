Skype() {

	echo "[$FUNCNAME]"

	if [[ ! -f /etc/yum.repos.d/skype.repo ]]; then

cat << EOF > /etc/yum.repos.d/skype.repo
[skype]
name=Skype Repository
baseurl=http://download.skype.com/linux/repos/fedora/updates/i586/
enabled=0
gpgchek=0
EOF

	fi

	yum --enablerepo=skype --nogpgcheck install -y skype libXScrnSaver.i?86      \
		libX11.i?86 libv4l.i?86 alsa-plugins-pulseaudio.i?86 qt-x11.i?86     \
		glibc*686 libXScrnSaver*686 libasound.so.2 libXv.so.1 libQtDBus.so.4 \
		libQtGui.so.4

	[[ $? != 0 ]] && ErrMsg "Package not installed" && return 1

}
