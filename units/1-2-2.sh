echo "Ensure GPG keys are configured"
	target1=`grep -n "^enabled=1" /etc/yum.repos.d/sublime-text.repo | cut -f1 -d:`
	target2=`grep -n "^enabled=1" /etc/yum.repos.d/virtualbox.repo | cut -f1 -d: `
	target3=`grep -n "^enabled=1" /etc/yum.repos.d/virtualbox.repo.1 | cut -f1 -d:`
	target4=`grep -n "^enabled=1" /etc/yum.repos.d/google-chrome.repo | cut -f1 -d:`

	sed -i ${target1}'s/.*/enabled=0/' /etc/yum.repos.d/sublime-text.repo
	check1=$?
	sed -i ${target2}'s/.*/enabled=0/' /etc/yum.repos.d/virtualbox.repo
	check2=$?
	sed -i ${target3}'s/.*/enabled=0/' /etc/yum.repos.d/virtualbox.repo.1
	check3=$?
	sed -i ${target4}'s/.*/enabled=0/' /etc/yum.repos.d/google-chrome.repo
	check4=$?

	if([ $check1 -eq 0 ] && [ $check2 -eq 0 ] && [ $check3 -eq 0 ] && [ $check4 -eq 0 ]);then
		echo "Ensure GPG keys are configured\t\t successfully completed."
	else
		echo "Some error occured. Are you running this script as root?"
	fi
	unset check1 check2 check3 check4 target1 target2 target3 target4
echo ""
