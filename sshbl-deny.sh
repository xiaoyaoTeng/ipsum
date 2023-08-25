#!/bin/sh
# Fetch NEU SSH Black list to /etc/hosts.deny
#
 
export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
 
URL=https://raw.githubusercontent.com/stamparm/ipsum/master/ipsum.txt
HOSTSDENY=/etc/hosts.deny
TMP_DIR=/tmp/
FILE=hosts.deny
 
cd $TMP_DIR

curl --compressed $URL 2>/dev/null | grep -v -E "\s[1-2]$" | cut -f 1  > $FILE
sed -i 's/^/ALL:&/g' $FILE
LINES=`grep "^ALL:" $FILE | wc -l`
 
if [ $LINES -gt 10 ]
then
sed -i '/^####SSH BlackList START####/,/^####SSH BlackList END####/d' $HOSTSDENY
echo "####SSH BlackList START####" >> $HOSTSDENY
cat $FILE >> $HOSTSDENY
echo "####SSH BlackList END####" >> $HOSTSDENY
fi
