echo "Ensure TIPC is disabled"

tipcdisabled=`grep "^install tipc /bin/true" /etc/modprobe.d/CIS.conf | wc -l `

if [ $tipcdisabled -eq 0 ];then
	echo "install tipc /bin/true" >> /etc/modprobe.d/CIS.conf
	check=$?
	if [ $check -eq 0 ];then
			echo "TIPC disabled"
	else
		echo "Some error occured. Are you running this script as root?"
	fi
	unset check
else
	echo "Nothing left to do. TIPC disabled"
fi