#!/bin/bash
#!/usr/bin/ffmpeg

	echo "-------------------------===== Start of bash ====-------------------------"
	printf '\033[8;27;90t'	## minimum of 90 for graphics.
	version=2026-07-01_Wednesday_12:18:15

	## "0 or 1 , 0 deactivated , 1 activated ## All general variables must be 0 or 1"
		findsubfolders=0
		lowercase=0
		detox=0
		automatic=0
		debug=0
		debugcore=0
		minimize=0
		maximize=0
		reseize=1
		noquit=1

	SCRIPT_NAME=$(basename "$0")
	echo -ne "\033]0;$SCRIPT_NAME\a"
	printf '\033[8;20;90t'		## minimum of 90 for graphics.
	echo

## -------------------------=========== SEPARATOR =============-------------------------
	## Time, host name, file name, pid.
		start=$SECONDS
		now=$(date +"%Y-%m-%d_%H:%M:%S")	## time now
		hostname=$(cat /etc/hostname)
		#hostname="${hostname%-pc}"
		me="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
		id=$(echo $PPID)			## current process id of the bash process
	## General purposes variables. Needed before program to random variables.
		logs=1		## Logging
	## All general variables must be 0, DO NOT CHANGE.
		part=0		## Don't change this value.
		primeerror=0	## Ending error detector, do not change.
		error=0		## Test error, do not change.
	## Auto-generated variables. DO NOT CHANGE.
		random=$(shuf -i 131072-524288 -n 1)	# Used for temp folders. A big number hard to guess for security reasons. 128-512
		random2=$RANDOM
	## Colors codes
		red=$(tput setaf 1)
		green=$(tput setaf 2)
		yellow=$(tput setaf 11)
		blue=$(tput setaf 12)
		orange=$(tput setaf 9)
		reset=$(tput sgr0)
	## Name of the pc you are running this bash.
		comuputerrunning=$(hostname)
		comuputerrunning=${comuputerrunning//-pc/}

## -------------------------=========== SEPARATOR =============-------------------------

	echo
	echo "${green}  ░▒▓█▓▒░      ░▒▓██████▓▒░ ░▒▓███████▓▒░▒▓████████▓▒░ "
	echo "${green}  ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░         ░▒▓█▓▒░     "
	echo "${green}  ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░         ░▒▓█▓▒░     "
	echo "${green}  ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░░▒▓██████▓▒░   ░▒▓█▓▒░     "
	echo "${green}  ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░  ░▒▓█▓▒░     "
	echo "${green}  ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░  ░▒▓█▓▒░     "
	echo "${green}  ░▒▓████████▓▒░▒▓██████▓▒░░▒▓███████▓▒░   ░▒▓█▓▒░     ${reset}"
	echo
	echo "${green}	  ░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓████████▓▒░ "
	echo "${green}	  ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓█▓▒░        "
	echo "${green}	  ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓█▓▒░        "
	echo "${green}	  ░▒▓███████▓▒░ ░▒▓██████▓▒░   ░▒▓█▓▒░   ░▒▓██████▓▒░   "
	echo "${green}	  ░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░      ░▒▓█▓▒░   ░▒▓█▓▒░        "
	echo "${green}	  ░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░      ░▒▓█▓▒░   ░▒▓█▓▒░        "
	echo "${green}	  ░▒▓███████▓▒░   ░▒▓█▓▒░      ░▒▓█▓▒░   ░▒▓████████▓▒░ ${reset}"
	echo
	echo "${green}		   ░▒▓███████▓▒░░▒▓██████▓▒░░▒▓████████▓▒░▒▓████████▓▒░ "
	echo "${green}		  ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░         ░▒▓█▓▒░     "
	echo "${green}		  ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░         ░▒▓█▓▒░     "
	echo "${green}		   ░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓██████▓▒░    ░▒▓█▓▒░     "
	echo "${green}			 ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░         ░▒▓█▓▒░     "
	echo "${green}			 ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░         ░▒▓█▓▒░     "
	echo "${green}		  ░▒▓███████▓▒░ ░▒▓██████▓▒░░▒▓█▓▒░         ░▒▓█▓▒░  ${reset}"
	echo

echo -------------------------=========== SEPARATOR =============-------------------------
	echo "Lead-in Version 6.09. LostByteSoft ; https://github.com/LostByteSoft"
	echo
	echo "${blue}█████${reset} Activated $me"
	echo
	echo "Version : $version"
	echo
	echo "NEVER remove dual ## in front of lines. Theses are code annotations."
	echo "You can test / remove single # for testing purpose."
	echo
	echo "Current time : $now"
	echo
	echo "You are running this script from : $comuputerrunning"
	echo
	echo "Running software file : $(dirname "$0")/"
	echo
	echo "Read me for this file : (EULA at the end of file, open in text.)"
	echo "By LostByteSoft, no copyright or copyleft. https://github.com/LostByteSoft"
	echo "Don't hack paid software, free software exists and does the job better."
	echo
	echo "Debug data : id=$id part=$part primeerror=$primeerror error=$error random=$random random2=$random2 logs=$logs"
	echo "	findsubfolders=$findsubfolders lowercase=$lowercase detox=$detox automatic=$automatic debug=$debug"
	echo "	debugcore=$debugcore minimize=$minimize maximize=$maximize reseize=$reseize noquit=$noquit"
	echo
	echo "My slogan is: IF you're smarter than me; THEN do it yourself FI"
	echo

echo -------------------------=========== SEPARATOR =============-------------------------
	echo "Color codes / Informations."
	echo
	echo   "${blue}	████████████████      INFORMATION(S)      ████████████████ ${reset}"
	echo  "${green}	████████████████     ALL OK / ACTIVE      ████████████████ ${reset}"
	echo "${yellow}	████████████████   ATTENTION / INACTIVE   ████████████████ ${reset}"
	echo "${orange}	████████████████                          ████████████████ ${reset}"
	echo    "${red}	████████████████   FATAL ERROR / OFFLINE  ████████████████ ${reset}"
	echo

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
	echo Check installed requirements !
	echo
if command -v xdotool >/dev/null 2>&1
	then
		echo "xdotool installed continue."
		dpkg -s xdotool | grep Version
		echo "${green}████████████████ OK ████████████████ ${reset}"
		echo
		xdotoolinstall=1
	else
		echo "You don't have ' xdotool ' installed."
		echo "Add with : sudo apt-get install xdotool"
		echo
		echo "${blue}████████████████ Dependency information ████████████████${reset}"
		echo
		xdotoolinstall=0
	fi

## -------------------------===== Separator =====-------------------------
if command -v xbrzscale >/dev/null 2>&1
	then
		echo "xbrzscale installed continue."
		dpkg -s xbrzscale | grep Version
		echo "${green} ████████████████ OK ████████████████ ${reset}"
		echo
		xbrzscaleinstall=1
	else
		echo "You don't have ' xbrzscale ' installed."
		echo "Add with : sudo apt-get install xbrzscale"
		echo
		echo "${red}████████████████ Dependency error ████████████████${reset}"
		echo
		read -n 1 -s -r -p "Press ENTER key to continue anyway (NOT a good idea) !"
		echo
		echo
		xbrzscaleinstall=0
	fi

## -------------------------===== Separator =====-------------------------
if command -v imagemagick >/dev/null 2>&1
	then
		echo "You don't have ' imagemagick ' installed."
		echo "Add with : sudo apt-get install imagemagick"
		echo
		echo "${red}████████████████ Dependency error ████████████████${reset}"
		echo
		read -n 1 -s -r -p "Press ENTER key to continue anyway (NOT a good idea) !"
		echo
		echo
		imagemagickinstall=1
	else
		echo "imagemagick installed continue."
		dpkg -s imagemagick | grep Version
		echo "${green} ████████████████ OK ████████████████ ${reset}"
		echo
		imagemagickinstall=0
	fi

## -------------------------===== Separator =====-------------------------
part=$((part+1))
echo -------------------------===== Section $part =====-------------------------
echo "Functions informations. Version 1.25"
	echo

##-------------------------=========== SEPARATOR =============-------------------------

	name=AUTOMATIC
	explain="The lowest possible questions/pause."
	if [ "$automatic" -eq "0" ]; then
		echo 	"Function ${green}█████${reset} Default deactivated $name . $explain"
	else
		echo 	"Function ${blue}█████${reset} Activated $name . $explain"
	fi
	echo

##-------------------------=========== SEPARATOR =============-------------------------

	name=DEBUG
	explain="Slow down execution with informations."
	if [ "$debug" -eq "0" ]; then
		echo 	"Function ${green}█████${reset} Default deactivated $name . $explain"
	else
		echo 	"Function ${blue}█████${reset} Activated $name . $explain"
	fi
	echo

	debug() {
		if [ "$debug" -eq "1" ]; then
			echo
			echo "${blue}	█████ DEBUG █████${reset}"
			echo
			echo "Debug data : id=$id part=$part primeerror=$primeerror error=$error random=$random random2=$random2 logs=$logs"
			echo "	findsubfolders=$findsubfolders lowercase=$lowercase detox=$detox automatic=$automatic debug=$debug"
			echo "	debugcore=$debugcore minimize=$minimize maximize=$maximize reseize=$reseize noquit=$noquit"
			echo
			reseize=0
			minimize=0
			maximize=0
			noquit=1
			printf '\033[8;45;150t'		## Will resize the window.
			fi
			}

##-------------------------=========== SEPARATOR =============-------------------------
## error function

	error() {
		if [ "$?" -ge 1 ]; then
			reseize=0
			noquit=1
			automatic=0
			primeerror=$((primeerror+1))
			echo
			echo "${red}████████████████████ ERROR was detected !!! ████████████████████${reset}"
			debug
			sleep 1
		else
			echo
			echo "${green} █████████ No error found. █████████ ${reset}"
			echo
			fi
		}

##-------------------------=========== SEPARATOR =============-------------------------

	name=NOQUIT
	explain="Do not quit at the end of the program."
	if [ "$noquit" -eq "0" ]; then
		echo 	"Function ${blue}█████${reset} Default deactivated $name . $explain"
	else
		echo 	"Function ${green}█████${reset} Activated $name . $explain"
	fi
	echo

##-------------------------=========== SEPARATOR =============-------------------------

	name=MINIMIZE
	explain="Minimize the program."
	if [ "$minimize" -eq "0" ]; then
		echo 	"Function ${blue}█████${reset} Default deactivated $name . $explain"
	else
		echo 	"Function ${green}█████${reset} Activated $name . $explain"
	fi

if [ "$minimize" -eq "1" ]; then
	pid=$(echo $PPID)
	if [ "$xdotoolinstall" -eq "1" ]; then
			echo
			echo "Function ${blue}█████ Minimize activated. ${yellow}pid = $pid${reset}${reset}"
			sleep 0.2
			window_id=$(xdotool search --pid $pid | tail -1)
			sleep 0.2
			#echo pid = $pid | window_id = $window_id
			xdotool windowminimize "$window_id"
			sleep 0.2
		else
			echo "${yellow} █████ xdotool not installed : pid = $pid${reset}"
		fi
	fi
	echo

##-------------------------=========== SEPARATOR =============-------------------------

	name=MAXIMIZE
	explain="Maximize the program."
	if [ "$maximize" -eq "0" ]; then
		echo 	"Function ${blue}█████${reset} Default deactivated $name . $explain"
	else
		echo 	"Function ${green}█████${reset} Activated $name . $explain"
	fi

if [ "$maximize" -eq "1" ]; then
	pid=$(echo $PPID)
	if [ "$xdotoolinstall" -eq "1" ]; then
			echo "Function ${blue}█████ Maximize activated. ${yellow}pid = $pid${reset}"
			sleep 0.2
			window_id=$(xdotool search --pid $pid | tail -1)
			sleep 0.2
			#echo pid = $pid | window_id = $window_id
			xdotool windowmaximize "$window_id"
			sleep 0.2
		else
			echo "${yellow}█████ xdotool not installed : pid = $pid${reset}"
		fi
	fi

##-------------------------=========== SEPARATOR =============-------------------------
## Simple function small bar to wait 3 sec. This bar does work with debian 12 & 13. Version 1.05

	functionsmallbar() {
		speed=0.3
		echo -ne ${yellow}'	TimeToQuit |                        |    (0%)\r'${reset}
		sleep "$speed"
		echo -ne ${yellow}'	TimeToQuit |  ██                    |   (10%)\r'${reset}
		sleep "$speed"
		echo -ne ${yellow}'	TimeToQuit |  ████                  |   (20%)\r'${reset}
		sleep "$speed"
		echo -ne ${yellow}'	TimeToQuit |  ██████                |   (30%)\r'${reset}
		sleep "$speed"
		echo -ne ${yellow}'	TimeToQuit |  ████████              |   (40%)\r'${reset}
		sleep "$speed"
		echo -ne ${yellow}'	TimeToQuit |  ██████████            |   (50%)\r'${reset}
		sleep "$speed"
		echo -ne ${yellow}'	TimeToQuit |  ████████████          |   (60%)\r'${reset}
		sleep "$speed"
		echo -ne ${yellow}'	TimeToQuit |  ██████████████        |   (70%)\r'${reset}
		sleep "$speed"
		echo -ne ${yellow}'	TimeToQuit |  ████████████████      |   (80%)\r'${reset}
		sleep "$speed"
		echo -ne ${yellow}'	TimeToQuit |  ██████████████████    |   (90%)\r'${reset}
		sleep "$speed"
		echo -ne ${yellow}'	TimeToQuit |  ████████████████████  |  (100%)\r'${reset}
		sleep "$speed"
		echo -ne '\n'
		}

## -------------------------===== Separator =====-------------------------
## Simple function sleep bar to wait. Wait the time you specified in code.
	## Version 2.26
	## https://github.com/LostByteSoft
	## LostBytesSoft, lost byte softwares, because everything is ephemeral.
	## Replace the nothing show sleep with a better looking bar.
	## SPECIFY A SLEEP TIME IN SECONDS BEFORE FUNCTION IN CODE. Default sleep is 3 second if not specified.

	## In code exemple:
	## sleep=3		## Use minimum 1 as a vriable.
	## functionsleepbar

	## Local var.
	sleep=3
	sleep1=0
	sleep2=0
	
	##-------------------------=========== SEPARATOR =============-------------------------

functionsleepbar() {

	if [ "$sleep" -ge "1" ]; then
			sleep1=$(echo "scale=2 ; "$sleep"/20" | bc)
			sleep2=$(echo "scale=2 ; "$sleep"/10" | bc)
		else
			sleep=3
			sleep1=$(echo "scale=2 ; "$sleep"/20" | bc)
			sleep2=$(echo "scale=2 ; "$sleep"/10" | bc)
		fi

	#if [[ -n "$color" ]]; then
	#		echo "color is $color"
	#	else
	#		color=green
	#		echo "color is set to $color"
	#	fi

	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|	|	|	|	|	|        (0%)\r"${reset}
	sleep "$sleep2"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|██	|	|	|	|	|        (5%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|█████	|	|	|	|	|	(10%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|	|	|	|	|	(15%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|█	|	|	|	|	(20%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|███	|	|	|	|	(25%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|█████	|	|	|	|	(30%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|███████|	|	|	|	(35%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|███████|█	|	|	|	(40%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|███████|███	|	|	|	(45%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|███████|█████	|	|	|	(50%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|███████|███████|	|	|	(55%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|███████|███████|█	|	|	(60%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|███████|███████|███	|	|	(65%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|███████|███████|█████	|	|	(70%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|███████|███████|███████|	|	(75%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|███████|███████|███████|█	|	(80%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|███████|███████|███████|███	|	(90%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|███████|███████|███████|█████	|	(95%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|███████|███████|███████|███████|      (100%)\r"${reset}
	sleep "$sleep1"
	echo -ne '\n'
	}

##-------------------------=========== SEPARATOR =============-------------------------
## Simple function bar to TimeOut 12 sec.
	## Version 2.03
	## https://github.com/LostByteSoft
	## LostBytesSoft, lost byte softwares, because everything is ephemeral.

	functionfastbar() {
		echo -ne ${blue}'	TimeOut |                        |    (0%)\r'${reset}
		sleep 1
		echo -ne ${blue}'	TimeOut |  █                     |   (5%)\r'${reset}
		sleep 0.6
		echo -ne ${blue}'	TimeOut |  ██                    |   (10%)\r'${reset}
		sleep 0.6
		echo -ne ${blue}'	TimeOut |  ███                   |   (15%)\r'${reset}
		sleep 0.6
		echo -ne ${blue}'	TimeOut |  ████                  |   (20%)\r'${reset}
		sleep 0.6
		echo -ne ${blue}'	TimeOut |  █████                 |   (25%)\r'${reset}
		sleep 0.6
		echo -ne ${blue}'	TimeOut |  ██████                |   (30%)\r'${reset}
		sleep 0.6
		echo -ne ${blue}'	TimeOut |  ███████               |   (35%)\r'${reset}
		sleep 0.6
		echo -ne ${blue}'	TimeOut |  ████████              |   (40%)\r'${reset}
		sleep 0.6
		echo -ne ${blue}'	TimeOut |  █████████             |   (45%)\r'${reset}
		sleep 0.6
		echo -ne ${blue}'	TimeOut |  ██████████            |   (50%)\r'${reset}
		sleep 0.6
		echo -ne ${blue}'	TimeOut |  ███████████           |   (55%)\r'${reset}
		sleep 0.6
		echo -ne ${blue}'	TimeOut |  ████████████          |   (60%)\r'${reset}
		sleep 0.6
		echo -ne ${blue}'	TimeOut |  █████████████         |   (65%)\r'${reset}
		sleep 0.6
		echo -ne ${blue}'	TimeOut |  ██████████████        |   (70%)\r'${reset}
		sleep 0.6
		echo -ne ${blue}'	TimeOut |  ███████████████       |   (75%)\r'${reset}
		sleep 0.6
		echo -ne ${blue}'	TimeOut |  ████████████████      |   (80%)\r'${reset}
		sleep 0.6
		echo -ne ${blue}'	TimeOut |  █████████████████     |   (85%)\r'${reset}
		sleep 0.6
		echo -ne ${blue}'	TimeOut |  ██████████████████    |   (90%)\r'${reset}
		sleep 0.6
		echo -ne ${blue}'	TimeOut |  ███████████████████   |   (95%)\r'${reset}
		sleep 0.6
		echo -ne ${blue}'	TimeOut |  ████████████████████  |  (100%)\r'${reset}
		sleep 0.6
		echo -ne '\n'
		}

##-------------------------=========== SEPARATOR =============-------------------------
part=1
echo -------------------------===== Section $part =====-------------------------
echo "Select images folder or filename using dialog !"
	echo

	file=$(zenity --file-selection \
		--file-filter="Images files (jpg/webp) | *.gif *.webp *.jpg *.jpeg *.png *.tif *.tiff *.avif *.bmp *.avif" \
		--file-filter="All files (*.*) | ***" \
		--filename=$HOME/ --title="Select a file, IMAGES format supported")		## File select.
	## file=$(zenity  --file-selection --filename=$HOME/ --title="Choose a directory to convert all file" --directory)	## Directory select.
	## file="/$HOME/Pictures/"
	## file="/$HOME/Downloads/"
	## --file-filter="*.jpg *.gif *.jpeg"
	## --file-filter='*[WwEeBbPp] | *[JjPpGg]' 

	count=`ls -1 "$file" 2>/dev/null | wc -l`
	if [ $count -ge "1" ]; then
		echo Count : $count
		echo
		echo "You have selected :"
		echo "$file"
		echo
		fi

## -------------------------===== Separator =====-------------------------

### file or folder
	if test -z "$file"	## for cancel on zenity
		then
			echo "You click CANCEL !"
			echo
			echo "${yellow}█████████████████████ NO DATA TO PROCESS █████████████████████${reset}"
			echo
			read -n 1 -s -r -p "Press any key to EXIT"
			echo
			exit
			fi

	if [ "$count" -eq 0 ]	## for n files in directory
		then
			echo "You don't have selected a folder including files !"
			echo
			echo "${yellow}█████████████████████ NO DATA TO PROCESS █████████████████████${reset}"
			echo
			read -n 1 -s -r -p "Press any key to EXIT"
			echo
			exit
			fi

	if [ "$debug" -eq "1" ]; then
		debug
		echo "${blue}		█████ DEBUG WAIT █████${reset}"
		echo
		sleep=3
		functionsleepbar
		echo
		fi
		
echo -------------------------========================-------------------------
## Version 4,00
## Input_Directory_Output
	echo "Input name, directory and output name : (Debug helper)"
	echo

## Set working path.
	BASEDIR=$(dirname "$0")
	echo Basedir : "$BASEDIR"
	dir=$(pwd)

## file or folder selected
	echo "Working dir : "$dir""
	echo Input file : "$file"
	export VAR="$file"
	echo

## directory section
	INPUT="$(dirname "${VAR}")"	
	echo "Get the last Folder : ${INPUT##*/}"
	echo Base directory : "$(dirname "${VAR}")"
	echo Base name: "$(basename "${VAR}")"
	echo

## Output file name
	name=`echo "$file" | rev | cut -f 2- -d '.' | rev` ## remove extension
	echo "Output name ext : "$name""
	name1=`echo "$(basename "${VAR}")" | rev | cut -f 2- -d '.' | rev` ## remove extension
	#echo "Output name bis 1 : "$name1""
	name1="$name1"
	echo "Output name bis : "$name1""
	echo

## Debug data
	echo "Debug data : debug=$debug error=$error part=$part noquit=$noquit random=$random random2=$random2"
	echo "		primeerror=$primeerror lowercase=$lowercase id=$id reseize=$reseize"
	echo
	if [ "$debug" -eq "1" ]; then
		debug
		echo "${blue}		█████ DEBUG WAIT █████${reset}"
		echo
		echo "Debug data: $file"
		echo
		sleep=3
		functionsleepbar
		echo
		fi

echo -------------------------========================-------------------------
echo "The core/code program. Version 3.07"
	echo
	## local var
	entry2=4
	debugcore=0
	progname="Upscale images"

	if [ $debugcore -eq 1 ] ; then
		printf '\033[8;40;150t'	## minimum of 90 for graphics.
		noquit=1
		debug=1
		fi

## -------------------------===== Separator =====-------------------------

	echo "Software name: Upscale image(s)"
	echo
	echo Example:
	echo xbrzscale
	echo usage: xbrzscale scale_factor input_image output_image
	echo scale_factor can be between 2 and 6
	echo
	echo Informations :
	echo
	echo JPEG is also defined with the additional extensions: jpg jpe jif jfif and jfi
	echo Animated gif or webp are not supported
	echo
	echo Known bugs :
	echo
	echo "Images bigger than 10000x10000 create errors if you don't have change imagemagick policy."
	echo
	echo https://github.com/atheros/xbrzscale
	echo https://jaibeermalik.wordpress.com/2012/10/18/imagemagick-mogrify-vs-convert-which-one-to-use-and-when/
	echo
	echo "By LostByteSoft, no copyright or copyleft"
	echo "https://github.com/LostByteSoft"
	echo
	echo "Don't hack paid software, free software exists and does the job better."
	echo

## -------------------------===== Separator =====-------------------------

	debugcore()	{
		if [ "$debugcore" -eq 1 ]; then
		debug
		echo
		echo entry2 = $entry2
		echo
		echo file = $file
		echo
		echo name1 = $name
		echo
		echo UpScale name : ""$name""_$entry2_UpScale.jpg
		echo
		echo "Command : xbrzscale $entry2 "$file" ""$name""_"$entry2"_UpScale.jpg"
		echo
		echo "Command : mogrify -format jpg -resize 100% ""$name""_"$entry2"_UpScale.jpg"
		echo
		read -n 1 -s -r -p "Press any key to EXIT or press X to close this windows !"
		echo
		fi
		}

## -------------------------===== Separator =====-------------------------

echo "Numbers of xbrzscale scale_factor. (No automatic options.)"
	echo

	while true;do functionfastbar ; done &
		entry2=$(zenity --timeout 11 --min-value="2" --scale --value="5"  --max-value="6" \
		--title "Numbers of xbrzscale scale_factor" --text "Numbers of xbrzscale scale_factor, 2 (lower) to 6 (bigger).\n\n\tSuggested default to 5 for best quality.")
		kill $!; trap 'kill $!' SIGTERM

	echo
	echo

	if [ $? -eq 1 ] ; then
		zenity --error --text="You press cancel. Quit now."
		echo
		exit
		fi

	if test -z "$entry2"
		then
			echo "Default value of 6 will be used. Now continue."
			entry=4
			echo "You have selected : $entry2"
		else
			echo "You have selected : $entry2"
	fi
	echo
	debugcore

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo "xbrzscale upscale command"

	echo
	echo "Your command : xbrzscale $entry2 "$file" "$name"_UpScale.jpg"
	echo

	debugcore

	## usage: xbrzscale scale_factor input_image output_image
	xbrzscale $entry2 "$file" "$name"_UpScale.jpg

	echo
	error $?

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo "Reconvert ?"

	if [ $automatic -eq 0 ] ; then
		echo
		echo "Reconvert (Yes or No (Suggest Yes))"
		echo
		if zenity --no-wrap --question --text="Do you want to reconvert to save space ? (Yes or No (Suggest Yes))"
		then
			## REconvert to webp
			#echo mogrify ""$name""_UpScale.webp"" -format webp -define webp:lossless=true -format webp ""$name""_UpScale.webp""
			#mogrify ""$name""_UpScale.webp"" -define webp:lossless=true -format webp ""$name""_UpScale.webp""
			#error $?
			
			## REconvert to jpg
			echo "Your command : mogrify -resize 100% -quality 90 "$name"_UpScale.jpg"
			echo
			mogrify -format jpg -resize 100% -quality 90 "$name"_UpScale.jpg
			error $?
		else
			echo "Not reconverted."
			echo
		fi
	else
	## automatic=1 REconvert to jpg
		echo "Automatic reconvert !"
		echo
		echo "Your command : mogrify -resize 100% -quality 90 "$name"_UpScale.jpg"
		echo
		
		mogrify -format jpg -resize 100% -quality 90 "$name"_UpScale.jpg
		error $?
	fi	## end automatic

	debugcore

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo "Checker Zero Files. Finding files..."
	echo
	echo 	"Fail safe ${green}█████${reset} Checker Zero Files. Scan files for zero bytes."
	
	rm "/dev/shm/findzero.txt" 2> /dev/null
	rm "/dev/shm/empty.txt" 2> /dev/null
	
	emptyfiles=0
	number5=0

	file5="$file"
	find "$file5" -name 'lost+found' -prune -o -name 'run' -prune -o -iname '*'  >> "/dev/shm/findzero.txt"

	lines5=$(wc -l < "/dev/shm/findzero.txt")
	
	if [ "$lines5" -ge "1" ]; then
	{
	input="/dev/shm/findzero.txt"
		while IFS= read -r "file6"
		do
		if [ -s "$file6" ]; then
			number5=$((number5+1))
		else
			number5=$((number5+1))
			emptyfiles=$((emptyfiles+1))
			primeerror=$((primeerror+1))
			noquit=1			# No quit after detecting an error.
			echo $file6 >> /dev/shm/empty.txt
		fi
		done < "$input"
	}

	number5=$((number5-1))	## need to remove 1 file, folder name count.
	echo
	echo Number of files checked : $number5
	echo

	if [ "$emptyfiles" -eq "0" ]; then
			echo "		${green}█████ NO empty files found █████${reset}"
			sleep 1
		else
			echo "		${red}████████████████████████████████████████████${reset}"
			echo "		${red}██                                        ██${reset}"
			echo "		${red}██           Empty files found            ██${reset}"
			echo "		${red}██                                        ██${reset}"
			echo "		${red}████████████████████████████████████████████${reset}"
			echo
			echo "Numbers of empty files : $emptyfiles"
			echo
			echo -------------------------===== Listing start =====-------------------------
			echo
			cat /dev/shm/empty.txt
			echo
			echo -------------------------===== Listing end =====-------------------------
			echo
			noquit=1
			read -n 1 -s -r -p "Press ENTER key to Continue ! You can close this windows."
			echo
		fi
	else
		echo "You don't have selected a folder with files, function canceled."
	fi

## -------------------------===== Separator =====-------------------------

	if [ "$debug" -eq 1 ]; then
		debug
		echo "${blue}		█████ DEBUG WAIT , end zerofiles █████${reset}"
		echo
		read -n 1 -s -r -p "Press ENTER key to continue !"
		echo
		fi
	echo

## -------------------------===== Separator =====-------------------------

	rm "/dev/shm/empty.txt" 2> /dev/null
	rm "/dev/shm/findzero.txt" 2> /dev/null 2> /dev/null

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo "Software lead out. Version 7.36"
	echo

## -------------------------===== Start of eula =====-------------------------
	functioneula() {
		printf '\033[8;33;90t'		## Will resize the window.
		echo
		echo "End-user license agreement (eula)"
		echo
	 	echo "JUST DO WHAT THE F*** YOU WANT WITH THE PUBLIC LICENSE"
		echo	 	
	 	echo "Version 3.1415926532 (January 2022)"
		echo
	 	echo "TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION"
		echo
		echo "Everyone is permitted to copy and distribute verbatim or modified copies of"
	 	echo "this license document."
		echo
	 	echo "As is customary and in compliance with current global and interplanetary"
	 	echo "regulations, the author of these pages disclaims all liability for the"
	 	echo "consequences of the advice given here, in particular in the event of partial"
	 	echo "or total destruction of the material, Loss of rights to the manufacturer"
	 	echo "warranty, electrocution, drowning, divorce, civil war, the effects of radiation"
	 	echo "due to atomic fission, unexpected tax recalls or encounters with"
	 	echo "extraterrestrial beings elsewhere."
		echo
	 	echo "YOU MUST ACCEPT THESES TERMS OR NOTHING WILL HAPPEN."
		echo
	 	echo "LostByteSoft no copyright or copyleft we are in the center."
		echo
	 	echo "You can send your request and your Christmas wishes to this address:"
		echo
	 	echo "	Père Noël"
	 	echo " 	Pôle Nord, Canada"
	 	echo "	H0H 0H0"
	 	echo
	 	}

## -------------------------===== Separator =====-------------------------
	echo "Debug random : id=$id part=$part primeerror=$primeerror error=$error random=$random random2=$random2"
	echo
	echo "Debug : findsubfolders=$findsubfolders lowercase=$lowercase detox=$detox automatic=$automatic"
	echo "	debug=$debug debugcore=$debugcore minimize=$minimize maximize=$maximize reseize=$reseize noquit=$noquit"
	echo
	echo -------------------------===== End of Bash ======-------------------------
	echo
	echo "Finish... with numbers of actions : $part"
	echo "This script take $(( SECONDS - start )) seconds to complete."
	echo "Started Time : $now"
	date=$(date -d@$(( SECONDS - start )) -u +%H:%M:%S)
	echo "Time needed: $date"
	now5=$(date +"%Y-%m-%d_%A_%H:%M:%S")
	echo "Current time : $now5"
	echo

## -------------------------===== Separator =====-------------------------

	if [ "$logs" -eq "1" ]; then
		echo " " >> /dev/shm/logs.txt
		echo "	Time now : $now5" >> /dev/shm/logs.txt
		echo "	Time needed : $date" >> /dev/shm/logs.txt
		echo "	Started Time : $now" >> /dev/shm/logs.txt
		echo "	Name of software : $me" >> /dev/shm/logs.txt
		echo "	Debug random : id=$id part=$part primeerror=$primeerror error=$error random=$random random2=$random2" >> /dev/shm/logs.txt
		echo "	Debug : findsubfolders=$findsubfolders lowercase=$lowercase detox=$detox automatic=$automatic debug=$debug debugcore=$debugcore \
		minimize=$minimize maximize=$maximize reseize=$reseize noquit=$noquit" >> /dev/shm/logs.txt
		echo "	File (If any used) : $file" >>/dev/shm/logs.txt
		echo " " >>/dev/shm/logs.txt
		echo "--------------------====== SEPARATOR ========--------------------" >>/dev/shm/logs.txt
		fi

## -------------------------===== Separator =====-------------------------
## Exit, wait or auto-quit.

	echo -ne "\033]0;FINISH-$SCRIPT_NAME\a"

	if [ "$primeerror" -ge "1" ]; then
		printf '\033[8;20;90t'		## Will resize the window.
		echo "${red}████████████████████████████████████████████${reset}	${yellow}████████████████████████████████████████${reset}"
		echo "${red}██                                        ██${reset}	${yellow}██                                    ██${reset}"
		echo "${red}██     Unknown entry event... ERROR(S)    ██${reset}	${yellow}██       Time needed : $date       ██${reset}"
		echo "${red}██                                        ██${reset}	${yellow}██                                    ██${reset}"
		echo "${red}████████████████████████████████████████████${reset}	${yellow}████████████████████████████████████████${reset}"
		echo
		echo "Numbers of error(s) : $primeerror"
		echo
		echo "Terminated : $me"
		echo
		noquit=1
	else

		printf '\033[8;20;90t'		## Will resize the window.
		echo "${green}████████████████████████████████████████${reset}	${blue}████████████████████████████████████████${reset}"
		echo "${green}██                                    ██${reset}	${blue}██                                    ██${reset}"
		echo "${green}██         NO errors detected.        ██${reset}	${blue}██       Time needed : $date       ██${reset}"
		echo "${green}██                                    ██${reset}	${blue}██                                    ██${reset}"
		echo "${green}████████████████████████████████████████${reset}	${blue}████████████████████████████████████████${reset}"
		echo
		echo "Terminated : $me"
		echo
	fi

	## -------------------------===== Separator =====-------------------------
	if [ "$noquit" -eq "1" ]; then
		if [ "$primeerror" -eq "0" ]; then
				echo "${blue}	█████████████████ NO exit activated ███████████████████${reset}"
			else
				echo "${orange}	█████████████████ NO exit activated ███████████████████${reset}"
			fi
		echo
		while true; do 
			echo "Press ANYKEY to show EULA, ENTER or SPACE to EXIT." 
			read -r -n 1 -s input_key
			if [[ -n "input_key" ]]; then 
				if [[ "input_key" == " " || -z "$input_key" ]]; then 
					break 
				else
					functioneula
					read -n 1 -s -r -p "Press any key to EXIT." 
					echo
					break
				fi 
			else
					break 
				fi 
			done
			echo
			fi

	## -------------------------===== Separator =====-------------------------
	if [ "$debug" -eq "1" ]; then
		debug
		echo "${blue}		█████ DEBUG WAIT | Program finish. █████${reset}"
		echo
		read -n 1 -s -r -p "Press any key to EXIT or press X to close this windows !"
		echo
		echo
		exit 0
		fi

	## -------------------------===== Separator =====-------------------------

	echo "${green}	███████████████ Finish, quit in 3 seconds █████████████████${reset}"
	echo
	if [ "$debugcore" -eq "0" ]; then
		sleep=3
		functionsmallbar
	else
		sleep=1
		functionsmallbar
	fi
	echo
	exit 0

## -------------------------===== End of file =====-------------------------
