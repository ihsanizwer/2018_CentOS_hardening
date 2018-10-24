echo "Ensure SSH LogLevel is set to INFO"
	target=`grep -n "LogLevel" /etc/ssh/sshd_config | cut -f1 -d:`
	sed -i ${target}'s/.*/LogLevel INFO/' /etc/ssh/sshd_config
	check=$?

	if [ $check -eq 0 ];then
			echo -e "Ensure SSH LogLevel is set to INFO \t\t successfully completed"
		else
			echo "Some error occured. Are you running this script as root?"
	fi
	unset check target

echo ""

