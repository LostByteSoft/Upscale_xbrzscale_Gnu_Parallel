#!/bin/bash
#!/usr/bin/ffmpeg

	echo "-------------------------===== Start of bash ====-------------------------"
	printf '\033[8;27;90t'	## minimum of 90 for graphics.
	version=2025-08-17_Sunday_06:47:10

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
		noquit=0

	printf '\033[8;27;90t'	## minimum of 90 for graphics.
	SCRIPT_NAME=$(basename "$0")
	echo -ne "\033]0;$SCRIPT_NAME\a"

##-------------------------=========== SEPARATOR =============-------------------------
## Lead-in Version 6.06
	echo
	echo
	## Time, host name, file name, pid.
		start=$SECONDS
		now=$(date +"%Y-%m-%d_%A_%H:%M:%S")	## time now
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
		random=$(shuf -i 4096-131072 -n 1)	# Used for temp folders. A big number hard to guess for security reasons.
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

##-------------------------=========== SEPARATOR =============-------------------------

	#spd-say "Lost byte soft"

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
	sleep 0.25

echo -------------------------=========== SEPARATOR =============-------------------------
	echo "Software lead-in. LostByteSoft ; https://github.com/LostByteSoft"
	echo
	echo "$me"
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
	echo
	echo "By LostByteSoft, no copyright or copyleft. https://github.com/LostByteSoft"
	echo
	echo "Don't hack paid software, free software exists and does the job better."
	echo
	echo "Debug data : debug=$debug error=$error part=$part noquit=$noquit random=$random random2=$random2"
	echo "		primeerror=$primeerror lowercase=$lowercase id=$id reseize=$reseize"
	echo

echo -------------------------=========== SEPARATOR =============-------------------------
	echo "Color codes / Informations."
	echo
	echo  "${green}	████████████████     ALL OK / ACTIVE      ████████████████ ${reset}"
	echo   "${blue}	████████████████      INFORMATION(S)      ████████████████ ${reset}"
	echo "${yellow}	████████████████   ATTENTION / INACTIVE   ████████████████ ${reset}"
	echo    "${red}	████████████████   FATAL ERROR / OFFLINE  ████████████████ ${reset}"
	echo

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo
	echo Check installed requirements !
	echo
if command -v xdotool >/dev/null 2>&1
	then
		echo "xdotool installed continue."
		dpkg -s xdotool | grep Version
		echo "${green} ████████████████ OK ████████████████ ${reset}"
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
if command -v parallel >/dev/null 2>&1
	then
		echo "Parallel installed continue."
		dpkg -s parallel | grep Version
		echo "${green} ████████████████ OK ████████████████ ${reset}"
		echo
		parallelinstall=1
	else
		echo "You don't have ' parallel ' installed."
		echo "Add with : sudo apt-get install parallel"
		echo
		echo "${red}████████████████ Dependency error ████████████████${reset}"
		echo
		read -n 1 -s -r -p "Press ENTER key to continue anyway (NOT a good idea) !"
		echo
		echo
		parallelinstall=0
	fi

## -------------------------===== Separator =====-------------------------
part=$((part+1))
echo -------------------------===== Section $part =====-------------------------
echo "Functions informations. Version 1.22"
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
			echo "${blue}		█████ DEBUG █████${reset}"
			echo
			echo "Debug data : debug=$debug error=$error part=$part noquit=$noquit automatic=$automatic primeerror=$primeerror"
			echo "		random=$random random2=$random2 id=$id wol=$wol automatic=$automatic suspend=$suspend reseize=$reseize"
			echo
			echo "Debug active : activemaster=$activemaster activeserver=$activeserver activeacer=$activeacer"
			echo "		activelenovo=$activelenovo activestartrek=$activestartrek activestargate=$activestargate"
			echo
			echo "Debug name : namepc25=$namepc25 namepc40=$namepc40 namepc50=$namepc50"
			echo "		namepc70=$namepc70 namepc80=$namepc80 namepc90=$namepc90"
			echo
			echo "Debug lock : lock=$lock lockmaster=$lockmaster lockserver=$lockserver lockacer=$lockacer"
			echo "		locklenovo=$locklenovo lockstargate=$lockstargate lockstartrek=$lockstartrek"
			echo
			reseize=0
			minimize=0
			maximize=0
			noquit=1
			printf '\033[8;45;150t'		## Will resize the window.
			fi
			}

##-------------------------=========== SEPARATOR =============-------------------------

	name=ERROR
	explain="Errorlevel show error messages."
	if [ "$error" -eq "0" ]; then
		echo 	"Function ${green}█████${reset} Default deactivated $name . $explain"
	else
		echo 	"Function ${blue}█████${reset} Activated $name . $explain"
	fi
	echo

	error() {
		if [ "$?" -ge 1 ]; then
			reseize=0
			noquit=1
			automatic=0
			primeerror=$((primeerror+1))
			echo
			echo "${red}█████████████████████████████████ ERROR SECTION $part █████████████████████████████████${reset}"
			echo
			echo "!!! ERROR was detected !!!" ## Press ANY key to try to CONTINUE !!!
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
			echo "${yellow} █████ pid = $pid${reset}"
		fi
	fi
	echo

##-------------------------=========== SEPARATOR =============-------------------------

	name=MAXIMIZE
	explain="Minimize the program."
	if [ "$noquit" -eq "0" ]; then
		echo 	"Function ${blue}█████${reset} Default deactivated $name . $explain"
	else
		echo 	"Function ${green}█████${reset} Activated $name . $explain"
	fi

if [ "$maximize" -eq "1" ]; then
	pid=$(echo $PPID)
	if [ "$xdotoolinstall" -eq "1" ]; then
			echo "Function ${blue}█████ Minimize activated. ${yellow}pid = $pid${reset}"
			sleep 0.2
			window_id=$(xdotool search --pid $pid | tail -1)
			sleep 0.2
			#echo pid = $pid | window_id = $window_id
			xdotool windowmaximize "$window_id"
			sleep 0.2
		else
			echo "${yellow}█████ pid = $pid${reset}"
		fi
	fi

##-------------------------=========== SEPARATOR =============-------------------------
## Simple function small bar to wait 3 sec. This bar does work with debian 12 & 13. Version 1.05

	functionsmallbar() {
		speed=0.2
		echo -ne ${yellow}'	TimeToQuit |                        |    (0%)\r'${reset}
		sleep $speed
		echo -ne ${yellow}'	TimeToQuit |  ██                    |   (10%)\r'${reset}
		sleep $speed
		echo -ne ${yellow}'	TimeToQuit |  ████                  |   (20%)\r'${reset}
		sleep $speed
		echo -ne ${yellow}'	TimeToQuit |  ██████                |   (30%)\r'${reset}
		sleep $speed
		echo -ne ${yellow}'	TimeToQuit |  ████████              |   (40%)\r'${reset}
		sleep $speed
		echo -ne ${yellow}'	TimeToQuit |  ██████████            |   (50%)\r'${reset}
		sleep $speed
		echo -ne ${yellow}'	TimeToQuit |  ████████████          |   (60%)\r'${reset}
		sleep $speed
		echo -ne ${yellow}'	TimeToQuit |  ██████████████        |   (70%)\r'${reset}
		sleep $speed
		echo -ne ${yellow}'	TimeToQuit |  ████████████████      |   (80%)\r'${reset}
		sleep $speed
		echo -ne ${yellow}'	TimeToQuit |  ██████████████████    |   (90%)\r'${reset}
		sleep $speed
		echo -ne ${yellow}'	TimeToQuit |  ████████████████████  |  (100%)\r'${reset}
		sleep $speed
		echo -ne '\n'
		}

## -------------------------===== Separator =====-------------------------
## Simple function sleep bar to wait. Wait the time you specified in code.
	## Version 1.26
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

functionsleepbar() {

	if [ "$sleep" -ge "1" ]; then
			sleep1=$(echo "scale=2 ; "$sleep"/20" | bc)
			sleep2=$(echo "scale=2 ; "$sleep"/10" | bc)
		else
			sleep=3
			sleep1=$(echo "scale=2 ; "$sleep"/20" | bc)
			sleep2=$(echo "scale=2 ; "$sleep"/10" | bc)
		fi

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
	echo -ne ${green}"Sleep time $sleep sec. ${green}	|███████|███████|███████|███████|███████|      (100%)\r"${reset}
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
echo "Names not supported / Informations."
	echo
	echo "${blue}	████████████████████████████████████████████████████████████████${reset}"
	echo "		!!! NAMES starting with symbols are NOT SUPPORTED !!!"
	echo "${blue}	████████████████████████████████████████████████████████████████${reset}"
	echo

echo -------------------------========================-------------------------
echo "Select folder or filename using dialog !"
	echo

	if [ "$automatic" -eq 0 ] ; then
		#file="$(zenity --file-selection --filename=$HOME/ --title="Select a file, all format supported")"			## File select.
		file=$(zenity --file-selection --filename=$HOME/ --title="Choose a directory to convert all file" --directory)	## Directory select.
		## file="/$HOME/Pictures/"
		## file="/$HOME/Downloads/"
		## --file-filter="*.jpg *.gif"
		## --file-filter='*[WwEeBbPp] | *[JjPpGg]'
	else
		file=/home/master/Downloads
	fi

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
echo "Number of jobs processed concurrently at the same time ? (Refer as parallel CPU cores)"
	echo

	cpu=$(nproc)
	defx=$(( cpu / 2 ))	## for audio files
	defv=$(( cpu / 4 ))	## for video files
	defi=$(( cpu * 2 ))	## for images files
	defy=$(( cpu * 4 ))	## for images files
	defz=$(( cpu * 8 ))	## for testing

	## Put an # in front of "entry" to do an automatic choice.

if [ $automatic -eq 0 ]; then

	entry=$(zenity --scale --value="$defx" --min-value="1" --max-value="$defy" --title "Convert files with Multi Cores Cpu" --text "How many cores do you want to use ? You have "$cpu" total cores !\n\n\tDefault suggested value is "$defv" for video.\n\n\tDefault suggested value is "$defx" for audio.\n\n\tDefault suggested value is "$defi" for images.\n\n(1 to whatever core you want to use will work anyway !)")

	else
		entry=$defx
	fi

if test -z "$entry"
	then
		echo "Default value of "$defx" (Safe value) will be used. Now continue."
		entry=$defx
		echo "You have selected : $entry"
		#sleep 3
	else
		echo "You have selected : $entry"
	fi
	
	echo

## -------------------------===== Separator =====-------------------------

	if [ "$entry" -ge $defy ]; then
		echo
		echo "${yellow}█████████████████████████ WARNING █████████████████████████${reset}"
		echo
		echo "!!! You have chosen a very high parallel work value, this may slow down the calculation rather than speed it up !!!"
		echo
		read -n 1 -s -r -p "Press any key to CONTINUE"
		echo
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
	echo "Output name bis : "$name1""
	echo

## Debug data
	echo "Debug data : autoquit=$autoquit debug=$debug error=$error part=$part noquit=$noquit random=$random"
	echo

echo -------------------------========================-------------------------
echo "Job lock Version 2,05"
	echo
	## local var
	runningjob=0
	#debug=1
	
	if [ -f /dev/shm/job.lock ]; then
		echo "${red} █████████ Lock-up already exist. Waiting for job finish. █████████ ${reset}"
		echo
		fi

## -------------------------===== Separator =====-------------------------

function_zenitywait () {
	(
	echo "10" ; sleep 1
	echo "20" ; sleep 1
	echo "30" ; sleep 1
	echo "40" ; sleep 1
	echo "50" ; sleep 1
	echo "60" ; sleep 1
	echo "70" ; sleep 1
	echo "80" ; sleep 1
	echo "90" ; sleep 1
	echo "100" ; sleep 1
	) |
	zenity --progress --width 400 --height 150 --title="Checker ; Lock-up already exist." \
	--text="\nWaiting for job finish... or press Cancel to remove lock-up.\n\n" --timeout 10

	if [ $? -eq 1 ] ; then
		rm "/dev/shm/job.lock" 2> /dev/null
		runningjob=1
		fi

	}	## End function function_zenitywait

	while [ -f /dev/shm/job.lock ]	## Watch if file exist
		do
		#echo "Debug : If file exist goto loop checker !"
		function_zenitywait
		done
	
	if [ $runningjob -eq 1 ] ; then
		touch /dev/shm/job.lock
		runningjob=0
		fi
	
	choice=$?

## -------------------------===== Separator =====-------------------------

	if [ ! -f /dev/shm/job.lock ]; then
		echo "${blue} █████████ A lock will be created to prevent running multiples jobs. █████████ ${reset}"
		echo
		## Create a file to lock up!
		touch /dev/shm/job.lock
		runningjob=0
		fi

	if [ "$debug" -eq 1 ]; then
		echo
		debug
		echo "	Debug Job lock Unlock job"
		echo
		echo "	Debug job lock : choice = $choice runningjob = $runningjob"
		echo
		read -n 1 -s -r -p "Press ENTER key to continue !"
		echo
		fi

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo UpScale finder... Mover
	echo

	rm "/dev/shm/findups.txt" 2> /dev/null
	countfind=0
	countfind=`ls -1 "$file"/*UpScale.* 2>/dev/null | wc -l`
	echo UpScaled files search and count is : $countfind
	find "$file" -maxdepth 1 -iname "*UpScale.*"  >> "/dev/shm/findups.txt"

	if [ $countfind -ge "1" ]; then
		echo
		cat /dev/shm/findups.txt
		echo
		fi

## -------------------------===== Separator =====-------------------------

	if [ $countfind -ge "1" ]; then
	if zenity --no-wrap --question --text="UpScale files detected, do you want to MOVE them to ""$file"/AlreadyDone/" ?.\n\nUpScaled files can by done multiples times but takes very high usage of ram."
			then
				echo Moving files...
				echo """$file""/AlreadyDone/"
				mkdir """$file""/AlreadyDone/"
				echo
			{
				input="/dev/shm/findups.txt"
				while IFS= read -r "line"
				do
				echo Output : "$line"
				mv "$line" """$file""/AlreadyDone/"
				## echo Output : "$HOME/Desktop/"$line""
				## mv  "$line" "$HOME"/Desktop/""
				done < "$input"
			}
			fi
	fi

	rm "/dev/shm/findups.txt" 2> /dev/null
	error $?

echo -------------------------========================-------------------------
echo Gif finder... Mover
	echo

	rm "/dev/shm/findgif.txt" 2> /dev/null
	count=0
	count=`ls -1 "$file"/*.gif 2>/dev/null | wc -l`

	echo GIF files search and count is : $count
	find "$file" -maxdepth 1 -iname "*.gif"  >> "/dev/shm/findgif.txt"

	if [ $count -ge "1" ]; then
		echo
		cat "/dev/shm/findvideo.txt"
		echo
		fi

## -------------------------===== Separator =====-------------------------

	if [ $count != 0 ]; then
		if zenity --no-wrap --question --text="Gif files detected, do you want to MOVE them to ""$file"/Gif" ?\n\n\tFiles are NOT compatibles JPG / UpScalables."
			then
				echo Moving files...
				mkdir ""$file"/Gif/"
				echo
			{
				input="/dev/shm/findgif.txt"
				while IFS= read -r "line"
				do
				echo Output : "$line"
				#mv "$line" ""$HOME"/Videos"
				mv  "$line" ""$file"/Gif/"
				done < "$input"
			}
		fi
	echo
	fi
	
	rm "/dev/shm/findgif.txt" 2> /dev/null
	error $?

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo Avif finder... Mover / Converter
	echo

	rm "/dev/shm/findavif.txt" 2> /dev/null
	count=0
	count=`ls -1 "$file"/*.avif 2>/dev/null | wc -l`

	echo Avif files search and count is : $count
	find "$file" -maxdepth 1 -iname "*.avif"  >> "/dev/shm/findavif.txt"

	if [ $count -ge "1" ]; then
		echo
		cat "/dev/shm/findvideo.txt"
		echo
		fi

## -------------------------===== Separator =====-------------------------

	if [ $count != 0 ]; then
		if zenity --no-wrap --question --text="avif files detected, do you want to CONVERT them ?\n\n\tFiles are NOT compatibles JPG / UpScalables. (Suggest YES)"
			then
				echo Converting files...
				echo
			{
			input="/dev/shm/findavif.txt"
				while IFS= read -r "line"
				do
				echo "$line"_convert.jpg
				convert "$line" -format jpg "$line"_convert.jpg
				done < "$input"
			}
		fi

## -------------------------===== Separator =====-------------------------

	if zenity --no-wrap --question --text="avif files detected, do you want to MOVE them to ""$file"/Avif" ?\n\n\tFiles are NOT compatibles JPG / UpScalables. (Suggest YES)"
		then
			echo Moving files...
			mkdir ""$file"/Avif/"
			echo
		{
			input="/dev/shm/findavif.txt"
			while IFS= read -r "line"
			do
			echo Output : "$line"
			#mv "$line" "$HOME"/Desktop/""
			mv "$line" ""$file"/Avif/"
			done < "$input"
		}
		fi
	fi

	rm "/dev/shm/findavif.txt" 2> /dev/null
	error $?

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo Video finder... Mover
	echo
	
	## local var, resetted at end if not needed
	countfind=0
	rm "/dev/shm/findvideo.txt" 2> /dev/null

	## Easy way to add a file format, copy paste a new line.
	echo "Will NOT find files in sub folders.... Remove -maxdepth 1 to search subfolders."

	find "$file" -maxdepth 1 -iname '*.MP4'  >> "/dev/shm/findvideo.txt"
	find "$file" -maxdepth 1 -iname '*.MKV'  >> "/dev/shm/findvideo.txt"
	find "$file" -maxdepth 1 -iname '*.WEBM'  >> "/dev/shm/findvideo.txt"
	find "$file" -maxdepth 1 -iname '*.AVI'  >> "/dev/shm/findvideo.txt"

	countfind=`ls -2 "/dev/shm/findvideo.txt" 2>/dev/null | wc -l`
	echo Video files search and count is : $countfind

	if [ $countfind -ge "1" ]; then
		echo
		cat "/dev/shm/findvideo.txt"
		echo
		fi

## -------------------------===== Separator =====-------------------------

	if [ $countfind -ge "1" ]; then
		if zenity --no-wrap --question --text="Video files detected, do you want to MOVE them to ""$file"/Video" ?\n\n\tFiles are NOT compatibles JPG / UpScalables."
			then
				echo Moving files...
				mkdir ""$file"/Video/"
				echo
			{
				input="/dev/shm/findvideo.txt"
				while IFS= read -r "line"
				do
				echo Output : "$line"
				#mv "$line" ""$HOME"/Videos"
				mv  "$line" ""$file"/Video/"
				done < "$input"
			}
		fi
	fi

	rm "/dev/shm/findvideo.txt" 2> /dev/null
	error $?

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo "The core/code program. Version 3.02"
	echo
	## local var
	entry2=4
	debug_core=0
	progname="Upscale images"

## -------------------------===== Separator =====-------------------------

	rm "/dev/shm/findimg.txt" 2> /dev/null

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

	debug_core()	{
		if [ "$debug_core" -eq 1 ]; then
		echo
		echo entry2 = $entry2
		echo
		echo file = $file
		echo
		echo name1 = $name
		echo
		echo UpScale name : ""$name""_$entry2_UpScale.jpg
		echo
		echo "Command : xbrzscale $entry2 "$file" "$name"_"$entry2"_UpScale.jpg"
		echo
		echo "Command : mogrify -format jpg -resize 100% ""$name""_"$entry2"_UpScale.jpg"
		echo
		debug
		fi
		}

	echo "Pass # of used cores  = $entry"
	
## -------------------------===== Separator =====-------------------------

echo "Numbers of xbrzscale scale_factor"
	echo

	while true;do functionfastbar ; done &
		entry2=$(zenity --timeout 11 --min-value="2" --scale --value="4"  --max-value="6" \
		--title "Numbers of xbrzscale scale_factor" --text "Numbers of xbrzscale scale_factor, 2 (lower) to 6 (bigger).\n\n\tSuggested default to 4 for best quality.")
		kill $!; trap 'kill $!' SIGTERM

	echo

	if [ $? -eq 1 ] ; then
		zenity --error --text="You press cancel. Quit now."
		echo
		exit
		fi

	if test -z "$entry2"
		then
			echo "Default value of 4 will be used. Now continue."
			entry=4
			echo "You have selected : $entry2"
		else
			echo "You have selected : $entry2"
	fi
	echo

	debug_core

## find files
part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo Finding files...
	echo
	## Easy way to add a file format, copy paste a new line.
	echo "Will NOT find files in sub folders.... Remove -maxdepth 1 to search subfolders."
	
	#find "$file" -maxdepth 1 -iname '*.AVIF'  >> "/dev/shm/gen/find.txt"		## Compatibility problems, not fully supported
	find "$file" -maxdepth 1 -iname '*.BMP'  >> "/dev/shm/findimg.txt"
	find "$file" -maxdepth 1 -iname '*.GIF'  >> "/dev/shm/findimg.txt"
	find "$file" -maxdepth 1 -iname '*.JPEG'  >> "/dev/shm/findimg.txt"
	find "$file" -maxdepth 1 -iname '*.JPG_MEDIUM'  >> "/dev/shm/findimg.txt"
	find "$file" -maxdepth 1 -iname '*.JPG_LARGE'  >> "/dev/shm/findimg.txt"
	find "$file" -maxdepth 1 -iname '*.JPG'  >> "/dev/shm/findimg.txt"
	find "$file" -maxdepth 1 -iname '*.PNG'  >> "/dev/shm/findimg.txt"
	find "$file" -maxdepth 1 -iname '*.TIF'  >> "/dev/shm/findimg.txt"
	find "$file" -maxdepth 1 -iname '*.TIFF'  >> "/dev/shm/findimg.txt"
	find "$file" -maxdepth 1 -iname '*.WEBP'  >> "/dev/shm/findimg.txt"
	find "$file" -maxdepth 1 -iname '*.OPDOWNLOAD'  >> "/dev/shm/findimg.txt"
	echo

	lines=$(wc -l < "/dev/shm/findimg.txt")
	echo Finding finish, with file count : $lines
	echo
	
	if [ "$lines" -eq "0" ]; then
		echo "You don't have selected a folder with IMAGES files, now exit in 10 seconds."
		echo
		echo -------------------------========================-------------------------
		sleep 10
		exit
	fi

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo "xbrzscale upscale command"
	echo
	echo "Your command : xbrzscale $entry2 "$file" "XXX"_"$entry2"_UpScale.jpg"
	echo
	echo Complex convertion multiples files "($entry)" at a time.
	echo
	#echo parallel -a "/dev/shm/findimg.txt" -j $entry xbrzscale $entry2 {} {}_UpScale.webp
	#parallel -a "/dev/shm/findimg.txt" -j $entry xbrzscale $entry2 {} {}_UpScale.webp
	echo parallel -a "/dev/shm/findimg.txt" -j $entry xbrzscale $entry2 {} {.}_UpScale.jpg
	echo
	parallel -a "/dev/shm/findimg.txt" -j $entry xbrzscale $entry2 {} {.}_UpScale.jpg
	echo
	echo UpScale finish...
	echo

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo "Reconvert to save space"

if [ $automatic -eq 0 ]; then
		if zenity --no-wrap --question --text="Do you want to reconvert to save space ? (Yes or No (Suggest Yes))"; then
			echo
			echo Convert to jpg / webp, parallel REconversion. Find UpScaled files..
			rm "/dev/shm/findimg.txt" 2> /dev/null
			echo "find "$file" -maxdepth 1 -iname 'UpScale'  >> "/dev/shm/findimg.txt""
			## find "/$HOME/Desktop" -maxdepth 1 -iname '*UpScale.webp'  >> "/dev/shm/findimg.txt"
			#find "$file" -maxdepth 1 -iname '*UpScale.webp'  >> "/dev/shm/findimg.txt"	## webp
			find "$file" -maxdepth 1 -iname '*UpScale.jpg'  >> "/dev/shm/findimg.txt"	## jpg
			#cat "/dev/shm/findimg.txt"
			lines=$(wc -l < "/dev/shm/findimg.txt")
			echo Finding finish, with file count : $lines
			echo
			part=$((part+1))
			echo "-------------------------===== Section $part =====-------------------------"
			echo Convert started...
			## convert to jpg or webp
			echo "Parallel jobs for images converting : $entry"
			echo "Defined automatically by # of core of the processor."
			echo
			#parallel -a "/dev/shm/findimg.txt" -j $defi mogrify -define webp:lossless=true -format webp	## webp lossy
			#parallel -a "/dev/shm/findimg.txt" -j $defi mogrify -depth 32 -format webp			## webp
			parallel -a "/dev/shm/findimg.txt" -j $entry mogrify -format jpg -resize 95% -quality 90	## jpg
			rm "/dev/shm/findimg.txt" 2> /dev/null
			echo Conversion finish...

		else
			echo "Not reconverted."
			echo
		fi
	
	else
			echo
			echo Convert to jpg / webp, parallel REconversion. Find UpScaled files..
			rm "/dev/shm/findimg.txt" 2> /dev/null
			echo "find "$file" -maxdepth 1 -iname 'UpScale'  >> "/dev/shm/findimg.txt""
			## find "/$HOME/Desktop" -maxdepth 1 -iname '*UpScale.webp'  >> "/dev/shm/findimg.txt"
			#find "$file" -maxdepth 1 -iname '*UpScale.webp'  >> "/dev/shm/findimg.txt"	## webp
			find "$file" -maxdepth 1 -iname '*UpScale.jpg'  >> "/dev/shm/findimg.txt"	## jpg
			#cat "/dev/shm/findimg.txt"
			lines=$(wc -l < "/dev/shm/findimg.txt")
			echo Finding finish, with file count : $lines
			echo
			part=$((part+1))
			echo "-------------------------===== Section $part =====-------------------------"
			echo Convert started...
			## convert to jpg or webp
			echo "Parallel jobs for images converting : $entry"
			echo "Defined manually by selecting # of core of the processor."
			echo
			#parallel -a "/dev/shm/findimg.txt" -j $entry mogrify -define webp:lossless=true -format webp	## webp lossy
			#parallel -a "/dev/shm/findimg.txt" -j $entry mogrify -depth 32 -format webp			## webp
			echo "parallel -a "/dev/shm/findimg.txt" -j $entry mogrify -format jpg -resize 95% -quality 90"
			parallel -a "/dev/shm/findimg.txt" -j $entry mogrify -format jpg -resize 95% -quality 90	## jpg
			rm "/dev/shm/findimg.txt" 2> /dev/null
			echo Conversion finish...
	fi

	echo Conversion finish...
	echo

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo Move files to new folder?
	echo
	
	#if zenity --no-wrap --question --text="Do you want to move files to $file/UpScale ? (Yes or No))"
	#then
		#part=$((part+1))
		#echo "-------------------------===== Section $part =====-------------------------"
		echo Create folder...
		mkdir -p "$file"/UpScale
		echo Move files... to "$file"/UpScale
		#echo '$'file/*_UpScale* '$file'/UpScale
		mv "$file"/*_UpScale* "$file"/UpScale
	#else
	#	part=$((part+1))
	#	echo "-------------------------===== Section $part =====-------------------------"
	#		echo "Files not moved."	
	#fi
	echo

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo Verify numbers of files...
	## Variable
	subfolder=UpScale
	finaldir="$file"/"$subfolder"
	echo "Final dir : "$file"/"$subfolder""
	echo
	rm "/dev/shm/findimg.txt" 2> /dev/null

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo Files in folder counter / checker.
	echo
	# var for section
	count1=0
	count2=0
	#debug=1		## debug purposes, activate if you want.
	
	if [ "$debug" -eq "1" ]; then
		echo
		echo "${blue}		█████ DEBUG WAIT , start compare ! █████${reset}"
		echo
		debug
		echo
		read -n 1 -s -r -p "Press ENTER key to continue !"
		echo
	fi
	
## -------------------------========================-------------------------
## first folder
	##file1="/dev/shm/$random"
	echo "	Origin : $file"
	#file=$(zenity  --file-selection --filename=$HOME/ --title="Choose a directory to convert all file" --directory)
	count1=`find "$file" -maxdepth 1 -type f | wc -l`
	#echo Count 1 = $count1

## -------------------------========================-------------------------
## second filder
	file2="""$file"/"$subfolder"
	#file2=$(zenity  --file-selection --filename=$HOME/ --title="Choose a directory to convert all file" --directory)
	echo "	Save : """$file"/"$subfolder""
	count2=`find "$file2" -maxdepth 1 -type f | wc -l`
	#echo Count 2 = $count2
	echo
	
## -------------------------========================-------------------------
echo "Total numbers of files in folders :"
	echo
	echo "	Origin folder : $count1 | Modified or results : $count2"
	echo
	echo "The answer is .... :"

	if [ "$debug" -eq "1" ]; then
		echo
		echo "${blue}		█████ DEBUG WAIT , The answer is .... : █████${reset}"
		echo
		debug
		echo
		echo Count1 = $count1 Count2 = $count2
		echo
		read -n 1 -s -r -p "Press ENTER key to continue !"
		echo
	fi
	

		if [ "$count1" = "$count2" ]; then
			echo
			echo "		${green}████████████████████████████████████████${reset}"
			echo "		${green}██                                    ██${reset}"
			echo "		${green}██     Numbers of files are EQUAL     ██${reset}"
			echo "		${green}██                                    ██${reset}"
			echo "		${green}████████████████████████████████████████${reset}"
			echo
			fi
	
		if [ "$count1" -ne "$count2" ]; then
			echo
			echo "		${red}████████████████████████████████████████████${reset}"
			echo "		${red}██                                        ██${reset}"
			echo "		${red}██     Numbers of files are NOT EQUAL     ██${reset}"
			echo "		${red}██                                        ██${reset}"
			echo "		${red}████████████████████████████████████████████${reset}"
			echo
			
			primeerror=$((primeerror+1))
			noquit=1	# No quit after detecting an error.
			#debug=1	# Debug if numbers of files are not equal
			echo
	
	## fi after files check if numbers are not equal
	## -------------------------========================-------------------------
	## Finding files... if not equal
	echo "Will NOT find files in sub folders... 20240611062615"
	cd "$file" && find -maxdepth 1 -name "*.*" | rev | cut -f 2- -d '.' | rev >> "/dev/shm/file1.txt"
	#cat "/dev/shm/file1.txt"
	## Finding files... 2
	#echo "Will NOT find files in sub folders..."
	cd ""$file2"" && find -maxdepth 1 -name "*.*" | rev | cut -f 2- -d '_' | rev >> "/dev/shm/file2.txt"
	#cat "/dev/shm/file2.txt"
	sort /dev/shm/file1.txt > /dev/shm/file11.txt
	sort /dev/shm/file2.txt > /dev/shm/file22.txt
	sed -i '1d' "/dev/shm/file11.txt"	## remove first line
	sed -i '1d' "/dev/shm/file22.txt"
	
	part=$((part+1))
	echo "-------------------------===== Section $part =====-------------------------"
	echo Verify 2 files for differences.
	echo
	echo diff -s -q "/dev/shm/file11.txt" "/dev/shm/file22.txt"
	echo
	diff -s -q "/dev/shm/file11.txt" "/dev/shm/file22.txt"
	active=$(echo $?)
	#echo $active
		if [ "$active" -ge "1" ]
			then
			echo
			primeerror=$((primeerror+1))
			echo "${red} ███████████████ VERIFY FILES ███████████████ ${reset}"
			fi
		if [ "$active" -eq "0" ]
			then
			echo
			echo "${green} ██████████████████████████████ ${reset}"
			fi

	echo
	part=$((part+1))
	echo "-------------------------===== Section $part =====-------------------------"
	echo Comparaison of files :
	echo
	echo diff --side-by-side --suppress-common-lines "/dev/shm/file11.txt" "/dev/shm/file22.txt"
	echo
	diff --side-by-side --suppress-common-lines "/dev/shm/file11.txt" "/dev/shm/file22.txt"

	active=$(echo $?)
		#echo $active
		if [ "$active" -ge "1" ]
			then
			echo
			primeerror=$((primeerror+1))
			echo "${red} ███████████████ VERIFY FILES ███████████████ ${reset}"
			fi
		if [ "$active" -eq "0" ]
			then
			echo
			echo "${green} ██████████████████████████████ ${reset}"
			fi
		fi

	if [ "$debug" -eq "1" ]; then
		echo
		echo "${blue}		█████ DEBUG WAIT , end compare !█████${reset}"
		echo
		debug
		echo
		read -n 1 -s -r -p "Press ENTER key to continue !"
		echo
		fi

	## del temp files
	rm "/dev/shm/file1.txt" 2> /dev/null
	rm "/dev/shm/file2.txt" 2> /dev/null
	rm "/dev/shm/file11.txt" 2> /dev/null
	rm "/dev/shm/file22.txt" 2> /dev/null
	echo

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo "Unlock ssh nodes. Version 1.04"
	echo

	if [ "$runningjob" -eq 0 ]; then
		rm "/dev/shm/job.lock" 2> /dev/null
		echo "${green} █████████ Computer released, new jobs available. █████████ ${reset}"
		echo
	else
		echo "${red} █████████ Had work in calculation and will not be unlocked. █████████ ${reset}"
		echo
		fi

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
echo "Software lead out. Version 5.23"

	if [ "$reseize" -eq "1" ]; then
		printf '\033[8;25;90t'		## Will resize the window.
		fi

## -------------------------===== Separator =====-------------------------

	echo
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
	now5=$(date +"%Y-%m-%d_%A_%I:%M:%S")
	echo "Current time : $now5"
	echo

## -------------------------===== Separator =====-------------------------

	if [ "$logs" -eq "1" ]; then
		echo " " >>/dev/shm/logs.txt
		echo "	Time now : $now5" >>/dev/shm/logs.txt
		echo "	Time needed : $date" >>/dev/shm/logs.txt
		echo "	Started Time : $now" >>/dev/shm/logs.txt
		echo "	Name of software : $me" >>/dev/shm/logs.txt
		echo "	Debug random : id=$id part=$part primeerror=$primeerror error=$error random=$random random2=$random2" >>/dev/shm/logs.txt
		echo "	Debug : findsubfolders=$findsubfolders lowercase=$lowercase detox=$detox automatic=$automatic debug=$debug debugcore=$debugcore \
		minimize=$minimize maximize=$maximize reseize=$reseize noquit=$noquit" >>/dev/shm/logs.txt
		echo "	File (If any used) : $file" >>/dev/shm/logs.txt
		echo " " >>/dev/shm/logs.txt
		echo "--------------------====== SEPARATOR ========--------------------" >>/dev/shm/logs.txt
		fi

## -------------------------===== Separator =====-------------------------
## Exit, wait or auto-quit.

	echo -ne "\033]0;FINISH-$SCRIPT_NAME\a"

	if [ "$primeerror" -ge "1" ]; then
		if [ "$reseize" -eq "1" ]; then
			printf '\033[8;35;90t'		## Will resize the window.
			fi
		#spd-say "$programname have errors."
		#echo
		echo "${red}████████████████████████████████████████████${reset}	${blue}████████████████████████████████████████${reset}"
		echo "${red}██                                        ██${reset}	${blue}██                                    ██${reset}"
		echo "${red}██     Unknown entry event... ERROR(S)    ██${reset}	${blue}██       Time needed : $date       ██${reset}"
		echo "${red}██                                        ██${reset}	${blue}██                                    ██${reset}"
		echo "${red}████████████████████████████████████████████${reset}	${blue}████████████████████████████████████████${reset}"
		echo
		echo "Numbers of error(s) : $primeerror"
		echo
		echo "Terminated : $me"
		echo
		#debug
		sleep=3
		functionsleepbar
		noquit=1
	else
		if [ "$reseize" -eq "1" ]; then
			printf '\033[8;18;90t'		## Will resize the window.
			fi
		#spd-say "$programname finished without errors."
		#echo
		echo "${green}████████████████████████████████████████${reset}	${blue}████████████████████████████████████████${reset}"
		echo "${green}██                                    ██${reset}	${blue}██                                    ██${reset}"
		echo "${green}██         NO errors detected.        ██${reset}	${blue}██       Time needed : $date       ██${reset}"
		echo "${green}██                                    ██${reset}	${blue}██                                    ██${reset}"
		echo "${green}████████████████████████████████████████${reset}	${blue}████████████████████████████████████████${reset}"
		echo
		echo "Terminated : $me"
	fi

	if [ "$noquit" -eq "1" ]; then
		echo
		echo "${blue}	█████████████████ NO exit activated ███████████████████${reset}"
		echo
		read -n 1 -s -r -p "Press any key to EXIT or press X to close this windows !"
		echo
		fi

	if [ "$debug" -eq "1" ]; then
		debug
		echo "${blue}		█████ DEBUG WAIT | Program finish. █████${reset}"
		echo
		sleep=3
		functionsleepbar
		echo
		read -n 1 -s -r -p "Press any key to EXIT or press X to close this windows !"
		echo
		fi

	echo
	echo "${green}	███████████████ Finish, quit in 3 seconds █████████████████${reset}"
	echo
	functionsmallbar
	echo
	sleep 0.5
	exit 0

## -------------------------===== Start of eula =====-------------------------

	End-user license agreement (eula)

 	JUST DO WHAT THE F*** YOU WANT WITH THE PUBLIC LICENSE
 	
 	Version 3.1415926532 (January 2022)
 	
 	TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
    	
	Everyone is permitted to copy and distribute verbatim or modified copies of
 	this license document.
 	
 	As is customary and in compliance with current global and interplanetary
 	regulations, the author of these pages disclaims all liability for the
 	consequences of the advice given here, in particular in the event of partial
 	or total destruction of the material, Loss of rights to the manufacturer
 	warranty, electrocution, drowning, divorce, civil war, the effects of radiation
 	due to atomic fission, unexpected tax recalls or encounters with
 	extraterrestrial beings elsewhere.
 	
 	YOU MUST ACCEPT THESES TERMS OR NOTHING WILL HAPPEN.
 	
 	LostByteSoft no copyright or copyleft we are in the center.
 	
 	You can send your request and your Christmas wishes to this address:
 	
 		Père Noël
 		Pôle Nord, Canada
 		H0H 0H0

## -------------------------===== End of file =====-------------------------
