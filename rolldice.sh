#!/bin/bash
# Roll The Dice Script

# variables
declare -i count
declare -i sides

# function 
function showusage {
  echo "Usage: $0 [-h], [-c(NumberofCount)], [-s(NUmberofSides)]"
}
function error-message {
  echo "ERROR: $0" >&2
}


### Command line processing
while [ $# -gt 0 ]; do
  case "$1" in
  
    -h )
     showusage
      exit 0
      ;;
    -c )
      if [[ "$2" =~ ^[1-9][0-9]*$ ]]; then
        count=$2
        shift
      else
        error-message "'$2' is an  invalid value"
        exit 1
      fi
      ;;
    -s )
	if [[ "$2" =~ ^[1-9][0-9]*$ ]]; then
        if [ $2 -lt 4 -o $2 -gt 20 ]; then
          error-message "Hint: Pick between 4 and 20"
          exit 1
        else
          sides=$2
          shift
        fi
      else
        error-message "'$2' is invalid"
        exit 1
      fi
      ;;
    * )
      error-message "I don't understand '$1'"
      usage
      exit 1
      ;;
  esac
  shift
done


until [[ $count -gt 0 ]]; do
read -p "How many dice would you like to roll? " count
if [ $count -lt 1 ]; then
echo "Number has to be either 1 or greater"
fi
done

until [ $sides -gt 3 -o $sides -lt 21 ]; do
read -p "How many sides should each die have? " sides
if [ $sides -lt 4 -o $sides -gt 20 ]; then 
echo "Number has to be between 4 and 20"
fi
done
 
## Main ##

tally=0
for (( rolls=0 ; rolls < count ; rolls++ )); do
# roll the dice
die1=$(($RANDOM %$sides +1))
tally=$((tally + die1))
# results
echo "Rolled $die1"
done
echo "Total roll was $tally"
echo 










