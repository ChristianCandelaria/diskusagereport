#!/bin/python
# Funtion:	create disk usage report
# Arguments:    NON
# Author:	Christian & Benjo
# Copyright:    2017 Christian & Benjo
# Version:	0.1
# Requires:     Standard shell find, sort, du, awk commands
#               User must be root to run script
import os

# GET ROOT
# Make sure only root can run our script
ROOT=os.system("$(id -u)")
if ROOT != "0" ]; then
   print "This script must be run as root"
   os._exit(1)
fi

print "Which directory do you want to make a report?"
print "(Give full path; ex. /etc, /home/benjo)"
DIR = raw_input("Directory: ")

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


print "################################"
print "#### Top 10 largest files   ####"
print "################################"
os.system("find "+DIR+" -type f -printf '%s %p\n' | sort -nr | awk '{size=$1/1048576; printf("%.2fMB %s\n", size,$2);}' | head") 

print "\n"
print "################################"
print "#### Top 10 larges directories #"
ptint "################################"
os.system("du -hsx "+DIR+"/* | sort -rh | head")

print "\n"
print "################################"
print "#### Top 10 users           ####"
print "################################"
os.system("ls -lSr /home/")

print "\n"
print "################################"
print "#### Top 10 fast growing files #"
print "################################"

print "\n"
print "################################"
print "#### Files without a user   ####"
print "################################"
os.system("find "+DIR+" -type f -nouser -printf '%s %p\n'")

print "\n"
print "################################"
print "#### Empty files            ####"
print "################################"
os.system("find "+DIR+" -type f -empty -printf '%s %p\n'")

print "\n"
print "################################"
print "#### World readable         ####"
print "################################"
os.system("find / -type f -perm =o+r")


print "\n"