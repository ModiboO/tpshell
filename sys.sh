#!/bin/bash

clear
sleep 10 
echo " Fais par : Modibo ousmanou"
echo "  matricule : 14A363FS"
echo " "  
echo "BIENVENUE SUR MON PROJET SYS"
echo " "
echo "CHOISIR L'OPTION A EXECUTER" 
echo " "                                                                     
echo "         a) Informations sur les utilisateurs enregistrés il ya 3 jours          "
echo " " 
echo "         b) acquisition, installation et lancement de l'environement xampp        "
echo " " 
echo "         c) archivage des eléments du repertoire personnel qui ont été modifié  par  le sudoer il ya 2 jours"
echo " " 
echo "         d) informations d'utilisation du disque, de la memoire du processeur et du swap"
echo " " 
echo "         quitter(Q/q) "

           

       
read -r Modibo

case $Modibo in 
	

	'a') cut -d : -f 1 /etc/passwd>all_user
	

	ls /home>user_foders
	
	while read line 
	do
		while read line1
		do	
		if [ $line == $line1 ] ; then 
		echo $line1>user1
		fi
		done<user_foders
	done<all_users
	find /home/* -type d -ctime 3 -print>userx

	while read line1
	do
	   while read user
	   do 
	      if [ $line1 == '/home/'$user ] ; then 
		echo $user >3days_user.txt
		echo " a été créé il y a 3 jours."
	      fi

	    done<user1 
	done<userx
	cat 3days_users.txt
	
 ;;
	'b') echo "XAMPP"
	 wget https://downloadsapachefriends.global.ssl.fastly.net/xampp-files/5.6.30/xampp-linux-x64-5.6.30-1-installer.run?from_af=true
	 ./xampp-linux-x64-5.6.30-1-installer.run
	 sudo su
	/opt/lampp/lampp start


;;
	'c') echo "ARCHIVAGE"
	mkdir -p /home/seed/archive
	find /home/seed/ -type f -mtime 2 -print>/home/seed/ficmodi
	while read line
	do
	cp $line archive
	done </home/seed/ficmodi
	tar -czvf archive.tar.gz archive
	mv archive.tar.gz /media/seed/usb/*/archive.tar.gz
	;;
	'd') echo "Infos sur l'utilisation du disque, de la memoire et du swap :"
		df -h |grep /dev/sd
		free -h 
;;
	* )  exit;;
	
esac