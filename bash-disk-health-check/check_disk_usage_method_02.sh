#/bin/bash
time=$(date +%d-%m-%y-%H)

disk_status=$(df -h  | grep /dev/nvme0n1p6 | awk '{print $5}' | tr -d %)

if [ "$disk_status" -le 30 ]
then
	echo "$disk_status is Good"
else
	cd /root/log
	tar cvf - auth.log | gzip -c > /root/log/auth.log-$time.tgz
	echo "" > auth.log
	echo "Var log alert has been archivd"
fi
