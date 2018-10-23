echo "Ensure IPv6 is disabled"
	#This was not done as per the solutions available on Nessus. SecScan solution was used rather.
	if [ -f /etc/modprobe.d/CIS.conf ];then
		touch /etc/modprobe.d/CIS.conf
	fi 
	echo "options ipv6 disable=1" >> /etc/modprobe.d/CIS.conf

	if [ $? -eq 0 ];then
		echo "Completed Successfully"
	else
		echo "Could not complete process. Try rerunning with super user privileges"
	fi

echo ""