echo "5.1.6 Ensure permissions on /etc/cron.monthly are configured"
	chown root:root /etc/cron.monthly
	temp1=$?
	chmod og-rwx /etc/cron.monthly
	temp2=$?

	if ([ $temp1 -eq 0 ] && [ $temp2 -eq 0 ]);then
		echo "Completed Successfully"
	else
		echo "Could not complete process. Try rerunning with super user privileges"
	fi
	unset temp1 
	unset temp2
echo ""