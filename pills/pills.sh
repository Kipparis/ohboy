#!/bin/zsh

now=$(date +%s)
#echo $now

past=$(date +%s --date "2018-09-14")
#echo $past

value1=125
value2=150
#echo $value

difference=$(($now-$past))
#echo $difference

days=$(($difference/(3600*24)))
#echo $days

#echo $(expr $days % 2)
if [ $(expr $days % 2) -eq 0 ]
then
	echo $value2
elif [ $(expr $days % 2) -eq 1 ]
then	
	echo $value1
fi

