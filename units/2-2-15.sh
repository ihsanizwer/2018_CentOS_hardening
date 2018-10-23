echo "Ensure mail transfer agent is configured for local-only mode"
	
	echo "Checking for backup files"
	if [ -f  /etc/postfix/main_orig_1835 ];then
		echo "Backup file already exists"
	else
		cp /etc/postfix/main.cf /etc/postfix/main_orig_1835
		echo "backup file created"
	fi

	target=`grep -n '^inet_interfaces' /etc/postfix/main.cf  | cut -f1 -d:`

	sed -i ${target}'s/.*/inet_interfaces = loopback-only/' /etc/postfix/main.cf 
	check=$?

	systemctl restart postfix
	check2=$?

	if ([ $check -eq 0 ] && [ $check2 -eq 0 ]);then
		echo "Ensure mail transfer agent is configured for local-only mode\t\t successfully completed."
	else
		echo "Some error occured. Are you running this script as root?"
	fi

	unset check target check2
echo ""