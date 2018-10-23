echo "3.5.1. Ensure DCCP is disabled"

if [ -f /etc/modprobe.d/CIS.conf ];then
	echo "Backup file already exists."
fi

dccpdisabled=`grep "^install dccp /bin/true" /etc/modprobe.d/CIS.conf | wc -l`

if [ ${dccpdisabled} -eq 0 ];then
	echo "install dccp /bin/true" >> /etc/modprobe.d/CIS.conf
	check=$?
	if [ $check -eq 0 ];then
		echo "DCCP disabled"
		else
			echo "Some error occured. Are you running this script as root?"
	fi
	unset check
else
	echo "Nothing left to do. DCCP already disabled"
	fi