echo "5.1.7 Ensure permissions on /etc/cron.d are configured"
	chown root:root /etc/cron.d
	temp1=$?
	chmod og-rwx /etc/cron.d
	temp2=$?

	if ([ $temp1 -eq 0 ] && [ $temp2 -eq 0 ]);then
		echo "Completed Successfully"
	else
		echo "Could not complete process. Try rerunning with super user privileges"
	fi
	unset temp1 
	unset temp2	
echo ""