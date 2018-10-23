
echo "1.7.1.2. Ensure local login warning banner is configured properly"
	echo 'Authorized uses only. All activity may be monitored and reported.' > /etc/issue
	check=$?
	if [ $check -eq 0 ];then 
					echo -e "Ensure local login warning banner is configured properly \t\t successfully completed"
		else
		echo "Some error occured. Are you running this script as root?"
	fi
	unset check
echo ""