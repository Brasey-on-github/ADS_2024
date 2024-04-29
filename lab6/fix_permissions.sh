#!/bin/sh

#INPUT_DIR="/home/bpil/HEIG/ADS/ADS_2024/lab6/test_dir/"

echo "$1";

if [[ -z "$1" ]];
then
    echo "vide";
fi

echo "The following files/directories are world-writable:";
result=$(find $INPUT_DIR -perm -o+w);

echo $result | tr ' ' '\n';
