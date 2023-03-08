#!/bin/bash


file=$(cat sub.txt)



name=$(echo $file | cut -d':' -f2- | awk '{sub(/^ */, ""); print tolower($1)}')
echo $name

