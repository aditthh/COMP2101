#!/bin/bash

declare -i count

function usage { 
echo "Usage: $0 [-h], [-c] (show countdowns)"
}

function error-message {
echo "ERROR: $@" >&2
}


# Command line processing
while [ $# -gt 0 ]; do
 case "$1" in
  
-h )
usage
exit 0
;;
-c )
if [[ "$2" =~ ^[1-9][0-9]*$ ]]; then
        count=$2
        shift
      else
        error-message "'$2' is not valid. Please enter numbers only "
        exit 1
      fi    
  esac
  shift
done

trap ctrl_c INT
trap 'exit 0' 3

function ctrl_c() {
echo " Nope, do that and the counter will start over"
count=$secs
echo "$count"
}

read -p "Enter a number: " count
secs=$count
while [ $count -gt 0 ]; do
echo  "$count"
sleep 1
count=$(($count-1))
done


