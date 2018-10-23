echo "Ensure root login is restricted to system console"
	echo "Checking for backup file for /etc/securetty"	
	if [ -f /etc/securetty_orig_1835 ];then
		echo "Backup file already exists"
	else
		cp /etc/securetty /etc/securetty_orig_1835
		echo "Created backup file for /etc/securetty"
	fi

	echo "tty1" > /etc/securetty
	check1=$?
	echo "tty2" > /etc/securetty
	check2=$?

	if ([ $check1 -eq 0 ] && [ $check2 -eq 0 ]);then
		echo "Ensure root login is restricted to system console\t\t successfully completed."
		else
		echo "Some error occured. Are you running this script as root?"
	fi

echo ""