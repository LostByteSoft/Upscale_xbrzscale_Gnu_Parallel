#!/bin/bash
#!/usr/bin/ffmpeg
## 005_leadin.sh
## -----===== Start of bash =====-----
	#printf '\033[8;40;80t'		# will resize the window, if needed.
	printf '\033[8;40;125t'		# will resize the window, if needed.
	#printf '\033[8;40;150t'	# will resize the window, if needed.
	#printf '\033[8;50;200t'	# will resize the window, if needed.
	sleep 0.50
	
echo -------------------------========================-------------------------
echo "Software lead-in."

	start=$SECONDS
	now=$(date +"%Y-%m-%d_%A_%H:%M:%S")
	echo "Current time : $now"
	red=`tput setaf 1`
	green=`tput setaf 2`
	yellow=`tput setaf 11`
	blue=`tput setaf 12`
	reset=`tput sgr0`
	random=$RANDOM

echo -------------------------========================-------------------------
echo "Common variables, you can changes theses variables as you wish to test (0 or 1)."

	autoquit=0	# autoquit anyway to script takes more than 2 min to complete
	debug=1		# test debug
	error=0		# test error
	part=0		# don't change this value
	NOquit=1	# No quit after all operations.

	echo autoquit=$autoquit debug=$debug error=$error part=$part NOquit=$NOquit random=$random

echo -------------------------========================-------------------------
	echo Version compiled on : Also serves as a version
	echo 2022-11-14_Monday_09:10:37
	echo
## Software name, what is this, version, informations.
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
	echo Images bigger than 10000x10000 create errors.
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
echo "Check installed requirements !"

if command -v xbrzscale >/dev/null 2>&1
	then
		echo "xbrzscale installed continue."
		dpkg -s xbrzscale | grep Version
	else
		echo "You don't have ' xbrzscale ' installed, now exit in 10 seconds."
		echo "Add with : sudo apt-get install xbrzscale"
		echo -------------------------========================-------------------------
		sleep 10
		exit
fi

if command -v imagemagick >/dev/null 2>&1
	then
		echo "You don't have ' imagemagick ' installed, now exit in 10 seconds."
		echo "Add with : sudo apt-get install imagemagick"
		echo -------------------------========================-------------------------
		sleep 10
		exit
	else
		echo "imagemagick installed continue."
		dpkg -s imagemagick | grep Version
fi

echo -------------------------========================-------------------------
## 007_func_all.sh
echo Function Debug. Activate via source program debug=1.

debug()
	if [ "$debug" -ge 1 ]; then
		echo
		echo "${yellow}█████████████████████████████████ DEBUG ██████████████████████████████████${reset}"
		echo
		echo autoquit=$autoquit debug=$debug error=$error NOquit=$NOquit count=$count part=$part
		echo
		echo cpu = $cpu defa = $defa defi = $defi defv = $defv defs = $defx defz = $defz
		echo
		echo file = $file
		echo
		echo Basedir = "$BASEDIR"
		echo 
		read -n 1 -s -r -p "Press any key to continue"
		echo
	fi
	
	if [ "$debug" -eq "1" ]; then
		echo
		echo "${yellow}██████████████████████████████ DEBUG ACTIVATED ███████████████████████████${reset}"
		echo
	fi

echo Function Error detector. If errorlevel is 1 or greater will show error msg.
error()
	if [ "$?" -ge 1 ]; then
		part=$((part+1))
		echo
		echo "${red}█████████████████████████████████ ERROR $part █████████████████████████████████${reset}"
		echo
		echo "!!! ERROR was detected !!! Press ANY key to try to CONTINUE !!! Will probably exit !!!"
		echo
		read -n 1 -s -r -p "Press any key to CONTINUE"
		echo
	fi

echo Function Auto Quit. If autoquit=1 will automaticly quit.
	if [ "$autoquit" -eq "1" ]; then
		echo
		echo "${blue}████████████████████████████ AUTO QUIT ACTIVATED █████████████████████████${reset}"
		echo
	fi

echo -------------------------========================-------------------------
## 030_zenity_folder.sh
echo "Select folder or filename using dialog !"

	#file="$(zenity --file-selection --filename=$HOME/ --title="Select a file, all format supported")"
	file=$(zenity  --file-selection --filename=$HOME/ --title="Choose a directory to convert all file" --directory)
	#file="/$HOME/Pictures/"
	#file="/$HOME/Downloads/"
	## --file-filter="*.jpg *.gif"

### file or folder
if test -z "$file"	## for cancel on zenity
	then
		echo "You don't have selected a file or folder !"
		echo -------------------------========================-------------------------
		echo
		echo "${yellow}█████████████████████ NO DATA TO PROCESS █████████████████████${reset}"
		echo
		read -n 1 -s -r -p "Press any key to EXIT"
		exit
	fi

count=`ls -1 "$file"/*.* 2>/dev/null | wc -l`
echo $count

if [ "$count" -eq 0 ]	## for n files in directory
	then
		echo "You don't have selected a file or folder !"
		echo -------------------------========================-------------------------
		echo
		echo "${yellow}█████████████████████ NO DATA TO PROCESS █████████████████████${reset}"
		echo
		read -n 1 -s -r -p "Press any key to EXIT"
		exit
	fi

	echo "You have selected :"
	echo "$file"

echo -------------------------========================-------------------------
## 050_input_output.sh
echo "Input name, directory and output name : (Debug helper)"
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
	
if [ "$debug" -eq "1" ]; then
		echo
		echo "${yellow}█████ DEBUG PAUSE █████${reset}"
		echo
		read -n 1 -s -r -p "Press ENTER key to continue !"
	fi
	
echo -------------------------========================-------------------------
## 051_all_lowercase.sh
echo "All lowercase for convert... (NOT activated, remove # to activate)"
	## This line put all lowercase FROM selected folder to the files names.
	#echo "cd "$file" && find . -name '*.*' -exec sh -c ' a=$(echo "$0" | sed -r "s/([^.]*)\$/\L\1/"); [ "$a" != "$0" ] && mv "$0" "$a" ' {} \;"
	#cd "$file" && find . -name '*.*' -exec sh -c ' a=$(echo "$0" | sed -r "s/([^.]*)\$/\L\1/"); [ "$a" != "$0" ] && mv "$0" "$a" ' {} \;

echo -------------------------========================-------------------------
## The code program.

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo "Numbers of xbrzscale scale_factor"
	#entry2=$(zenity --scale --value="3" --min-value="2" --max-value="6" --title "Numbers of xbrzscale scale_factor" --text "Numbers of xbrzscale scale_factor, 2 (lower) to 6 (bigger).\n\n\tSuggested default to 3.")

if test -z "$entry2"
	then
		echo "Default value of 3 will be used. Now continue."
		entry2=3
		echo "You have selected : $entry2"
		#sleep 3
	else
		echo "You have selected : $entry2"
fi

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
	echo Delete /dev/shm/findfolder.txt
	rm "/dev/shm/findfolder.txt" 2> /dev/null

## find files
part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
	echo Finding files...

	## Easy way to add a file format, copy paste a new line.
	echo "Will find files in sub folders too...."
	find "$file" -maxdepth 1 -name '*.avif'  >> "/dev/shm/findfolder.txt"
	find "$file" -maxdepth 1 -name '*.bmp'  >> "/dev/shm/findfolder.txt"
	find "$file" -maxdepth 1 -name '*.gif'  >> "/dev/shm/findfolder.txt"
	find "$file" -maxdepth 1 -name '*.jpeg'  >> "/dev/shm/findfolder.txt"
	find "$file" -maxdepth 1 -name '*.jpg'  >> "/dev/shm/findfolder.txt"
	find "$file" -maxdepth 1 -name '*.jpg_large'  >> "/dev/shm/findfolder.txt"
	find "$file" -maxdepth 1 -name '*.png'  >> "/dev/shm/findfolder.txt"
	find "$file" -maxdepth 1 -name '*.tif'  >> "/dev/shm/findfolder.txt"
	find "$file" -maxdepth 1 -name '*.tiff'  >> "/dev/shm/findfolder.txt"
	find "$file" -maxdepth 1 -name '*.webp'  >> "/dev/shm/findfolder.txt"
	
part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
	echo List files...
	cat "/dev/shm/findfolder.txt"
	
part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
	echo Finding finish, with file count :
	wc -l < "/dev/shm/findfolder.txt"

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"

	echo Conversion started...
	echo Simple convert 1 file at a time.
	{
	input="/dev/shm/findfolder.txt"
		while IFS= read -r "line"
		do
			conv=$((conv+1))
			echo Conversion number $conv
			echo "$line"
			echo xbrzscale $entry2 "$line" "$line"_UpScale.webp
			xbrzscale $entry2 "$line" "$line"_UpScale.jpg		## jpg format
			#xbrzscale $entry2 "$line" "$line"_UpScale.webp		## webp format
		done < "$input"
	}
	error $?

	part=$((part+1))
	echo "-------------------------===== Section $part =====-------------------------"

	echo "Reconvert (Yes or No (Suggest Yes))"
	if zenity --question --text="Do you want to reconvert to save space ?\n\n\t(Yes or No (Suggest Yes))"
	then
		part=$((part+1))
		echo "-------------------------===== Section $part =====-------------------------"
			echo Convert to jpg / webp, parallel REconversion.
			rm "/dev/shm/findparallel.txt" 2> /dev/null

		part=$((part+1))
		echo "-------------------------===== Section $part =====-------------------------"
			echo Find UpScaled files...
			echo "find "$file" -maxdepth 1 -iname 'UpScale'  >> "/dev/shm/findparallel.txt""
			## You can leave search for all type of files
			## find "/$HOME/Desktop" -maxdepth 1 -iname '*UpScale.webp'  >> "/dev/shm/findparallel.txt"
			find "$file" -maxdepth 1 -iname '*UpScale.webp'  >> "/dev/shm/findparallel.txt"	## webp
			find "$file" -maxdepth 1 -iname '*UpScale.jpg'  >> "/dev/shm/findparallel.txt"	## jpg
		
		part=$((part+1))
		echo "-------------------------===== Section $part =====-------------------------"	
			echo List UpScaled files...
			cat "/dev/shm/findparallel.txt"
		
		part=$((part+1))
		echo "-------------------------===== Section $part =====-------------------------"
			echo File count :
			wc -l < "/dev/shm/findparallel.txt"
		part=$((part+1))
		echo "-------------------------===== Section $part =====-------------------------"
		## convert to jpg or webp
			{
			input="/dev/shm/findparallel.txt"		## gedit "/dev/shm/findparallel.txt"
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

		part=$((part+1))
		echo "-------------------------===== Section $part =====-------------------------"
		echo "Not reconverted."

	fi
	error $?

	echo Conversion finish...

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo Move files to new folder?
	
	if zenity --question --text="Do you want to move files to $file/UpScale ? (Yes or No))"
	then
		part=$((part+1))
		echo "-------------------------===== Section $part =====-------------------------"
		echo Create folder...
		mkdir -p "$file"/UpScale
		echo Move files...
		echo "$file"/*_UpScale* "$file"/UpScale
		mv "$file"/*_UpScale* "$file"/UpScale	## mv /home/master/Downloads/*UpScale.jpg /home/master/Downloads$file/UpScale

	else
		part=$((part+1))
		echo "-------------------------===== Section $part =====-------------------------"
			echo "Files not moved."	
	fi
	error $?

echo -------------------------========================-------------------------
## 100_lead_out.sh
	
echo "Finish... with numbers of actions : $part"
	echo "This script take $(( SECONDS - start )) seconds to complete."
	date=$(date -d@$(( SECONDS - start )) -u +%H:%M:%S)
	echo "Time needed: $date"
	now=$(date +"%Y-%m-%d_%A_%I:%M:%S")
	echo "Current time : $now"

echo -------------------------========================-------------------------
## Press enter or auto-quit here.
	echo
	echo "If a script takes MORE than 120 seconds to complete it will ask"
	echo "you to press ENTER to terminate."
	echo
	echo "If a script takes LESS than 120 seconds to complete it will auto"
	echo "terminate after 10 seconds"
	echo

echo -------------------------========================-------------------------
## Exit, wait or auto-quit.
	echo
	echo Processing file or folder of "$name1" finish !
	echo
	debug $?

if [ "$NOquit" -eq "1" ]
	then
	echo "${yellow}████████████████████████████████ NO exit activated ██████████████████████████████████${reset}"
	read -n 1 -s -r -p "Press ENTER key to exit !"
	exit
	fi

if [ "$autoquit" -eq "1" ]
then
		echo "Script will auto quit in 1 seconds."
		echo
		echo "${blue}██████████████████████████████ Finish Now ████████████████████████████████${reset}"
		echo
		sleep 1
	else
	{
	if [ $(( SECONDS - start )) -gt 120 ]
		then
			echo "Script takes more than 120 seconds to complete."
			echo
			echo "${yellow}████████████████████████████████ Finish ██████████████████████████████████${reset}"
			echo
			echo -------------------------========================-------------------------
			read -n 1 -s -r -p "Press ENTER key to exit !"
		else
			echo "Script takes less than 120 seconds to complete."
			echo
			echo "${green}████████████████████████████████ Finish ██████████████████████████████████${reset}"
			echo
			echo -------------------------========================-------------------------
			echo "Auto-quit in 10 sec. (You can press X)"
			sleep 10
		fi
	}
	fi

	exit

## -----===== End of bash =====-----

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

## -----===== End of file =====-----

