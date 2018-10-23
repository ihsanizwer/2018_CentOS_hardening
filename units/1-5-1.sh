echo "Ensure core dumps are restricted"
	
	echo "Checking if backup file for /etc/security/limits.d/* exists."
	if [ -f /etc/security/limits.d/limit_1835_orig.conf ];then
		echo "Backup file already exists."
	else
		cp /etc/security/limits.d/*proc.conf limit_1835_orig.conf
		echo "Backup file created"
	fi

	echo "* hard core 0" >> /etc/security/limits.d/*proc.conf
	check1=$?

	echo "Checking if backup file for /etc/sysctl.d/* exists"
	if [ -f /etc/sysctl.d/conf_orig_1835 ];then
		echo "Backup file already exists"
	else
		cp /etc/sysctl.d/*sysctl.conf /etc/sysctl.d/conf_orig_1835
		echo "Backup file created"
	fi

	echo "fs.suid_dumpable = 0" >> /etc/sysctl.d/*sysctl.conf
	check2=$?

	sysctl -w fs.suid_dumpable=0
	check3=$?

	if([ $check1 -eq 0 ] && [ $check2 -eq 0 ] && [ $check3 -eq 0 ]);then
		echo "Ensure core dumps are restricted\t\t successfully completed."
	else
		echo "Some error occured. Are you running this script as root?"
	fi

	unset check1 check2 check3
echo ""