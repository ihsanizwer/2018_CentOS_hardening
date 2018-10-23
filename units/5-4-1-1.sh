echo "5.4.1.1. Ensure password expiration is 90 days or less"
	echo "Checking if backup file exists - password-auth"
	if [ -f /etc/pam.d/password-auth_orig_1835 ];then
		echo "Backup file already exists"
	else
		echo "Creating backup file"
		cp /etc/pam.d/password-auth /etc/pam.d/password-auth_orig_1835
		echo "Bakup file created for password-auth"
	fi

	echo "Checking if backup file exists - system-auth"
	if [ -f /etc/pam.d/system-auth_orig_1835 ];then
		echo "Backup file already exists"
	else
		echo "Creating backup file"
		cp /etc/pam.d/system-auth /etc/pam.d/system-auth_orig_1835
		echo "Backup file created for system-auth"
	fi

	echo "As per corporate password policy Did not enforce on all user accounts"
	echo "Checking if back up file exists"
	if [ -f /etc/login_orig_1835.defs ];then
		echo "Backup file already exists." 
		else
			cp /etc/login.defs /etc/login_orig_1835.defs 
			if [ $? -eq 0 ];then
				echo "Backup file created fpr login.defs"
			else
				echo "Could not create backup file. Do you have enough privileges?"
			fi
	fi

	target=`grep -n ^"PASS_MAX_DAYS" /etc/login.defs | cut -f1 -d:`
	sed -i ${target}"s/.*/PASS_MAX_DAYS 90/" /etc/login.defs
	check=$?

	if [ $check -eq 0 ];then
		echo "Ensure password expiration is 90 days or less\t\t successfully completed"
	else
		echo "Some error occured. Are you running this script as root?"
	fi
	unset check target
echo ""