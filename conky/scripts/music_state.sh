#! /bin/bash

state=`mocp -Q %state`
state_num=0

if [ $state == "PLAY" ]
    then state_num=3
fi
if [ $state == "PAUSE" ]
    then state_num=7
fi    

if [ $state == "STOP" ]
    then state_num=8
fi

echo "$state_num"
