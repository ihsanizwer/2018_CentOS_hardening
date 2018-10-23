echo "Ensure filesystem integrity is regularly checked"
	touch /root/Documents/aide_log.txt
	check1=$?
	crontab -l > mycron
	check2=$?
	echo "0 20 * * * /usr/sbin/aide --check >> /root/Documents/aide_log.txt" >> mycron	
	check3=$?
	crontab mycron
	check4=$?
	rm mycron

	if ([ $check1 -eq 0 ] && [ $check2 -eq 0 ] && [ $check3 -eq 0 ] && [ $check4 -eq 0 ]);then
		echo "Ensure filesystem integrity is regularly checked\t\t successfully completed."
	else
		echo "Some error occured. Are you running this script as root?"
	fi

	unset check1 check2 check3 check4
echo ""