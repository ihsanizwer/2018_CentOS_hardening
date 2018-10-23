
echo "6.1.8 Ensure permissions on /etc/group- are configured"
chown root:root /etc/group-
temp1=$?
chmod u-x,go-wx /etc/group-
temp2=$?

if ([ $temp1 -eq 0 ] && [ $temp2 -eq 0 ]);then
		echo "Completed Successfully"
else
		echo "Could not complete process. Try rerunning with super user privileges"
fi

unset temp1
unset temp2
echo ""
