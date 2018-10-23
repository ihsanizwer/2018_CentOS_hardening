echo "3.5.2. Ensure SCTP is disabled"

sctpdisabled=`grep "^install sctp /bin/true" /etc/modprobe.d/CIS.conf | wc -l`

if [ ${sctpdisabled} -eq 0 ];then 
	echo "install sctp /bin/true" >> /etc/modprobe.d/CIS.conf
	check=$?
	if [ $check -eq 0 ];then
		echo "SCTP disabled"
	else
		echo "Some error occured. Are you running this script as root?"
	fi
	unset check
else
	echo "Nothing left to do. SCTP disabled"
fi