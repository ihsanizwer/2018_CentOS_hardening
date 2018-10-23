echo "3.3.1. Ensure IP forwarding is disabled - sysctl"
	temp1=`grep "^net.ipv4.ip_forward" /etc/sysctl.conf | wc -l`

	if [ -f /etc/sysctl_1835_orig.conf ];then
		echo "Back up file already exists"
	else
		cp /etc/sysctl.conf /etc/sysctl_1835_orig.conf
		echo "Backed up the sysctl.conf as sysctl_1835_orig.conf"
	fi

	if [ $temp1 -eq 0 ];then
		echo "net.ipv4.ip_forward = 0" >> /etc/sysctl.conf
		check1=$?
		sysctl -w net.ipv4.ip_forward=0
		check2=$?
		sysctl -w net.ipv4.route.flush=1
		check3=$?

		if ([ $check1 -eq 0 ] && [ $check2 -eq 0 ] && [ $check3 -eq 0 ]);then

			echo "Completed Successfully"
		else
			echo "Could not complete process. Try rerunning with super user privileges"
		fi
	else
		target=`grep -n 'net.ipv4.ip_forward' /etc/sysctl.conf | cut -f1 -d:`
		check1=$?
		sed -i ${target}'s/.*/net.ipv4.ip_forward = 0/' /etc/sysctl.conf
		check2=$?
		sysctl -w net.ipv4.ip_forward=0
		check3=$?
		sysctl -w net.ipv4.route.flush=1
		check4=$?

		if ([ $check1 -eq 0 ] && [ $check2 -eq 0 ] && [ $check3 -eq 0 ] && [ $check4 -eq 0 ] );then
			echo "Completed Successfully"
		else
			echo "Could not complete process. Try rerunning with super user privileges"
		fi

	fi
		unset temp1 check2 check3 check4
echo ""
