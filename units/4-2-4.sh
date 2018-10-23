echo "4.2.4 Ensure permissions on all logfiles are configured"
find /var/log -type f -exec chmod g-wx,o-rwx {} +
if [ $? -eq 0 ];then
	echo "Completed successfully"
else
	echo "Could not complete process. Try rerunning with super user privileges"
fi
echo ""
