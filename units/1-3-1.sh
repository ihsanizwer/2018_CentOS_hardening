echo "Ensure AIDE is installed"
	yum -y install aide
	check1=$?
	aide --init
	check2=$?
	mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz
	check3=$?

	if ([ $check1 -eq 0 ] && [ $check2 -eq 0 ] && [ $check3 -eq 0 ]);then
		echo "Ensure AIDE is installed\t\t successfully completed."
	else
		echo "Some error occured. Are you running this script as root?"
	fi
	unset check1 check2 check3
echo ""