echo "Ensure CUPS is not enabled"
	systemctl disable cups
	if [ $? -eq 0 ];then
		echo "Ensure CUPS is not enabled\t\t successfully completed."
	else
		echo "Some error occured. Are you running this script as root?"
	fi
echo ""
