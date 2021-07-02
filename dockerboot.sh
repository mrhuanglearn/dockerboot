#!/bin/bash -e

for i in `sudo docker service ls |grep mobile-platform |awk '{print $2}' | sort -r`;
do
output=`sudo docker service scale $i=0&&sudo docker service scale $i=1`;
done
echo "===========脚本执行完毕=================";
exit 1;
