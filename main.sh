#!/bin/bash

# function returns value of package loss
function getPackageLoss {
	local result=$(ping -q -c 10 8.8.8.8 | sed -e '5d; 1,3d; s/%/ /' | awk '{print $6}')
	echo $result
}
packageLoss=$( getPackageLoss)
# We check if package loss is greater or equal 40 percent
if [[ $packageLoss -ge 40 ]]; then
	# If it`s, we call our router http to reboot it.
	# In my case router is ASUS
	wget --tries=1 http://admin:admin@192.168.1.1/Reboot.asp
fi
