
echo "5.3.3. Ensure password reuse is limited"
	echo "Checking if backup file exists - password-auth"
	if [ -f /etc/pam.d/password-auth_orig_1835 ];then
		echo "Backup file already exists"
	else
		echo "Creating backup file"
		cp /etc/pam.d/password-auth /etc/pam.d/password-auth_orig_1835
		echo "Bakup file created for password-auth"
	fi
	target1=`grep -n "password    sufficient    pam_unix.so " /etc/pam.d/password-auth | cut -f1 -d:`
	target2=`grep -n "password    sufficient    pam_unix.so " /etc/pam.d/system-auth | cut -f1 -d:`

	sed -i ${target1}s"/.*/password    sufficient    pam_unix.so sha512 shadow nullok try_first_pass use_authtok remember=5/" /etc/pam.d/password-auth
	check1=$?
	sed -i ${target2}s"/.*/password    sufficient    pam_unix.so sha512 shadow nullok try_first_pass use_authtok remember=5/" /etc/pam.d/system-auth
	check2=$?

	if ([ $check1 -eq 0 ] && [ $check2 -eq 0 ]);then
		echo "Ensure password reuse is limited\t\t successfully completed"
		else
		echo "Some error occured. Are you running this script as root?"
	fi

unset check1 check2 target1 target2
echo ""