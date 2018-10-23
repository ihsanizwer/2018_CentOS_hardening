echo "Ensure chrony is configured"
	target=`grep -n 'OPTIONS' /etc/sysconfig/chronyd | cut -f1 -d:`

	sed -i ${target}"s/.*/OPTIONS='-u chrony'/" /etc/sysconfig/chronyd

	if [ $? -eq 0 ];then
		echo "Ensure chrony is configured\t\t successfully completed."
	else
		echo "Some error occured. Are you running this script as root?"
	fi

	unset target

echo ""