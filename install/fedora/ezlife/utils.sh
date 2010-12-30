Utils() {

	echo "[$FUNCNAME]"

	yum install -y nautilus-open-terminal system-config-boot system-config-language		\
		       gconf-editor cups-pdf p7zip p7zip-plugins				\
		       unrar isomaster yumex xchm lshw lshw-gui					\
		       yum-presto yum-fastestmirror system-config-display
	
	if [[ $? != 0 ]]; then

		ErrMsg "Could not install packages"
		return 1
	
	fi

}
