# Diskusagereport
A script for finding the top 10 disk file/directories/users/fast growing files

A script for finding Files without a users

A script for finding Empty files

A script to Report which files are world readable

## Getting Started
These instructions is for testing purposes.


### Prerequisites
What things you need to install the software and how to install them

OS: Centos6 or higher

Commands: find, awk, sort, du, python, git

```
sudo yum install -y find awk sort du 
sudo yum install -y python
sudo yum install -y git
```

### Installing

Clone git repo
```
git clone https://github.com/ChristianCandelaria/diskusagereport.git
```

Go to directory
```
cd diskusagereport
```

Make scirpt executable
```
## bash script
sudo chmod u+x usagereport.sh
## python script
sudo chmod u+x usagereport.py
```

## Running the tests

sudo ./usagereport.sh

sudo ./usagereport.py

sudo python usagereport.py

## Versioning

V0.4

## Authors

Christian & Benjo
