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
	debug=0		# test debug
	error=0		# test error
	part=0		# don't change this value
	NOquit=1	# No quit after all operations.

	echo autoquit=$autoquit debug=$debug error=$error part=$part NOquit=$NOquit random=$random

echo -------------------------========================-------------------------
	echo Version compiled on : Also serves as a version
	echo 2022-11-14_Monday_09:24:56
	echo
## Software name, what is this, version, informations.
	echo "Software name: Cluster Image Upscaler"
	echo 
	echo "File name : Convert All Folder to xbrzscale (cluster).sh"
	echo
	echo "What it does ? Upscale an image with clusters computers."
	echo "It's NOT an increase size but a real UPSCALE"
	echo
	echo "Read me for this file (and known bugs) :"
	echo "Video conversion requires a lot of computing power, reduce the parallel"
	echo "conversion of real cores divided by two... at least."
	echo "ONE compression per computer compression is even recommended."
	echo
	echo "https://bash-prompt.net/guides/gnu-parallel-multi-server/"
	echo
	echo "Use xbrzscale : https://github.com/atheros/xbrzscale"
	echo "Use Imagemagick : https://imagemagick.org/index.php"
	echo "Use Gnu Parallel : https://www.gnu.org/software/parallel/"
	echo "Use rsync : https://rsync.samba.org/"
	echo
	echo "Can also use:"
	echo "Use 7z : https://www.7-zip.org/download.html"
	echo "Use ffmpeg : https://ffmpeg.org/ffmpeg.html"
	echo
	echo "Informations : (EULA at the end of file, open in text.)"
	echo "By LostByteSoft, no copyright or copyleft. https://github.com/LostByteSoft"
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

if command -v parallel >/dev/null 2>&1
	then
		echo "Parallel installed continue."
		dpkg -s parallel | grep Version
	else
		echo "You don't have ' parallel ' installed, now exit in 10 seconds."
		echo "Add with : sudo apt-get install parallel"
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

if command -v rsync >/dev/null 2>&1
	then
		echo "rsync installed continue."
		dpkg -s rsync | grep Version
	else
		echo "You don't have ' rsync ' installed, now exit in 10 seconds."
		echo "Add with : sudo apt-get install rsync"
		echo -------------------------========================-------------------------
		sleep 10
		exit
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
## 070_Create_nodes.sh
echo "Create nodes... (No need for external file)"
	echo
	echo Check if all cores requested are active. Will remove inactive.
	echo
	echo Known nodes ONLY.
	echo

namepc1=Master
timeout 1 bash -c "</dev/tcp/192.168.0.75/22"
	active=$(echo $?)
	#echo $active
	if [ "$active" -eq "0" ]
		then
		echo "${green} █████████████████████████ $namepc1 ACTIVE █████████████████████████ ${reset}"
		cluster1="-S 8/master@192.168.0.75"
		fi
	if [ "$active" -ge "1" ]
		then
		echo "${red} █████████████████████████ $namepc1 OFFLINE █████████████████████████ ${reset}"
		fi

echo
namepc2=Server
timeout 1 bash -c "</dev/tcp/192.168.0.25/22"
	active=$(echo $?)
	#echo $active
	if [ "$active" -eq "0" ]
		then
		echo "${green} █████████████████████████ $namepc2 ACTIVE █████████████████████████ ${reset}"
		cluster2="-S 4/server@192.168.0.25"
		fi
	if [ "$active" -ge "1" ]
		then
		echo "${red} █████████████████████████ $namepc2 OFFLINE █████████████████████████ ${reset}"
		fi
echo
namepc3=Acer
timeout 1 bash -c "</dev/tcp/192.168.0.40/22"
	active=$(echo $?)
	#echo $active
	if [ "$active" -eq "0" ]
		then
		echo "${green} █████████████████████████ $namepc3 ACTIVE █████████████████████████ ${reset}"
		cluster3="-S 4/acer@192.168.0.40"
		fi
	if [ "$active" -ge "1" ]
		then
		echo "${red} █████████████████████████ $namepc3 OFFLINE █████████████████████████ ${reset}"
		fi
echo
namepc4=Asus
timeout 1 bash -c "</dev/tcp/192.168.0.30/22"
	active=$(echo $?)
	#echo $active
	if [ "$active" -eq "0" ]
		then
		echo "${green} █████████████████████████ $namepc4 ACTIVE █████████████████████████ ${reset}"
		cluster4="-S 2/asus@192.168.0.30"
		fi
	if [ "$active" -ge "1" ]
		then
		echo "${red} █████████████████████████ $namepc4 OFFLINE █████████████████████████ ${reset}"
		fi

## Add new nodes here

	cluster=""$cluster1" "$cluster2" "$cluster3" "$cluster4""
	echo
	echo Created cluster = "$cluster"
	echo

if [ "$debug" -eq "1" ]; then
		echo
		echo "${yellow}█████ DEBUG PAUSE █████${reset}"
		echo
		read -n 1 -s -r -p "Press ENTER key to continue !"
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
## 060_findgif_move.sh
echo Gif finder... Mover

	count=0
	rm "/dev/shm/findgif.txt" 2> /dev/null

count=`ls -1 "$file"/*gif* 2>/dev/null | wc -l`
	echo GIF files search and count is : $count
	if [ $count != 0 ]
	then
	cd "$file" && find -name "*gif*"  >> "/dev/shm/findgif.txt"
	cat "/dev/shm/findgif.txt"
	if zenity --question --text="Gif files detected, do you want to MOVE them to "$HOME"/Desktop ?\n\n\tFiles are NOT JPG compatibles / UpScalables."
		then
			echo Moving files...
			#cd "$file" && find -name "*gif*"  >> "/dev/shm/findgif.txt"
			#cat "/dev/shm/findgif.txt"
			echo
			
		{
		input="/dev/shm/findgif.txt"
		while IFS= read -r "line"
		do
		echo Output : "$HOME/Desktop/"$line""
		mv  "$line" "$HOME"/Desktop/""
		done < "$input"
		}
		sleep 1
	fi
	fi
	error $?

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
	else
		echo "You have selected : $entry2"
fi

	#part=$((part+1))
	#echo "-------------------------===== Section $part =====-------------------------"
	#echo "Create nodes... (No need for external file)"

	#cluster="-S 10/master@192.168.0.75 -S 6/server@192.168.0.25 -S 6/acer@192.168.0.40 -S 2/asus@192.168.0.30"
	#echo $cluster

	#part=$((part+1))
	#echo "-------------------------===== Section $part =====-------------------------"
	#echo Check if all cores requested is active.
	#echo
	#cat node-jpg.txt
	#echo Requested clusters : "$cluster"
	#echo
	#parallel --sshloginfile node-jpg.txt echo "Number {}: Running on \`hostname\`" ::: 1 2 3 4
	#echo parallel --sshloginfile ""$cluster"" echo "Number {}: Running on \`hostname\`" ::: 1 2 3 4
	#parallel ""$cluster"" echo "Active Clusters : Number {}: Running on \`hostname\`" ::: 1 2 3 4
	#echo
	#read -n 1 -s -r -p "Press ENTER key to continue !"

part=$((part+1))
	echo "-------------------------===== Section $part =====-------------------------"
	echo Finding files...
	rm "/dev/shm/findimg.txt" 2> /dev/null

	## Easy way to add a file format, copy paste a new line.
	echo "Will NOT find files in sub folders... Remove -maxdepth 1 to search subfolders."
	find "$file" -maxdepth 1 -name '*.avif'  >> "/dev/shm/findimg.txt"
	find "$file" -maxdepth 1 -name '*.bmp'  >> "/dev/shm/findimg.txt"
	find "$file" -maxdepth 1 -name '*.gif'  >> "/dev/shm/findimg.txt"
	find "$file" -maxdepth 1 -name '*.jpeg'  >> "/dev/shm/findimg.txt"
	find "$file" -maxdepth 1 -name '*.jpg'  >> "/dev/shm/findimg.txt"
	find "$file" -maxdepth 1 -name '*.jpg_large'  >> "/dev/shm/findimg.txt"
	find "$file" -maxdepth 1 -name '*.png'  >> "/dev/shm/findimg.txt"
	find "$file" -maxdepth 1 -name '*.tif'  >> "/dev/shm/findimg.txt"
	find "$file" -maxdepth 1 -name '*.tiff'  >> "/dev/shm/findimg.txt"
	find "$file" -maxdepth 1 -name '*.webp'  >> "/dev/shm/findimg.txt"
	
	part=$((part+1))
	echo "-------------------------===== Section $part =====-------------------------"
	echo show finded files... from /dev/shm/findimg.txt	
	#cat "/dev/shm/findimg.txt"

	part=$((part+1))
	echo "-------------------------===== Section $part =====-------------------------"
	echo Finding finish, with file count :
	wc -l < "/dev/shm/findimg.txt"

	part=$((part+1))
	echo "-------------------------===== Section $part =====-------------------------"
	echo Compress by lan cores.
	echo
	echo "Node / Jobs / Complete / % of Jobs / Time"
	echo
	## https://github.com/anbox/anbox/issues/1680
	## https://stackoverflow.com/questions/626533/how-can-i-ssh-directly-to-a-particular-directory
	#cd "$file" && ls *.* | parallel --sshloginfile "$BASEDIR"/node-jpg.txt --eta --workdir /dev/shm --transfer 'export DISPLAY=:0.0 && xbrzscale 2 {} {.}_UpScale.jpg'
	#cd "$file" && ls *.* | parallel --sshloginfile "$BASEDIR"/node-webp.txt --eta --workdir /dev/shm --transfer 'export DISPLAY=:0.0 && xbrzscale 2 {} {.}_UpScale.webp'
	
	# Could NOT send variables to ssh commands, must by hard coded values (ie: 2 3 4 5 6)
	
	if [ "$entry2" -eq 2 ]; then
	echo xbrzscale scale_factor 2
	cd "$file" && ls *.* | parallel ""$cluster"" --eta --workdir /dev/shm --transfer 'export DISPLAY=:0.0 && xbrzscale 2 {} {.}_UpScale.jpg'
	fi
	
	if [ "$entry2" -eq 3 ]; then
	echo xbrzscale scale_factor 3
	cd "$file" && ls *.* | parallel ""$cluster"" --eta --workdir /dev/shm --transfer 'export DISPLAY=:0.0 && xbrzscale 3 {} {.}_UpScale.jpg'
	fi	
	
	if [ "$entry2" -eq 4 ]; then
	echo xbrzscale scale_factor 4
	cd "$file" && ls *.* | parallel ""$cluster"" --eta --workdir /dev/shm --transfer 'export DISPLAY=:0.0 && xbrzscale 4 {} {.}_UpScale.jpg'
	fi
	
	if [ "$entry2" -eq 5 ]; then
	echo xbrzscale scale_factor 5
	cd "$file" && ls *.* | parallel ""$cluster"" --eta --workdir /dev/shm --transfer 'export DISPLAY=:0.0 && xbrzscale 5 {} {.}_UpScale.jpg'
	fi	
	
	if [ "$entry2" -eq 6 ]; then
	echo xbrzscale scale_factor 6
	cd "$file" && ls *.* | parallel ""$cluster"" --eta --workdir /dev/shm --transfer 'export DISPLAY=:0.0 && xbrzscale 6 {} {.}_UpScale.jpg'
	fi
	
	echo
	error $?
	
	## –eta Print status information as the jobs are run.
	## –trc t transfer the files, r return the completed file and c cleanup the server.
	## -S 2/server@192.168.0.25
	## --sshloginfile nodeaudio.txt

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo "Reconvert (Yes or No (Suggest Yes))"
	#if zenity --question --text="Do you want to reconvert to save space ? (Yes or No (Suggest Yes))"
	#then
	
	#echo Simple Reconvert... with parallel send to nodes
		#parallel ::: "ssh server@192.168.0.25 'cd /dev/shm; PATH=/bin; mogrify *UpScale.jpg -resize 95%'" \
		#"ssh asus@192.168.0.30 'cd /dev/shm; PATH=/bin; mogrify *UpScale.jpg -resize 95%'" \
		#"ssh acer@192.168.0.40 'cd /dev/shm; PATH=/bin; mogrify *UpScale.jpg -resize 95%'" \
		#"ssh master@192.168.0.75 'cd /dev/shm; PATH=/bin; mogrify *UpScale.jpg -resize 95%'"	

	echo Parallel Reconvert...
		##ls *UpScale.jpg > ups.txt; parallel -a ups.txt mogrify {} -format jpg -resize 95%	## work on term
		parallel ::: \
		"ssh server@192.168.0.25 'echo Server; cd /dev/shm/; ls 2>/dev/null *UpScale.jpg > ser.txt; parallel -a ser.txt mogrify -format jpg -resize 95% 2> /dev/null'" \
		"ssh asus@192.168.0.30 'echo Asus; cd /dev/shm/; ls 2>/dev/null *UpScale.jpg > asu.txt; parallel -a asu.txt mogrify -format jpg -resize 95% 2> /dev/null'" \
		"ssh acer@192.168.0.40 'echo Acer; cd /dev/shm/; ls 2>/dev/null *UpScale.jpg > ace.txt; parallel -a ace.txt mogrify -format jpg -resize 95% 2> /dev/null'" \
		"ssh master@192.168.0.75 'echo Master; cd /dev/shm/; ls 2>/dev/null *UpScale.jpg > mas.txt; parallel -a mas.txt mogrify -format jpg -resize 95% 2> /dev/null'"
		echo Reconvert finish...

	#else
	#	part=$((part+1))
	#	echo "-------------------------===== Section $part =====-------------------------"
	#	echo "Not reconverted."
	#fi
	error $?

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo Make folders sub...

	## Variable
	ext=UpScale
	subfolder=UpScale
	finaldir="$file""$subfolder"
	echo "Final dir : "$file""$subfolder""
	
	echo Make dir...
	echo mkdir -p """$file"/"$subfolder"
	mkdir -p """$file"/"$subfolder"
	echo

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
## 085_reget_xbr.sh
echo Reget files...

if [ "$debug" -eq "1" ]; then
		echo
		echo "${yellow}█████ DEBUG PAUSE █████${reset}"
		echo
		read -n 1 -s -r -p "Press ENTER key to continue !"
		echo
	fi

	echo "ReGet files one server at a time... (Slower , No ReGet if no files , no overload lan)"
		#echo Server , files are present :
		numserver=0
		numasus=0
		numacer=0
		nummaster=0
		echo
		nummaster="$(ssh master@192.168.0.75 'ls 2>/dev/null /dev/shm/*UpScale.jpg | wc -l && exit ; exec bash --login')"
			echo Files on Master : $master
			if [ "$nummaster" -ge 1 ]; then
			echo "Files are UpLoaded !"
			rsync -ahvzP master@192.168.0.75:/dev/shm/*UpScale.jpg """$file""/$subfolder" 2> /dev/null	## work
		fi
		echo
		numserver="$(ssh server@192.168.0.25 'ls 2>/dev/null /dev/shm/*UpScale.jpg | wc -l && exit ; exec bash --login')"
			echo Files on Server : $server
			if [ "$numserver" -ge 1 ]; then
			echo "Files are UpLoaded !"
			rsync -ahvzP server@192.168.0.25:/dev/shm/*UpScale.jpg """$file""/$subfolder"			## work
		fi
		echo
		numasus="$(ssh asus@192.168.0.30 'ls 2>/dev/null /dev/shm/*UpScale.jpg | wc -l && exit ; exec bash --login')"
			echo Files on Asus : $asus
			if [ "$numasus" -ge 1 ]; then
			echo "Files are UpLoaded !"
			rsync -ahvzP asus@192.168.0.30:/dev/shm/*UpScale.jpg """$file""/$subfolder" 			## work
		fi
		echo
		numacer="$(ssh acer@192.168.0.40 'ls 2>/dev/null /dev/shm/*UpScale.jpg | wc -l && exit ; exec bash --login')"
			echo Files on Acer : $acer
			if [ "$numacer" -ge 1 ]; then
			echo "Files are UpLoaded !"
			rsync -ahvzP acer@192.168.0.40:/dev/shm/*UpScale.jpg """$file""/$subfolder"			## work
		fi

		error $?
		##echo server = $server asus = $asus acer = $acer master = $master

	#echo "ReGet files one server at a time... (Slower , no overload lan)"
		#echo master...
		#rsync -ahvzP master@192.168.0.75:/dev/shm/*$ext* """$file""/$subfolder" 2> /dev/null"	## work
		#echo Server...
		#rsync -ahvzP server@192.168.0.25:/dev/shm/*$ext* """$file""/$subfolder" 2> /dev/null"	## work
		#echo acer...
		#rsync -ahvzP acer@192.168.0.40:/dev/shm/*$ext* """$file""/$subfolder" 2> /dev/null"	## work
		#echo asus...
		#rsync -ahvzP asus@192.168.0.30:/dev/shm/*$ext* """$file""/$subfolder" 2> /dev/null"	## work
		# exemple : rsync -chavzP
		#error $?

	#echo "ReGet files in parallel... (Faster , overload lan very fast)"
		## "(NOT working with space in folder name, copy to dev/shm first), Parallel doesn't like spaces"
		#echo
		#echo "server@192.168.0.25:* master@192.168.0.75:* acer@192.168.0.40:* asus@192.168.0.30:*"
		#echo
		## ssh -t server@192.168.0.25 "cd /dev/shm ; bash --login" ## ssh -t acer@192.168.0.40 "cd /dev/shm ; bash --login"
		## ssh-t master@192.168.0.75 "cd /dev/shm ; bash --login" ## ssh -t asus@192.168.0.30 "cd /dev/shm ; bash --login"
		#parallel ::: "rsync -ahvzP server@192.168.0.25:/dev/shm/*$ext* /dev/shm 2> /dev/null" \
		#"rsync -ahvzP acer@192.168.0.40:/dev/shm/*$ext* /dev/shm 2> /dev/null" "rsync -avhP asus@192.168.0.30:/dev/shm/*"$ext"* /dev/shm 2> /dev/null"

	# exemple : rsync -caP --stats		# -achPz	# https://www.computerhope.com/unix/rsync.htm
	# -a ; archive mode; equals -rlptgoD (no -H,-A,-X)	# -c ; skip based on checksum, not mod-time & size	# -h ; output numbers in a human-readable format
	# -P ; show progress during transfer , same as --partial --progress	# -v ; increase verbosity	# -z ; compress file data during the transfer

echo -------------------------========================-------------------------
## 095_del_images.sh
echo Erase images temp files on nodes...

if [ "$debug" -eq "1" ]; then
		echo
		echo "${yellow}█████ DEBUG PAUSE █████${reset}"
		echo
		read -n 1 -s -r -p "Press ENTER key to continue !"
		echo
	fi

	#if zenity --question --text="!!! DANGER !!! Delete temp files on nodes servers ? (Could be dangerous)\n\n\t!!! Be sure NO jobs are active !!!"
		#then
			## Don't play stupid ; don't do *.*
			#	echo
			#	echo ssh server@192.168.0.25 'rm /temp/pic/'
			#	ssh server@192.168.0.25 'rm /dev/shm/*.jpg 2> /dev/null'
			#	ssh server@192.168.0.25 'rm /dev/shm/*.webp 2> /dev/null'
			#	echo
			#	echo ssh asus@192.168.0.30 'rm /temp/pic/'
			#	ssh asus@192.168.0.30 'rm /dev/shm/*.jpg 2> /dev/null'
			#	ssh asus@192.168.0.30 'rm /dev/shm/*.webp 2> /dev/null'
			#	echo
			#	echo ssh acer@192.168.0.40 'rm /temp/pic/'
			#	ssh acer@192.168.0.40 'rm /dev/shm/*.jpg 2> /dev/null'
			#	ssh acer@192.168.0.40 'rm /dev/shm/*.webp 2> /dev/null'
			#	echo
			#	echo ssh master@192.168.0.75 'rm /temp/pic/'
			#	ssh master@192.168.0.75 'rm /dev/shm/*.jpg 2> /dev/null'
			#	ssh master@192.168.0.75 'rm /dev/shm/*.webp 2> /dev/null'
			#	echo

echo Parallel erase...
	echo "server@192.168.0.25 'rm' asus@192.168.0.30 'rm' acer@192.168.0.40 'rm' master@192.168.0.75 'rm'"

	parallel ::: "ssh server@192.168.0.25 'rm /dev/shm/*.jpg 2> /dev/null'" "ssh asus@192.168.0.30 'rm /dev/shm/*.jpg 2> /dev/null'" \
	"ssh acer@192.168.0.40 'rm /dev/shm/*.jpg 2> /dev/null'" "ssh master@192.168.0.75 'rm /dev/shm/*.jpg 2> /dev/null'"

	parallel ::: "ssh server@192.168.0.25 'rm /dev/shm/*.png 2> /dev/null'" "ssh asus@192.168.0.30 'rm /dev/shm/*.png 2> /dev/null'" \
	"ssh acer@192.168.0.40 'rm /dev/shm/*.png 2> /dev/null'" "ssh master@192.168.0.75 'rm /dev/shm/*.png 2> /dev/null'"
	
	parallel ::: "ssh server@192.168.0.25 'rm /dev/shm/*.webp 2> /dev/null'" "ssh asus@192.168.0.30 'rm /dev/shm/*.webp 2> /dev/null'" \
	"ssh acer@192.168.0.40 'rm /dev/shm/*.webp 2> /dev/null'" "ssh master@192.168.0.75 'rm /dev/shm/*.webp 2> /dev/null'"

		#else
		#	echo	
		#	echo "${red}   ████████████████████████████████████████████████${reset}"
		#	echo "   YOU NEED TO CLEANUP FILES MANUALLY ON EACH NODES"
		#	echo "${red}   ████████████████████████████████████████████████${reset}"
		#	echo
		#	sleep 2
		#fi

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

