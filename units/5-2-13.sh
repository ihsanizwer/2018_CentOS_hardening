echo "5.2.13. Ensure SSH LoginGraceTime is set to one minute or less"

echo "Checking for back up file"

	if [ -f  /etc/ssh/sshdconfig_1835_orig.conf  ];then
		echo "Backup file already Exists"
	else
		cp  /etc/ssh/sshd_config /etc/ssh/sshdconfig_1835_orig.conf
		echo "Back up file created"
	fi
	
	target=`grep -n "LoginGraceTime" /etc/ssh/sshd_config | cut -f1 -d:`

	sed -i ${target}'s/.*/LoginGraceTime 60/' /etc/ssh/sshd_config
	check=$?
	if [ $check -eq 0 ];then
			echo -e "Ensure SSH LoginGraceTime is set to one minute or less \t\t successfully completed"
		else
			echo "Some error occured. Are you running this script as root?"
	fi
	unset target check
echo ""