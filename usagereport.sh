#!/bin/bash
# Funtion:  create disk usage report
# Arguments:    NON
# Author: Christian & Benjo
# Copyright:    2017 Christian & Benjo
# Version:  0.1
# Requires:     Standard shell find, sort, du, awk commands
#               User must be root to run script


# GET ROOT
# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo "Which directory do you want to make a report?"
echo "(Give full path; ex. /etc, /home/benjo)"
read -p "Directory: " DIR

if [ ! -d "$DIR" ]; then
        TEST="true"
        while [ "$TEST" == "true" ]
        do
            read -p "Give a valid Directory: " DIR
                if [ -d "$DIR" ]; then
                        TEST="false"
                fi
        done
fi


echo "################################"
echo "#### Top 10 largest files   ####"
echo "################################"
find $DIR -type f -printf '%s %p\n' | sort -nr | awk '{size=$1/1048576; printf("%.2fMB %s\n", size,$2);}' | head

echo $'\n'
echo "################################"
echo "#### Top 10 larges directories #"
echo "################################"
#find $DIR -type d -printf '%s %p\n' | sort -nr | awk '{size=$1/1048576; printf("%.2fMB %s\n", size,$2);}' |head -10
du -hsx $DIR/* | sort -rh | head

echo $'\n'
echo "################################"
echo "#### Top 10 users           ####"
echo "################################"
ls -lSr /home/

echo $'\n'
echo "################################"
echo "#### Top 10 fast growing files #"
echo "################################"

echo $'\n'
echo "################################"
echo "#### Files without a user   ####"
echo "################################"
find $DIR -type f -nouser -printf '%s %p\n'

echo $'\n'
echo "################################"
echo "#### Empty files            ####"
echo "################################"
find $DIR -type f -empty -printf '%s %p\n'

echo $'\n'
echo "################################"
echo "#### Files world readable   ####"
echo "################################"
find / -type f -perm =o+r 

echo $'\n'
