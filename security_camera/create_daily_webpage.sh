#!/bin/bash
find /usbdrive1/camera/ -name *.jpg -size -66560c -exec rm -fv {} \;
DATE=$(date +"%Y-%m-%d")

touch /usbdrive1/camera/Daily_${DATE}.html || exit

echo "<!DOCTYPE html><html><title>Daily ${DATE}</title><body><h1>Images from ${DATE}</h1><h2>Time format yyyy-mm-dd_hhmmss-nanoseconds</h2><!-- Script runs at end of day.  This webpage takes a LONG time to load -->" > /usbdrive1/camera/Daily_${DATE}.html

ls /usbdrive1/camera/${DATE}/image_${DATE}_*.jpg | awk -F/ {'print $5'} > /usbdrive1/camera/.temp

for i in $(cat /usbdrive1/camera/.temp);do
  echo "<img src=${DATE}/${i} width=800 height=600>" >>/usbdrive1/camera/Daily_${DATE}.html
  echo "<P>">>/usbdrive1/camera/Daily_${DATE}.html
done
echo "<a href=/camera/>HOME</a>" >> /usbdrive1/camera/Daily_${DATE}.html
echo "</body></html>" >> /usbdrive1/camera/Daily_${DATE}.html
