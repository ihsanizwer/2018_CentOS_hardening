echo "5.1.2 Ensure permissions on /etc/crontab are configured"
chown root:root /etc/crontab
	temp1=$?
chmod og-rwx /etc/crontab
	temp2=$?

	if ([ $temp1 -eq 0 ] && [ $temp2 -eq 0 ]);then
		echo "Completed Successfully"
	else
		echo "Could not complete process. Try rerunning with super user privileges"
	fi
	unset temp1 
	unset temp2
echo ""