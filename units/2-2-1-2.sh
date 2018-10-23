echo "2.2.1.2. Ensure ntp is configured - NTP Server"
	
	echo "Checking if backup file exists"
	if [ -f /etc/ntp_orig_1835 ];then
		echo "Backup file already exists"
	else
		cp /etc/ntp.conf /etc/ntp_orig_1835
		echo "Backup file created"
	fi

	target=`grep -n '^restrict default nomodify notrap nopeer noquery' /etc/ntp.conf | cut -f1 -d:`
	target2=$((target+1))
	sed -i ${target}'s/.*/restrict -4 default kod nomodify notrap nopeer noquery/' /etc/ntp.conf
	check1=$?
	sed -i ${target2}'s/.*/restrict -6 default kod nomodify notrap nopeer noquery/' /etc/ntp.conf
	check2=$?

	if ([ $check1 -eq 0 ] && [ $check2 -eq 0 ]);then
		echo "Ensure ntp is configured - NTP Server\t\t successfully completed."
	else
		echo "Some error occured. Are you running this script as root?"
	fi

	unset check1 check2 target target2
echo ""