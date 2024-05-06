#!/bin/bash

#INPUT_DIR="/home/bpil/HEIG/ADS/ADS_2024/lab6/test_dir/"

# Check if arg1 is void
if [[ (-z "$1") ]]
then
    echo "Error void first argument non allowed!"
    exit 1
fi

# check if arg1 isn't a driectory
if [[ !(-d "$1") ]]
then
    echo "Error first argument needs to be a directory"
    exit 1
fi

echo "The following files/directories are world-writable:";
result=$(find $1 -type f,d -perm -o+w);

echo $result | tr ' ' '\n';

echo "The following files/directories are writable for groups:";
result_group=$(find $1 -type f,d ! -group "$(id -gn)" -perm -g+w);

echo $result_group | tr ' ' '\n';

# Do not ask if no file or dir are word writable
if [[ (-z "$result") ]]
then
    exit 1
fi

while [[ ($answer != "y") && ($answer != "n")]]; do
    echo "Do you want the permission to be fixed (y/n) ?";
    read answer;
done

if [[ ($answer == "y") ]]
then 
    for filename in $result; do
        chmod o-w "$filename";
        echo "Write operation removed for others on $filename";
    done

    for grp_filename in $result_group; do
        chmod g-w "$grp_filename";
        echo "Write operation removed for others on $grp_filename";
    done
fi