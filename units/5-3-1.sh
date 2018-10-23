echo "5.3.1. Ensure password creation requirements are configured"

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

	target1=`grep -n "pam_pwquality" /etc/pam.d/password-auth | cut -f1 -d:`
	sed -i ${target1}"s/.*/password    requisite     pam_pwquality.so try_first_pass retry=3 minlen=8 lcredit=-1 ucredit=-1 dcredit=-1 ocredit=-1 difok=4/" /etc/pam.d/password-auth
	check1=$?

	target2=`grep -n "pam_pwquality" /etc/pam.d/system-auth | cut -f1 -d:`
	sed -i ${target2}"s/.*/password    requisite     pam_pwquality.so try_first_pass retry=3 minlen=8 lcredit=-1 ucredit=-1 dcredit=-1 ocredit=-1 difok=4/" /etc/pam.d/system-auth
	check2=$?


	if ([ $check1 -eq 0 ] && [ $check2 -eq 0 ] );then
		echo "Ensure password creation requirements are configured\t\t successfully completed"
	else
		echo "Some error occured. Are you running this script as root?"
	fi

	unset target1 target2 check1 check2
echo ""