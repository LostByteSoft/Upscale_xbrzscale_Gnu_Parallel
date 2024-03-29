#!/bin/bash
#!/usr/bin/ffmpeg

	start=$SECONDS
	now=$(date +"%Y-%m-%d_%A_%H:%M:%S")

echo -------------------------===== Start of bash ====-------------------------
	#printf '\033[8;40;90t'		# will resize the window, if needed.
	printf '\033[8;40;100t'		# will resize the window, if needed.
	#printf '\033[8;40;130t'	# will resize the window, if needed.
	
	echo
	echo
	me="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
	echo "Running : $me"
	
	red=`tput setaf 1`
	green=`tput setaf 2`
	yellow=`tput setaf 11`
	blue=`tput setaf 12`
	reset=`tput sgr0`

	## General purposes variables. Watch before program to specific variables.
	## All variables must be 0 or 1
	debug=0		# test debug. (0 or 1 debug mode)
	error=0		# test error. (0 or 1 make error)
	primeerror=0

	## Auto-generated variables.
	random=$(shuf -i 4096-131072 -n 1)	# Used for temp folders. A big number hard to guess for security reasons.
	random2=$RANDOM
	part=0					# don't change this value. (0)
	
	echo
	echo "Software lead-in. LostByteSoft ; https://github.com/LostByteSoft"
	echo
	echo "NEVER remove dual ## in front of lines. Theses are code annotations."
	echo "You can test / remove single # for testing purpose."
	echo
	echo "Current time : $now"
	echo
	echo "Common variables, you can changes theses variables as you wish to test."
	echo "Debug data : debug=$debug error=$error part=$part noquit=$noquit random=$random random2=$random2"
	echo

echo -------------------------========================-------------------------
echo Specific softwares variables, you can change theses variables.
	echo
	echo automatic=0 , 0 or 1 , 0 deactivated , 1 activated
	automatic=0
	echo noquit=1 , 0 or 1 , 0 deactivated , 1 activated
	noquit=1
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
	echo 2024-03-11_Monday_08:06:56
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

	debug()
	if [ "$debug" -ge 1 ]; then
		echo
		echo "${blue}█████████████████████████████████ DEBUG ██████████████████████████████████${reset}"
		echo
		echo Debug data : debug=$debug error=$error noquit=$quit count=$count part=$part random=$random
		echo
		echo file = $file
		echo 
		read -n 1 -s -r -p "Press any key to continue"
		echo
	fi
	
	if [ "$debug" -eq "1" ]; then
		echo
		echo "${blue}██████████████████████████████ DEBUG ACTIVATED ███████████████████████████${reset}"
		echo
		echo "Debug data : debug=$debug error=$error part=$part noquit=$noquit random=$random"
		echo
	fi

	echo 	"Function ${red}█████${reset} Error detector. Errorlevel show error msg."

	error()
	if [ "$?" -ge 1 ]; then
		part=$((part+1))
		echo
		echo "${red}█████████████████████████████████ ERROR $part █████████████████████████████████${reset}"
		echo
		echo "!!! ERROR was detected !!! Press ANY key to try to CONTINUE !!!"
		echo
		#debug=0
		noquit=1
		primeerror=0
		read -n 1 -s -r -p "Press any key to CONTINUE"
		echo
	fi

	echo 	"Function ${green}█████${reset} Auto Quit. If autoquit=1 will automaticly quit."
	if [ "$autoquit" -eq "1" ]; then
		echo
		echo "${green}█████████████████████████ AUTO QUIT ACTIVATED █████████████████████████${reset}"
		echo
	fi
	echo

echo -------------------------========================-------------------------
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

if command -v parallel >/dev/null 2>&1
	then
		echo "Parallel installed continue."
		dpkg -s parallel | grep Version
		echo "${green} ████████████████ OK ████████████████ ${reset}"
		echo
	else
		echo "You don't have ' parallel ' installed, now exit in 10 seconds."
		echo "Add with : sudo apt-get install parallel"
		echo
		echo "${red}████████████████ Dependency error ████████████████${reset}"
		echo
		read -n 1 -s -r -p "Press ENTER key to continue anyway (NOT a good idea) !"
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
echo "Number of jobs processed concurrently at the same time ? (Refer as parallel CPU cores)"
	echo

	cpu=$(nproc)
	defx=$(( cpu / 2 ))	## for audio files
	defv=$(( cpu / 4 ))	## for video files
	defi=$(( cpu * 2 ))	## for images files
	defy=$(( cpu * 4 ))	## for images files
	defz=$(( cpu * 8 ))	## for images files

	## Put an # in front of "entry" to do an automatic choice.

if [ $automatic -eq 0 ]; then
	entry=$(zenity --scale --value="$cpu" --min-value="1" --max-value="$defz" --title "Convert files with Multi Cores Cpu" --text "How many cores do you want to use ? You have "$cpu" total cores !\n\n\tDefault suggested value is "$defv" for video.\n\n\tDefault suggested value is "$defx" for audio.\n\n\tDefault suggested value is ("$cpu" for xbrzscale) "$defi" for images.\n\n(1 to whatever core you want to use will work anyway !)")
	else
	entry=$cpu
	fi

if test -z "$entry"
	then
		echo "Default value of "$cpu" (Safe value) will be used. Now continue."
		entry=$cpu
		echo "You have selected : $entry"
		#sleep 3
	else
		echo "You have selected : $entry"
	fi

if [ "$entry" -ge $defi ]; then
	echo
	echo "${yellow}█████████████████████████ WARNING █████████████████████████${reset}"
	echo
	echo "!!! You have chosen a very high parallel work value, this may slow down the calculation rather than speed it up !!!"
	echo
	read -n 1 -s -r -p "Press any key to CONTINUE"
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
	countfind=0

	find "$file" -maxdepth 1 -iname '*.MP4'  >> "/dev/shm/findvideo.txt"
	find "$file" -maxdepth 1 -iname '*.MKV'  >> "/dev/shm/findvideo.txt"
	find "$file" -maxdepth 1 -iname '*.WEBM'  >> "/dev/shm/findvideo.txt"
	find "$file" -maxdepth 1 -iname '*.AVI'  >> "/dev/shm/findvideo.txt"

	cat "/dev/shm/findvideo.txt"
	echo
	countfind=`ls -1 "/dev/shm/findvideo.txt" 2>/dev/null | wc -l`
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
	
part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo "Numbers of xbrzscale scale_factor"
	entry2=$(zenity --min-value="2" --scale --value="3" --max-value="6" --title "Numbers of xbrzscale scale_factor" --text "Numbers of xbrzscale scale_factor, 2 (lower) to 6 (bigger).\n\n\tSuggested default to 3.")

if test -z "$entry2"
	then
		echo "Default value of 3 will be used."
		entry2=3
		echo "You have selected : $entry2"
	else
		echo "You have selected : $entry2"
	fi
	echo

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo Delete temp files :
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
	
	find "$file" -maxdepth 1 -iname '*.AVIF'  >> "/dev/shm/findimg.txt"
	find "$file" -maxdepth 1 -iname '*.BMP'  >> "/dev/shm/findimg.txt"
	find "$file" -maxdepth 1 -iname '*.GIF'  >> "/dev/shm/findimg.txt"
	find "$file" -maxdepth 1 -iname '*.JPEG'  >> "/dev/shm/findimg.txt"
	find "$file" -maxdepth 1 -iname '*.JPG'  >> "/dev/shm/findimg.txt"
	find "$file" -maxdepth 1 -iname '*.JPG_LARGE'  >> "/dev/shm/findimg.txt"
	find "$file" -maxdepth 1 -iname '*.PNG'  >> "/dev/shm/findimg.txt"
	find "$file" -maxdepth 1 -iname '*.TIF'  >> "/dev/shm/findimg.txt"
	find "$file" -maxdepth 1 -iname '*.TIFF'  >> "/dev/shm/findimg.txt"
	find "$file" -maxdepth 1 -iname '*.WEBP'  >> "/dev/shm/findimg.txt"
	find "$file" -maxdepth 1 -iname '*.OPDOWNLOAD'  >> "/dev/shm/findimg.txt"
	echo
	error $?

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
echo UpScale, Conversion started...
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
	echo
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
			#parallel -a "/dev/shm/findimg.txt" -j $defi mogrify -depth 32 -format webp		## webp
			parallel -a "/dev/shm/findimg.txt" -j $defi mogrify -format jpg -resize 95% -quality 90	## jpg
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
			echo "Defined automatically by # of core of the processor."
			echo
			#parallel -a "/dev/shm/findimg.txt" -j $defi mogrify -define webp:lossless=true -format webp	## webp lossy
			#parallel -a "/dev/shm/findimg.txt" -j $defi mogrify -depth 32 -format webp		## webp
			parallel -a "/dev/shm/findimg.txt" -j $defi mogrify -format jpg -resize 95% -quality 90	## jpg
			rm "/dev/shm/findimg.txt" 2> /dev/null
			echo Conversion finish...
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
		#echo '$'file/*_UpScale* '$file'/UpScale
		mv "$file"/*_UpScale* "$file"/UpScale
	#else
	#	part=$((part+1))
	#	echo "-------------------------===== Section $part =====-------------------------"
	#		echo "Files not moved."	
	#fi
	error $?
	echo

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
		echo "Debug data : autoquit=$autoquit debug=$debug error=$error part=$part noquit=$noquit random=$random"
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
	#echo Count1 = $count1 Count2 = $count2
	echo
	echo "The answer is .... :"
	
	if [ "$count2" -ne 0 ]; then
		if [ "$count1" = "$count2" ]; then
			echo
			echo "		${green}████████████████████████████████████████${reset}"
			echo "		${green}██                                    ██${reset}"
			echo "		${green}██     Numbers of files are EQUAL     ██${reset}"
			echo "		${green}██                                    ██${reset}"
			echo "		${green}████████████████████████████████████████${reset}"
		else
			echo
			echo "		${red}████████████████████████████████████████████${reset}"
			echo "		${red}██                                        ██${reset}"
			echo "		${red}██     Numbers of files are NOT EQUAL     ██${reset}"
			echo "		${red}██                                        ██${reset}"
			echo "		${red}████████████████████████████████████████████${reset}"
			echo
			
			noquit=1	# No quit after detecting an error.
			#debug=1	# Debug if numbers of files are not equal
			echo
			rm "/dev/shm/file1.txt" 2> /dev/null
			rm "/dev/shm/file2.txt" 2> /dev/null
			rm "/dev/shm/file11.txt" 2> /dev/null
			rm "/dev/shm/file22.txt" 2> /dev/null
			echo

		## fi after files check if numbers are not equal
## -------------------------========================-------------------------
## Finding files... if not equal
	#echo "Will NOT find files in sub folders..."
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
			echo "${red} ███████████████ VERIFY FILES ███████████████ ${reset}"
			fi
		if [ "$active" -eq "0" ]
			then
			echo
			echo "${green} ██████████████████████████████ ${reset}"
			fi
		#echo Remove temp files...
		rm "/dev/shm/file1.txt" 2> /dev/null
		rm "/dev/shm/file2.txt" 2> /dev/null
		rm "/dev/shm/file11.txt" 2> /dev/null
		rm "/dev/shm/file22.txt" 2> /dev/null		
	## ending of if
	fi
	fi
	echo

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"

	if [ "$debug" -eq "1" ]; then
		echo
		echo "${blue}		█████ DEBUG WAIT , end compare !█████${reset}"
		echo
		echo "Debug data : autoquit=$autoquit debug=$debug error=$error part=$part noquit=$noquit random=$random"
		echo
		read -n 1 -s -r -p "Press ENTER key to continue !"
		echo
	fi
echo "Software lead out."
	echo
	echo "Debug data : autoquit=$autoquit debug=$debug error=$error part=$part noquit=$noquit random=$random random2=$random2 wol=$wol automatic=$automatic"
	echo
	echo "Debug wol : trywolmaster=$trywolmaster trywolserver=$trywolserver trywolacer=$trywolacer trywollenovo=$trywollenovo"
	echo
	echo "Debug active : activemaster=$activemaster activeserver=$activeserver activeacer=$activeacer activelenovo=$activelenovo"
	echo
	echo "Finish... with numbers of actions : $part"
	echo "This script take $(( SECONDS - start )) seconds to complete."
	date=$(date -d@$(( SECONDS - start )) -u +%H:%M:%S)
	echo "Time needed: $date"
	now=$(date +"%Y-%m-%d_%A_%I:%M:%S")
	echo "Current time : $now"
	echo

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
		echo "Numbers of error(s) : $primeerrors"
		echo
		functionsmallbar
		echo
		read -n 1 -s -r -p "Press ENTER key to Continue !"
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
		echo
		echo "${blue}		█████ DEBUG WAIT | Program finish. █████${reset}"
		echo
		echo "Debug data : autoquit=$autoquit debug=$debug error=$error part=$part noquit=$noquit random=$random random2=$random2 wol=$wol automatic=$automatic"
		echo
		read -n 1 -s -r -p "Press ENTER key to continue !"
		echo
		fi

	echo
	echo "${green}	███████████████ Finish, quit in 3 seconds █████████████████${reset}"
	sleep 2
	echo
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
