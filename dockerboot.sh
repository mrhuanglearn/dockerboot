#!/bin/bash -e

FILE_DIR='/platform/platform-multi/apps/'
MOBILE_CONTROLLER=`ls $FILE_DIR | grep 'controller-1.1.0'`
MOBILE_SERVICE=`ls $FILE_DIR | grep 'service-1.1.0'`

if [ -f $FILE_DIR$MOBILE_CONTROLLER ]; then
sudo mv $FILE_DIR$MOBILE_CONTROLLER 'ieep2-mobile-platform-controller.jar'
fi


if [ -f $FILE_DIR$MOBILE_SERVICE ]; then
sudo mv $FILE_DIR$MOBILE_SERVICE 'ieep2-mobile-platform-service.jar'
fi

for i in `sudo docker service ls |grep mobile-platform |awk '{print $2}' | sort -r`;
do
output=`sudo docker service scale $i=0&&sudo docker service scale $i=1`;
echo $output;
done
echo "===========脚本执行完毕=================";
exit 1;
