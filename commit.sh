#!/bin/bash

if [ $# -eq 0 ]; then
    echo -e "\e[1;91mUsage: add commit comment\e[0m"
    exit 1
fi
comment="$*"

git add .
if [ $? -ne 0 ]; then
    echo -e "\e[1;91m Git add failed \e[0m" #Bright RED with bold
    exit
else
    echo -e "\e[1;92m Git adding done \e[0m" #Bright Green with bold
fi

git commit -m "$comment"
if [ $? -ne 0 ]; then
    echo -e "\e[1;31mGit commit failed\e[0m" #Normal RED
    exit
else
    echo -e "\e[1;32mGit commit done\e[0m" #Normal GREEN
fi

git push
if [ $? -ne 0 ]; then
    echo -e "\e[1;91mGit push failed\e[0m"
    exit
else
    echo -e "\e[1;92mGit push is done\e[0m"
fi