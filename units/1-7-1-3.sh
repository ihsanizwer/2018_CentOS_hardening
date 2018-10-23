echo "1.7.1.3. Ensure remote login warning banner is configured properly"
	 echo 'Authorized uses only. All activity may be monitored and reported.' > /etc/issue.net
	check=$?
	if [ $check -eq 0 ];then 
					echo -e "Ensure remote login warning banner is configured properly \t\t successfully completed"
		else
		echo "Some error occured. Are you running this script as root?"
	fi
	unset check
echo ""