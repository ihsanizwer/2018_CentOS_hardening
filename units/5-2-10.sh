
echo "5.2.10. Checking for back up file"

	if [ -f  /etc/ssh/sshdconfig_1835_orig.conf  ];then
		echo "Backup file already Exists"
	else
		cp  /etc/ssh/sshd_config /etc/ssh/sshdconfig_1835_orig.conf
		echo "Back up file created"
	fi

echo "Ensure SSH PermitUserEnvironment is disabled" 

	target=`grep -n "PermitUserEnvironment" /etc/ssh/sshd_config | cut -f1 -d:`

	sed -i ${target}'s/.*/PermitUserEnvironment no/' /etc/ssh/sshd_config
	check=$?

	if [ $check -eq 0 ];then
			echo -e "Ensure SSH PermitUserEnvironment is disabled \t\t successfully completed"
		else
			echo "Some error occured. Are you running this script as root?"
	fi
	unset target check
echo ""
