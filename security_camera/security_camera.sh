#!/bin/bash
# Take a single picture
# Added to rc.local
#echo "4" > /sys/class/gpio/export
#echo "in" > /sys/class/gpio/gpio4/direction

DATETIME=$(date +"%Y-%m-%d_%H%M%S-%N")
DATE=$(date +"%Y-%m-%d")

if [ ! -d /usbdrive1/camera/${DATE} ];then
  mkdir /usbdrive1/camera/${DATE}
fi

if [ $(cat /sys/class/gpio/gpio4/value) -eq 1 ];then
raspistill --nopreview -t 1 -a "${DATETIME}" -w 800 -h 600 -q 20 -o /usbdrive1/camera/${DATE}/image_$DATETIME.jpg && echo "Picture /usbdrive1/camera/${DATE}/image_$DATETIME.jpg taken"
fi

# Run in terminal 
# while :
# do
# ./security_camera.sh
# done
