Codecs() {

	echo "[$FUNCNAME]"

	yum install -y 	gstreamer gstreamer-plugins-base gstreamer-plugins-bad 				\
			gstreamer-plugins-bad-free gstreamer-plugins-bad-free-extras			\
			gstreamer-plugins-bad-nonfree gstreamer-plugins-base gstreamer-plugins-good	\
			gstreamer-plugins-ugly gstreamer-ffmpeg libmad	libmatroska lsdvd		\
		       	xine-lib-extras xine-lib-extras-nonfree xine-lib-pulseaudio			\
			xine-lib-extras-freeworld faad2 faac libdca					\
		       	wget compat-libstdc++-33 compat-libstdc++-296
	
	[[ "$?" != 0 ]] && ErrMsg "Could not install packages" && return 1


	# Don't waste time and bandwidth downloading mplayer-codecs-all if x86_64 is running
	# since those codecs only work for i386 mplayer
	IsX86_64
	if [[ "$?" != 0 ]]; then

		rpm -q mplayer-codecs-all

		[[ "$?" == 0 ]] && OkMsg "Codecs package is already installed" && return 0


		CODECSPKG="mplayer-codecs-all-20071007-1.i386.rpm"

		cd ~
		[[ -f "$CODECSPKG" ]] && rm -rf "$CODECSPKG"
	
		Download name "$CODECSPKG"

		[[ "$?" != 0 ]] && ErrMsg "Could not download package $CODECSPKG" && return 1

		yum localinstall --nogpgcheck -y "${PKGS[KEY]}"

		[[ "$?" != 0 ]] && ErrMsg "Could not install package ${PKGS[KEY]}" && return 1

		rm -rf "$CODECSPKG"

	fi

	# Remove possible defective thumbnails, so new ones can be sanely created
	rm -rf ~"$USERNAME"/.thumbnails/*

	#Call libdvdcss function
	Libdvdcss

}
