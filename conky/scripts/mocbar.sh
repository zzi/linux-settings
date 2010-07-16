#! /bin/bash

state=`mocp -Q %state`

artist=`mocp -Q %artist`
song=`mocp -Q %song`
total=`mocp -Q %ts`
current=`mocp -Q %cs`
let percent=100*$current/$total

if [ $state != "STOP" ]
    then 
        echo "$percent"
fi
