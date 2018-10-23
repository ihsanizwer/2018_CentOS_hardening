echo "Ensure mounting of cramfs filesystems is disabled"
	echo "install cramfs /bin/true" >> /etc/modprobe.d/CIS.conf
	check1=$?
	rmmod cramfs
	check2=$?

	if([ $check1 -eq 0 ] && [ $check2 -eq 0 ] );then
		echo "Ensure mounting of cramfs filesystems is disabled\t\t successfully completed"
	elif ([ $check1 -eq 0 ] && [ $check2 -ne 0 ]);then
		echo "Ensure mounting of cramfs filesystems is disabled\t\t removing loaded module failed. This could be due to it not being loaded. Partially completed."
	else
		echo "Some error occured. Are you running this script as root?"
	fi

	unset check1 check2
echo ""