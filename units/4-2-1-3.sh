echo "4.2.1.3 Ensure rsyslog default file permissions configured"
temp=`sed -n '44, 44p' /etc/rsyslog.conf`
if [ "$temp" = "" ];then
	sed -i '44s/.*/FileCreateMode 0640/' /etc/rsyslog.conf
	if [ $? -eq 0 ];then
		echo "Completed successfully"
		else
		echo "Could not complete process. Try rerunning with super user privileges"
	fi
	unset temp
else
	echo "Line 44 of the config is not empty. Try with 45."
fi

echo ""