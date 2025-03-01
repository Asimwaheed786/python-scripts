#Disk status


#!/bin/bash
disk_status=$(df -h  | grep /dev/nvme0n1p6 | awk '{print $5}' | tr '%' ' ')

if [ $disk_status -le 90 ]
then
	echo "Size is Good"
else
	echo $disk_status
	echo " Disk Space is full"
fi
