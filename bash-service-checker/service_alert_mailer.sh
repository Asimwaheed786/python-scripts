#!/bin/bash

echo "enter your service"
read service_name

STATUS=$(systemctl is-active $service_name)

if [[ $STATUS == "active" ]]
then
	echo "$service_name service is running"
else
	echo "Sorry..!! $service_name service is not running"
	echo "Sorry..!! $service_name service is not running" | mail -s "Service Down $service_name | ALERT"  waheedasim20@gmail.com
	exit 1
fi
