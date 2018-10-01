#!/bin/zsh

echo "hello world"


value=`cat current.txt`

while read line; do
	echo $line
done < current.txt
