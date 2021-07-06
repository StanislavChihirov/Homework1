#!/bin/bash

# Script for change owner of files and directory

# Color Constants using Escape symbols
BIRed='\033[1;91m'
LGREEN='\033[1;32m'
NC='\033[0m' # No Color

# Check which user run script
if [[ $EUID -ne 0 ]]; then
   echo -e "${BIRed}ERROR! This script must be run as root!${NC}" 
   exit 1
fi

# Check parameters
if [ "$#" -ne 2 ]; then
    echo -e "${BIRed}ERROR! Scrip must be run with two parameters${NC}"
fi

# Check user exist
if id -u "$1" >/dev/null 2>&1; then
    echo -e "${LGREEN}OK! User exists${NC}"
else
    echo -e "${BIRed}ERROE! User does not exists${NC}"
fi

# Check directory exist
if [ -d "$2" ] 
then
    echo -e "${LGREEN}OK! Directory $2 exists${NC}." 
else
    echo -e "${BIRed}ERROR! Directory $2 does not exists.${NC}"
fi

# Change owner of files and directory
chowner=$(chown -R $1:$1 $2)
    echo -e "${LGREEN}Everything is Ok, owner changed${NC}"
