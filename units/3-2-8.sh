echo "TCP SYN Cookies is enabled"
	if [ -f /etc/sysctl_1835_orig.conf ];then
		echo "Back up file already exists"
	else
		cp /etc/sysctl.conf /etc/sysctl_1835_orig.conf
		echo "Backed up the sysctl.conf as sysctl_1835_orig.conf"
	fi
	temp1=`grep '^net.ipv4.tcp_syncookies' /etc/sysctl.conf | wc -l`
	if [ $temp1 -eq 0 ];then
		echo "net.ipv4.tcp_syncookies = 1" >> /etc/sysctl.conf
		check1=$?

	else
		target1=`grep -n '^unset check1 check2 check3 target1' /etc/sysctl.conf | cut -f1 -d:`
		sed -i ${target1}'s/.*/net.ipv4.tcp_syncookies = 1/' /etc/sysctl.conf
		check1=$?

	fi
		sysctl -w net.ipv4.tcp_syncookies=1
		check2=$?
		sysctl -w net.ipv4.route.flush=1
		check3=$?
		if ([ $check1 -eq 0 ] && [ $check2 -eq 0 ] && [ $check3 -eq 0 ]);then
		echo "Completed Successfully"
			else
		echo "Could not complete process. Try rerunning with super user privileges"
		fi
		unset check1 check2 check3 target1
echo ""