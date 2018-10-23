echo "Ensure address space layout randomization (ASLR) is enabled"
	echo "kernel.randomize_va_space = 2" >> /etc/sysctl.d/*sysctl.conf
	check1=$?
	sysctl -w kernel.randomize_va_space=2
	check2=$?

	if ([ $check1 -eq 0 ] && [ $check2 -eq 0 ]);then
		echo "Ensure address space layout randomization (ASLR) is enabled\t\t successfully completed."
	else
		echo "Some error occured. Are you running this script as root?"
	fi

	unset check1 check2
echo ""
