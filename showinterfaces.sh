#!/bin/bash

# Shows the output of ifconfig
# Parse the output of route -n 
# to display the ip add of default gateway


### Variables ###

showroute=0


### Functions ###

function usage {
	echo "Usage: $0 [-h|--help]"
	}

	function error-message {
	echo "$@" >&2
	}

### Command Line Processing ###

while [ $# -gt 0 ]; do
	case "$1" in
	-h | --help )
	usage
	exit 0
	;;
	-r | --route )
	showroute=1
	;;
	*) 
	usage; error-message
	exit 0
	;;
esac
shift
done


### Main ###

if [ $showroute = 1 ]; then 
	default_gateway=`route -n|grep '^0.0.0.0 '|awk '{print $2}'`
echo "The default gateway is $default_gateway "
	else

		while true; do

		echo "Which interface are you looking to monitor?"

cd /sys/class/net && select interface in *; do

	if [ "$interface" = "" ]; then
		echo "Sorry, you didn't choose a valid interface, please try again"
		else

		if [ ! -d "/sys/class/net/$interface" ]; then
		echo "Invalid Input, please check yourself before your wreck yourself"

else

	echo " Interface $interface currently has an ip address of `ifconfig $interface 2>/dev/null|awk '/inet addr:/ {print $2}' |sed 's/addr://'`" 
	break
	fi
fi
done
break
done
fi
