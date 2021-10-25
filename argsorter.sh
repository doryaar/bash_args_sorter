#! /usr/bin/bash


function sort_args()
{
# This var is for checking if input is a number in case of option -d
re='^[0-9]+$'
# This loop itarate each argument, until no more arguments to check
while [ ! -z $1 ] || [ $1 ! = "" ]
do
	OPT=
	PAR=
	# Arguments at command line input in the format of:
	#
	#	-option parameter
	#
	# This lines are extracting arguments appears after command
	# into two vars
	OPT=$1
	PAR=$2
	# Switch the first argument of the two,
	# Then if found match, checking validation of option argument
	case ${OPT} in
	"-sr")
		if [ -d "${PAR}" ]; then
  			echo -en "Running successfull \nsource mode on at: ${PAR} \n"
		else
			echo -en "Error: Source option requires valid dir path! \n"
			exit 1
		fi ;;
	"-d")
		if [[ ${PAR} =~ $re ]] ; then
			echo -en "Running successfull \nDepth mode on: Level ${PAR} \n"
		else
			echo -en "Error: Depth option requiers valid number! \n"
			exit 1
		fi ;;
	*)
		echo -en "Error: ivalid option detected! \n"
		exit 1 ;;
	esac
	# If does not exit, the loop iterate to next 2 arguments
	# by shifting twice the last checked argumnets
	shift;shift;
done
}
sort_args $@
