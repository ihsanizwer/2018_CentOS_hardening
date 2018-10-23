echo "Ensure nodev option set on /home partition"
	echo "Checking if back up file exist."
	if [ -f /etc/fstab_orig_1835 ];then
		echo "Backup file already exists"
	else
		cp /etc/fstab /etc/fstab_orig_1835
		echo "Backup file created for /etc/fstab created"
	fi

	target=`grep -n "/home" /etc/fstab | cut -f1 -d:`
	sed -i ${target}'s/.*/\/dev\/mapper\/centos-home \/home                   xfs     nodev        0 0/' /etc/fstab
	check=$?

	if [ $check -eq 0 ];then
		echo "Ensure nodev option set on /home partition\t\t successfully completed."
	else
		echo "Some error occured. Are you running this script as root?"
	fi

echo ""
