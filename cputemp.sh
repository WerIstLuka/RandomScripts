#!/bin/bash

while true; do
	echo -n $(date +"%H:%M:%S")
	echo -n " "
	echo $(sensors | grep Tdie | grep -Po '(?<=\+)\w.+')
	sleep 1
done
