rdsdisabled=`grep "^install rds /bin/true" /etc/modprobe.d/CIS.conf | wc -l`

echo "3.5.3.  Ensure RDS is disabled"
if [ ${rdsdisabled} -eq 0 ];then
	echo "install rds /bin/true" >> /etc/modprobe.d/CIS.conf 
	check=$?
	if [ $check -eq 0 ];then
		echo "RDS disabled"
	else
		echo "Some error occured. Are you running this script as root?"
	fi
	unset check
else
	echo "Nothing left to do. RDS disabled"
fi
