echo "Ensure reverse path filtering is enabled"
	if [ -f /etc/sysctl_1835_orig.conf ];then
		echo "Back up file already exists"
	else
		cp /etc/sysctl.conf /etc/sysctl_1835_orig.conf
		echo "Backed up the sysctl.conf as sysctl_1835_orig.conf"
	fi
	temp1=`grep '^net.ipv4.conf.all.rp_filter' /etc/sysctl.conf | wc -l`
	temp2=`grep '^net.ipv4.conf.default.rp_filter' /etc/sysctl.conf | wc -l`


	if ([ $temp1 -eq 0 ] && [ $temp2 -eq 0 ]);then
		echo "net.ipv4.conf.all.rp_filter = 1" >> /etc/sysctl.conf
		check1=$?
		echo "net.ipv4.conf.default.rp_filter = 1" >> /etc/sysctl.conf
		check2=$?

	elif ([ $temp1 -eq 1 ] && [ $temp2 -eq 1 ]);then
		target1=`grep -n 'net.ipv4.conf.all.rp_filter' /etc/sysctl.conf | cut -f1 -d:`
		target2=`grep -n 'net.ipv4.conf.default.rp_filter' /etc/sysctl.conf | cut -f1 -d:`
		sed -i ${target1}'s/.*/net.ipv4.conf.all.rp_filter = 1/' /etc/sysctl.conf
		check1=$?
		sed -i ${target2}'s/.*/net.ipv4.conf.default.rp_filter = 1/' /etc/sysctl.conf
		check2=$?

	elif [ $temp1 -eq 1 ]; then
		target1=`grep -n 'net.ipv4.conf.all.rp_filter' /etc/sysctl.conf | cut -f1 -d:`
		sed -i ${target1}'s/.*/net.ipv4.conf.all.rp_filter = 1/' /etc/sysctl.conf
		check1=$?
		echo "net.ipv4.conf.default.rp_filter = 1" >> /etc/sysctl.conf
		check2=$?
	
	elif [ $temp2 -eq 1 ]; then
		echo "net.ipv4.conf.all.rp_filter = 1" >> /etc/sysctl.conf
		check1=$?
		target2=`grep -n 'net.ipv4.conf.default.rp_filter' /etc/sysctl.conf | cut -f1 -d:`
		sed -i ${target2}'s/.*/net.ipv4.conf.default.rp_filter = 1/' /etc/sysctl.conf
		check2=$?

	fi
		sysctl -w net.ipv4.conf.all.rp_filter=1
		check3=$?
		sysctl -w net.ipv4.conf.default.rp_filter=1
		check4=$?
		sysctl -w net.ipv4.route.flush=1
		check5=$?
		if ([ $check1 -eq 0 ] && [ $check2 -eq 0 ] && [ $check3 -eq 0 ] && [ $check4 -eq 0 ] && [ $check5 -eq 0 ]);then
			echo "Completed Successfully"
		else
			echo "Could not complete process. Try rerunning with super user privileges"
		fi
		unset check1 check2 check3 check4 check5 target1 target2

echo ""

