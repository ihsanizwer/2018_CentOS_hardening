echo "Ensure IPv6 redirects are not accepted"
	
	temp1=`grep 'net.ipv6.conf.all.accept_redirects' /etc/sysctl.conf | wc -l`
	temp2=`grep 'net.ipv6.conf.default.accept_redirects' /etc/sysctl.conf | wc -l`

	if ([ $temp1 -eq 0 ] && [ $temp2 -eq 0 ]);then
		echo "net.ipv6.conf.all.accept_redirects = 0" >> /etc/sysctl.conf
		check1=$?
		echo "net.ipv6.conf.default.accept_redirects = 0" >> /etc/sysctl.conf
		check2=$?

	elif ([ $temp1 -eq 1 ] && [ $temp2 -eq 1 ]); then
		target1=`grep -n 'net.ipv6.conf.all.accept_redirects' /etc/sysctl.conf | cut -f1 -d:`
		target2=`grep -n 'net.ipv6.conf.default.accept_redirects' /etc/sysctl.conf | cut -f -d:`
		sed -i ${target1}'s/.*/net.ipv6.conf.all.accept_redirects = 0/' /etc/sysctl.conf
		check1=$?
		sed -i ${target2}'s/.*/net.ipv6.conf.default.accept_redirects = 0/' /etc/sysctl.conf
		check2=$?
	elif [ $temp1 -eq 1 ] ;then
		target1=`grep -n 'net.ipv6.conf.all.accept_redirects' /etc/sysctl.conf | cut -f1 -d:`
		sed -i ${target1}'s/.*/net.ipv6.conf.all.accept_redirects = 0/' /etc/sysctl.conf
		check1=$?
		echo "net.ipv6.conf.default.accept_redirects = 0" >> /etc/sysctl.conf
		check2=$?
	elif [ $temp2 -eq 1 ]; then
		echo "net.ipv6.conf.all.accept_redirects = 0" >> /etc/sysctl.conf
		check1=$?
		target2=`grep -n 'net.ipv6.conf.default.accept_redirects' /etc/sysctl.conf | cut -f -d:`
		sed -i ${target2}'s/.*/net.ipv6.conf.default.accept_redirects = 0/' /etc/sysctl.conf
		check2=$?
	fi

	sysctl -w net.ipv6.conf.all.accept_redirects=0
	check3=$?
	sysctl -w net.ipv6.conf.default.accept_redirects=0
	check4=$?
	sysctl -w net.ipv6.route.flush=1
	check5=$?
	if ([ $check1 -eq 0 ] && [ $check2 -eq 0 ] && [ $check3 -eq 0 ] && [ $check4 -eq 0 ] && [ $check5 -eq 0 ]);then
		echo "Completed Successfully"
	else
		echo "Could not complete process. Try rerunning with super user privileges"
	fi
	unset check1 check2 check3 check4 check5 target1 target2
echo ""