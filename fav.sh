#!/bin/sh

printf "Drag the URL or paste it here: "

read URL

#gets the URL to convert it into its MD5 hash
#DOMAIN=$(awk -F/ '{n=split($3, a, "/"); printf("%s %s", a[n-1], a[n])}' <<< $URL)
DOMAIN=$(basename $URL)
echo "The domain is: $DOMAIN"

md5=$(md5 -q -s "$DOMAIN")
MD5=$(echo "$md5" |  tr '[:lower:]' '[:upper:]' )      		#converts MD5 string to uppercase
echo "The MD5 hash is: "$MD5
#stores MD5 hash for later use

echo "Drag the icon or paste the icon path here: "
read ICON   #reads the icon path

ICONNAME=$(basename $ICON)  #gets the icon's name 

mv $ICON ~/Library/Safari/Touch\ Icons\ Cache/Images  # moves the icon in the folder

cd ~/Library/Safari/Touch\ Icons\ Cache/Images  #just changing directory

mv -f $iconame $MD5.png           		#forcefully renames the file, thereby replacing the old icon

echo "Safari will be automatically closed"	#Safari needs to be restarted for this to function

sleep 5


Killall Safari
