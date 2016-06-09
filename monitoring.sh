#/bin/bash!

HOSTS=`cat hosts`

RESULT=()

for HOST in $HOSTS
do
	CMD=`curl -is --head $HOST | grep "HTTP" | cut -d ' ' -f 2`
	if [ $CMD -ge 400 ]
	then
		RESULT=("${RESULT[@]}" "[$HOST][$CMD]")
	fi
done

if [ ${#RESULT[@]} -gt 0 ]
then
	echo ${RESULT[@]}
	exit 1;
fi
exit 0;
