#!/bin/bash
function getPackageLoss {
	local result=$(ping -q -c 10 8.8.8.8 | sed -e '5d; 1,3d; s/%/ /' | awk '{print $6}')
	echo $result
}
out=$( getPackageLoss)
if [[ $out -le 10 ]]; then
	echo "Everything is good"
else
	echo "Bad!"
fi
