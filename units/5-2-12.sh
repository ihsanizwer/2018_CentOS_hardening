
echo "Checking for back up file"

	if [ -f  /etc/ssh/sshdconfig_1835_orig.conf  ];then
		echo "Backup file already Exists"
	else
		cp  /etc/ssh/sshd_config /etc/ssh/sshdconfig_1835_orig.conf
		echo "Back up file created"
	fi

echo "5.2.12. Ensure SSH Idle Timeout Interval is configured"
	
	target1=`grep -n "ClientAliveInterval" /etc/ssh/sshd_config | cut -f1 -d:`
	target2=`grep -n "ClientAliveCountMax" /etc/ssh/sshd_config | cut -f1 -d:`

	sed -i ${target1}'s/.*/ClientAliveInterval 300/' /etc/ssh/sshd_config
	check1=$?

	sed -i ${target2}'s/.*/ClientAliveCountMax 0/' /etc/ssh/sshd_config
	check2=$?

	if ([ $check1 -eq 0 ] && [ $check2 -eq 0 ]);then
		echo -e "Ensure SSH Idle Timeout Interval is configured \t\t successfully completed"
		else
			echo "Some error occured. Are you running this script as root?"
	fi
	unset check1 check2 target1 target2

echo ""