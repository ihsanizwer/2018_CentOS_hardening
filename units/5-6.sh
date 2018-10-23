echo "Ensure access to the su command is restricted"
	echo "Checking for backup file for /etc/pam.d/su"
	if [ -f /etc/pam.d/su_orig_1835 ];then
		echo "Backup file already exists"
	else
		cp /etc/pam.d/su /etc/pam.d/su_orig_1835
			if [ $? -eq 0 ];then
			echo "Backup file for /etc/pam.d/su created"
		else
			echo "Unable to create backup file. Are you running this script as root?"
		fi
	fi

	echo "Checking for backup file for /etc/group"
	if [ -f /etc/group_orig1835 ];then
		echo "Backup file already exists"
	else
		cp /etc/group /etc/group_orig1835
			if [ $? -eq 0 ];then
			echo "Backup file for /etc/group  created"
		else
			echo "Unable to create backup file. Are you running this script as root?"
		fi
	fi

	target1=`grep -n '#auth		required	pam_wheel.so use_uid' /etc/pam.d/su | cut -f1 -d:`
	target2=`grep -n 'wheel' /etc/group | cut -f1 -d:`

	sed -i ${target1}'s/.*/auth		required	pam_wheel.so use_uid/' /etc/pam.d/su
	check1=$?

	sed -i ${target2}'s/.*/wheel:x:10:root/' /etc/group
	check2=$?

	if([ $check1 -eq 0 ] && [ $check2 -eq 0 ]);then
		echo "Checking for backup file for /etc/group\t\t successfully completed."
	else
		echo "Some error occured. Are you running this script as root?"
	fi

echo ""

