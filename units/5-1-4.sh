echo "5.1.4 Ensure permissions on /etc/cron.daily are configured"
	chown root:root /etc/cron.daily
	temp1=$?
	chmod og-rwx /etc/cron.daily
	temp2=$?


	if ([ $temp1 -eq 0 ] && [ $temp2 -eq 0 ]);then
		echo "Completed Successfully"
	else
		echo "Could not complete process. Try rerunning with super user privileges"
	fi
	unset temp1 
	unset temp2
echo ""