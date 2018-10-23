
echo "Ensure default user umask is 027 or more restrictive"
	
	if [ -f /etc/profile_orig_1835 ];then
		echo "Back up file for /etc/profile already exists"
	else
		cp /etc/profile /etc/profile_orig_1835
		if [ $? -eq 0 ];then
			echo "Backup file for /etc/profile created"
		else
			echo "Unable to create backup file. Are you running this script as root?"
		fi
	fi

	if [ -f /etc/bashrc_orig_1835 ];then
		echo "Back up file for /etc/bashrc already exists"
	else
		cp /etc/bashrc /etc/bashrc_orig_1835
		if [ $? -eq 0 ];then
			echo "Backup file for /etc/bashrc created"
		else
			echo "Unable to create backup file. Are you running this script as root?"
		fi
	fi

	targetprof=(`grep -n 'umask' /etc/profile | grep -v '# By' | cut -f1 -d:`)
	targetbash=(`grep -n 'umask' /etc/bashrc | grep -v '# By' | cut -f1 -d:`)

	for temp in ${targetprof[@]}
	do
		sed -i ${temp}'s/.*/umask 027/' /etc/profile
	done

	for temp2 in ${targetbash[@]}
	do
		sed -i ${temp2}'s/.*/umask 027/' /etc/bashrc
	done

	check1=`grep "umask" /etc/profile | grep -v '# By' | grep -v 'umask 027' | wc -l`
	check2=`grep "umask" /etc/bashrc | grep -v '# By' | grep -v 'umask 027' | wc -l`

	if ([ $check1 -eq 0 ] && [ $check2 -eq 0 ] );then
		echo "Ensure default user umask is 027 or more restrictive\t\t successfully completed."
	else
		echo "Some error occured. Are you running this script as root?"
	fi

echo ""