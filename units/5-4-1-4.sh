echo "5.4.1.4. Ensure inactive password lock is 30 days or less"
	useradd -D -f 30
	if [ $? -eq 0 ];then
		echo "Ensure inactive password lock is 30 days or less\t\t successfully completed"
		else
			echo "Some error occured. Are you running this script as root?"
	fi
echo ""

