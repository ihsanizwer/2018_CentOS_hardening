echo "1.7.2 Ensure GDM login banner is configured - banner message enabled"
	touch /etc/dconf/profile/gdm
	check1=$?
	echo "user-db:user system-db:gdm file-db:/usr/share/gdm/greeter-dconf-defaults" > /etc/dconf/profile/gdm
	check2=$?
	touch /etc/dconf/db/gdm.d/01-banner-message
	check3=$?
	echo "[org/gnome/login-screen]" >> /etc/dconf/db/gdm.d/01-banner-message
	check4=$?
	echo "banner-message-enable=true" >> /etc/dconf/db/gdm.d/01-banner-message
	check5=$?
	echo "banner-message-text='Authorized uses only. All activity may be monitored and reported.'" >> /etc/dconf/db/gdm.d/01-banner-message
	check6=$?
	dconf update
	check7=$?

	if([ $check1 -eq 0 ] && [ $check2 -eq 0 ] && [ $check3 -eq 0 ] && [ $check4 -eq 0 ] && [ $check5 -eq 0 ] && [ $check6 -eq 0 ] && [ $check7 -eq 0 ]);then
		echo "Ensure GDM login banner is configured - banner message enabled  \t\t successfully completed"
		else
			echo "Some error occured. Are you running this script as root?"
	fi

	unset check1 check2 check3 check4 check5 check6 check7

echo ""