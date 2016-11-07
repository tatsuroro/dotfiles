#! /bin/bash

count=`ps -ef | grep bin/fluentd | grep -v grep | wc -l`
if [ $count = 0 ]; then
  echo "init fluentd"
  fluentd -c ~/etc/fluentd.conf/fluent.conf -d 9999
else
  echo "fluentd already running"
fi
