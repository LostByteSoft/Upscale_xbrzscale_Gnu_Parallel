#!/bin/bash
#!/usr/bin/ffmpeg

	printf '\033[8;40;110t'		# will resize the window.

echo -------------------------===== Start of bash ====-------------------------

	start=$SECONDS
	now=$(date +"%Y-%m-%d_%A_%H:%M:%S")
	
	echo
	echo
	me="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
	echo "Running : $me"
	
	red=`tput setaf 1`
	green=`tput setaf 2`
	yellow=`tput setaf 11`
	blue=`tput setaf 12`
	orange=`tput setaf sgr9`
	reset=`tput sgr0`

	## General purposes variables. Needed before program to random variables.
	## All variables must be 0
	part=0		## don't change this value. (0)
	debug=0		## test debug. (0 or 1 debug mode)
	error=0		## test error. (0 or 1 make error)
	primeerror=0	## ending error detector
	
	## All variables must be 0 or 1
	automatic=0	## automatic without (at least minimal) dialog box.
	noquit=1	## noquit option. (0 or 1)

	## Auto-generated variables. Do not change
	random=$(shuf -i 4096-131072 -n 1)	# Used for temp folders. A big number hard to guess for security reasons.
	random2=$RANDOM

	echo
	echo "Software lead-in. LostByteSoft ; https://github.com/LostByteSoft"
	echo
	echo "NEVER remove dual ## in front of lines. Theses are code annotations."
	echo "You can test / remove single # for testing purpose."
	echo
	echo "Current time : $now"
	echo
	echo "Common variables, you can changes theses variables as you wish to test."
	echo "Debug data : debug=$debug error=$error part=$part noquit=$noquit random=$random random2=$random2 primeerror=$primeerror"
	me="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
	echo
	echo "Running job file :"
	echo
	echo $(dirname "$0")/$me
	echo

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo Specific softwares variables, you can change theses variables.
	echo
	echo automatic=0 , 0 or 1 , 0 deactivated , 1 activated
	automatic=0
	echo noquit=1 , 0 or 1 , 0 deactivated , 1 activated
	noquit=1
	echo
	debug=0
	echo
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

echo -------------------------========================-------------------------
	echo Version compiled on : Also serves as a version
	echo 2024-12-17_Tuesday_11:40:32
echo -------------------------========================-------------------------
echo "Color codes / Informations."
	echo
	echo  "${green}	████████████████     ALL OK / ACTIVE      ████████████████ ${reset}"
	echo   "${blue}	████████████████      INFORMATION(S)      ████████████████ ${reset}"
	echo "${yellow}	████████████████   ATTENTION / INACTIVE   ████████████████ ${reset}"
	echo    "${red}	████████████████   FATAL ERROR / OFFLINE  ████████████████ ${reset}"
	echo

echo -------------------------========================-------------------------
echo "Functions codes and color"
	echo
	echo 	"Function ${blue}█████${reset} Debug. Activate via source program debug=1."

	debug() {
		echo
		echo "Debug data : debug=$debug error=$error part=$part noquit=$noquit random=$random random2=$random2 automatic=$automatic primeerror=$primeerror"
		echo
		}

	if [ "$debug" -eq "1" ]; then
		echo
		echo "${blue}██████████████████████████████ DEBUG ACTIVATED AT START ███████████████████████████${reset}"
		echo
		fi

	echo 	"Function ${red}█████${reset} Error detector. Errorlevel show error msg."

	error()
	if [ "$?" -ge 1 ]; then
		noquit=1
		primeerror=$((primeerror+1))
		error=1
		echo
		echo "${red}█████████████████████████████████ ERROR $part █████████████████████████████████${reset}"
		echo
		echo "Debug data : debug=$debug error=$error part=$part noquit=$noquit random=$random random2=$random2 automatic=$automatic primeerror=$primeerror"
		echo
		echo "!!! ERROR was detected !!! Press ANY key to try to CONTINUE !!!"
		echo
		read -n 1 -s -r -p "Press any key to CONTINUE"
		echo
		fi

	if [ "$automatic" -eq "1" ]; then
		echo
		echo "${green}███████████████████████████ AUTOMATIC ACTIVATED ████████████████████████${reset}"
		echo
		fi

echo
part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
## Simple function small bar to wait 3 sec.
	## Version 1.03
	## Part of code came from here https://github.com/rabb1t/spinners , Created by Pavel Raykov aka 'rabbit' / 2018-11-08 (c)

	functionsmallbar()
		{
		if [ "$debug" -eq 0 ]; then
			#echo
			width=40
			perc=0
			speed="0.1" # seconds
			inc="$(echo "100/${width}" | bc -ql)"
			#echo -n "	Wake Up.. 0% "
			echo -n "	Wait... "

			while [ $width -ge 0 ]; do
				printf "\e[0;93;103m%s\e[0m %.0f%%" "0" "${perc}"
				sleep $speed
				let width--
				perc="$(echo "${perc}+${inc}" | bc -ql)"
		
				if [ ${perc%%.*} -lt 10 ]; then
					printf "\b\b\b"
				else
					printf "\b\b\b\b"
				fi
			done
			echo
		else
			echo ${blue} ████████████████████ DEBUG BYPASS ALL BARS ████████████████████${reset}
		fi
		}

## -------------------------========================-------------------------
## Simple function bar to TimeOut 12 sec.
	## Version 2.01

	functionfastbar() {
		if [ "$debug" -eq 0 ]; then
			echo -ne ${blue}'	TimeOut |                        |    (0%)\r'${reset}
			sleep 0.7
			echo -ne ${blue}'	TimeOut |  █                     |   (5%)\r'${reset}
			sleep 0.7
			echo -ne ${blue}'	TimeOut |  ██                    |   (10%)\r'${reset}
			sleep 0.7
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
			sleep 0.1
			echo -ne '\n'
		else
			echo ${blue} ████████████████████ DEBUG BYPASS functionfastbar ████████████████████${reset}
			sleep 1
		fi
		}
	echo Check installed requirements !
	echo
if command -v xbrzscale >/dev/null 2>&1
	then
		echo "xbrzscale installed continue."
		dpkg -s xbrzscale | grep Version
		echo "${green} ████████████████ OK ████████████████ ${reset}"
		echo
	else
		echo "You don't have ' xbrzscale ' installed, now exit in 10 seconds."
		echo "Add with : sudo apt-get install xbrzscale"
		echo
		echo "${red}████████████████ Dependency error ████████████████${reset}"
		echo
		read -n 1 -s -r -p "Press ENTER key to continue anyway (NOT a good idea) !"
		echo
	fi

if command -v imagemagick >/dev/null 2>&1
	then
		echo "You don't have ' imagemagick ' installed, now exit in 10 seconds."
		echo "Add with : sudo apt-get install imagemagick"
		echo
		echo "${red}████████████████ Dependency error ████████████████${reset}"
		echo
		read -n 1 -s -r -p "Press ENTER key to continue anyway (NOT a good idea) !"
		echo
	else
		echo "imagemagick installed continue."
		dpkg -s imagemagick | grep Version
		echo "${green} ████████████████ OK ████████████████ ${reset}"
		echo
	fi

	echo
echo -------------------------========================-------------------------
echo "Names not supported / Informations."
	echo
	echo "${blue}	████████████████████████████████████████████████████████████████${reset}"
	echo "		!!! NAMES starting with symbols are NOT SUPPORTED !!!"
	echo "${blue}	████████████████████████████████████████████████████████████████${reset}"
	echo

echo -------------------------========================-------------------------
echo "Select folder or filename using dialog !"
	echo

	#file="$(zenity --file-selection --filename=$HOME/ --title="Select a file, all format supported")"			## File select.
	file=$(zenity --file-selection --filename=$HOME/ --title="Choose a directory to convert all file" --directory)	## Directory select.
	## file="/$HOME/Pictures/"
	## file="/$HOME/Downloads/"
	## --file-filter="*.jpg *.gif"
	## --file-filter='*[WwEeBbPp] | *[JjPpGg]' 

	count=`ls -1 "$file" 2>/dev/null | wc -l`
	echo Count : $count
	echo "You have selected :"
	echo "$file"
	echo

### file or folder
	if test -z "$file"	## for cancel on zenity
		then
			echo "You click CANCEL !"
			echo
			echo -------------------------========================-------------------------
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
			echo -------------------------========================-------------------------
			echo
			echo "${yellow}█████████████████████ NO DATA TO PROCESS █████████████████████${reset}"
			echo
			read -n 1 -s -r -p "Press any key to EXIT"
			echo
			exit
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
echo "Job lock Ver 2,02"
	echo
	## local var
	runningjob=0
	#debug=1
	
	if [ -f /dev/shm/job.lock ]; then
		echo
		echo "${red} █████████ Lock-up already exist. Waiting for job finish. █████████ ${reset}"
		echo
		fi

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

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
	echo

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
		echo
		echo "Debug Unlock job"
		echo
		echo Debug job lock : choice = $choice runningjob = $runningjob
		echo
		read -n 1 -s -r -p "Press ENTER key to continue !"
		echo
		fi

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"

echo UpScale finder... Mover
	echo

	rm "/dev/shm/findups.txt" 2> /dev/null
	count=0
	count=`ls -1 "$file"/*UpScale.* 2>/dev/null | wc -l`
	echo
	echo UpScaled files search and count is : $count
	find "$file" -maxdepth 1 -iname "*UpScale.*"  >> "/dev/shm/findups.txt"
	#echo
	#cat "/dev/shm/findups.txt"
	
	if [ $count != 0 ]
		then
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
	#echo
	#cat "/dev/shm/findgif.txt"
	
	if [ $count != 0 ]
		then
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

echo -------------------------========================-------------------------
echo Avif finder... Mover / Converter
	echo

	rm "/dev/shm/findavif.txt" 2> /dev/null
	count=0
	count=`ls -1 "$file"/*.avif 2>/dev/null | wc -l`

	echo Avif files search and count is : $count
	find "$file" -maxdepth 1 -iname "*.avif"  >> "/dev/shm/findavif.txt"
	#echo
	#cat "/dev/shm/findavif.txt"
	
	if [ $count != 0 ]
		then
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

echo -------------------------========================-------------------------
echo Video finder... Mover
	echo
	
	## local var, resetted at end if not needed
	countfind=0
	rm "/dev/shm/findvideo.txt" 2> /dev/null

	find "$file" -maxdepth 1 -iname '*.MP4'  >> "/dev/shm/findvideo.txt"
	find "$file" -maxdepth 1 -iname '*.MKV'  >> "/dev/shm/findvideo.txt"
	find "$file" -maxdepth 1 -iname '*.WEBM'  >> "/dev/shm/findvideo.txt"
	find "$file" -maxdepth 1 -iname '*.AVI'  >> "/dev/shm/findvideo.txt"

	cat "/dev/shm/findvideo.txt"
	echo
	countfind=`ls -2 "/dev/shm/findvideo.txt" 2>/dev/null | wc -l`
	echo Video files search and count is : $countfind
	
	if [ $countfind != 0 ]
		then
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

	countfind=0
	rm "/dev/shm/findvideo.txt" 2> /dev/null
	error $?

echo -------------------------========================-------------------------
echo "The core/code program."
	echo
	## local var
	entry2=4
	debug_core=0

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
	
## -------------------------===== Separator =====-------------------------

echo "Numbers of xbrzscale scale_factor"
	echo

	while true;do functionfastbar ; done &
		entry2=$(zenity --timeout 11 --min-value="2" --scale --value="4"  --max-value="6" \
		--title "Numbers of xbrzscale scale_factor" --text "Numbers of xbrzscale scale_factor, 2 (lower) to 6 (bigger).\n\n\tSuggested default to 4 for best quality.")
		kill $!; trap 'kill $!' SIGTERM

	echo
	echo
	echo "Error level $?"

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

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo Delete /dev/shm/findimg.txt
	echo
	echo "/dev/shm/findimg.txt" 2> /dev/null
	rm "/dev/shm/findimg.txt" 2> /dev/null

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

	error $?

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo "xbrzscale upscale command"
	echo
	echo "Your command : xbrzscale $entry2 "$file" "XXX"_"$entry2"_UpScale.jpg"
	echo
	echo Conversion started...
	echo Simple convert 1 file at a time.
	{
	input="/dev/shm/findimg.txt"
		while IFS= read -r "line"
		do
			conv=$((conv+1))
			echo Conversion number $conv
			echo "$line"
			echo xbrzscale $entry2 "$line" "$line"_UpScale.jpg
			xbrzscale $entry2 "$line" "$line"_UpScale.jpg		## jpg format
			#xbrzscale $entry2 "$line" "$line"_UpScale.webp		## webp format
		done < "$input"
	}
	error $?

	part=$((part+1))
	echo "-------------------------===== Section $part =====-------------------------"

	echo "Reconvert (Yes or No (Suggest Yes))"
	if zenity --no-wrap --question --text="Do you want to reconvert to save space ?\n\n\t(Yes or No (Suggest Yes))"
		then
			echo Convert to jpg / webp, parallel REconversion. Find UpScaled files..
			rm "/dev/shm/findimg.txt" 2> /dev/null

			echo "find "$file" -maxdepth 1 -iname 'UpScale'  >> "/dev/shm/findimg.txt""
			## find "/$HOME/Desktop" -maxdepth 1 -iname '*UpScale.webp'  >> "/dev/shm/findimg.txt"
			#find "$file" -maxdepth 1 -iname '*UpScale.webp'  >> "/dev/shm/findimg.txt"	## webp
			find "$file" -maxdepth 1 -iname '*UpScale.jpg'  >> "/dev/shm/findimg.txt"		## jpg
			#cat "/dev/shm/findimg.txt"
			echo File count :
			wc -l < "/dev/shm/findimg.txt"
			echo

		part=$((part+1))
		echo "-------------------------===== Section $part =====-------------------------"
			echo Convert started...
			## convert to jpg or webp
			{
			input="/dev/shm/findimg.txt"		## gedit "/dev/shm/findimg.txt"
			while IFS= read -r "line"
			do
				conv=$((conv+1))
				echo Conversion number $conv
				echo "$line"
				#convert "$line" -define webp:lossless=true -format webp "$line"		## webp
				echo mogrify -format jpg -resize 95% "$line"
				mogrify -format jpg -resize 95% "$line"
				done < "$input"
			}

		else
			echo "Not reconverted."
			echo
	fi

	error $?
	echo Conversion finish...
	echo

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
	echo Move files to new folder?
	echo
	
	#if zenity --no-wrap --question --text="Do you want to move files to $file/UpScale ? (Yes or No))"
	#then
		part=$((part+1))
		echo "-------------------------===== Section $part =====-------------------------"
		echo Create folder...
		mkdir -p "$file"/UpScale
		echo Move files... to "$file"/UpScale
		#echo "$file"/*_UpScale* "$file"/UpScale
		mv "$file"/*_UpScale* "$file"/UpScale	## mv /home/master/Downloads/*UpScale.jpg /home/master/Downloads$file/UpScale
	#else
	#	part=$((part+1))
	#	echo "-------------------------===== Section $part =====-------------------------"
	#		echo "Files not moved."	
	#fi
	error $?

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo Verify numbers of files...
	## Variable
	subfolder=UpScale
	finaldir="$file"/"$subfolder"
	echo "Final dir : "$file"/"$subfolder""

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo Delete temp files :
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
echo "Software lead out."
	printf '\033[8;50;107t'		# will resize the window, 96 is minimum for exit box.
	echo
	echo "Debug data : debug=$debug error=$error part=$part noquit=$noquit random=$random random2=$random2 primeerror=$primeerror"
	echo
	echo "Finish... with numbers of actions : $part"
	echo "This script take $(( SECONDS - start )) seconds to complete."
	date=$(date -d@$(( SECONDS - start )) -u +%H:%M:%S)
	echo "Time needed: $date"
	now=$(date +"%Y-%m-%d_%A_%I:%M:%S")
	echo "Current time : $now"
	echo
	echo "$now" >>/dev/shm/logs.txt
	echo "	Time needed : $date" >>/dev/shm/logs.txt
	echo "	Debug software : $me" >>/dev/shm/logs.txt
	echo "	Debug data : debug=$debug error=$error part=$part noquit=$noquit random=$random random2=$random2 automatic=$automatic primeerror=$primeerror" >>/dev/shm/logs.txt
	echo "	File (If any used) : $file" >>/dev/shm/logs.txt
	echo " " >>/dev/shm/logs.txt

echo -------------------------===== End of Bash ======-------------------------
## Exit, wait or auto-quit.

	if [ "$primeerror" -ge "1" ]; then
		echo
		echo "	${red}████████████████████████████████████████████${reset}"
		echo "	${red}██                                        ██${reset}"
		echo "	${red}██           ERROR ERROR ERROR            ██${reset}"
		echo "	${red}██                                        ██${reset}"
		echo "	${red}████████████████████████████████████████████${reset}"
		echo
		echo "Numbers of error(s) : $primeerror"
		echo
		functionsmallbar
		echo
		read -n 1 -s -r -p "Press ENTER key to Continue !"
		echo
	else
		echo
		echo "	${green}████████████████████████████████████████${reset}	${blue}████████████████████████████████████████${reset}"
		echo "	${green}██                                    ██${reset}	${blue}██                                    ██${reset}"
		echo "	${green}██         NO errors detected.        ██${reset}	${blue}██       Time needed : $date       ██${reset}"
		echo "	${green}██                                    ██${reset}	${blue}██                                    ██${reset}"
		echo "	${green}████████████████████████████████████████${reset}	${blue}████████████████████████████████████████${reset}"
		echo
	fi

	if [ "$noquit" -eq "1" ]; then
		echo
		echo "${blue}	█████████████████ NO exit activated ███████████████████${reset}"
		echo
		read -n 1 -s -r -p "Press ENTER key to exit !"
		echo
		exit
		fi

	if [ "$debug" -eq "1" ]; then
		debug
		echo "${blue}		█████ DEBUG WAIT | Program finish. █████${reset}"
		echo
		read -n 1 -s -r -p "Press ENTER key to continue !"
		echo
		fi

	echo
	echo "${green}	███████████████ Finish, quit in 3 seconds █████████████████${reset}"
	sleep 0.5
	echo
	functionsmallbar
	echo
	sleep 1
	exit

## -----===== Start of eula =====-----

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

## -----===== End of file =====-----
