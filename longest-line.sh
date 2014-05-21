#!/bin/bash

for i in $(ls *.txt); do
    if [ $i == "bar.txt" ]; then
        continue
    fi
    last_newfile=$(echo $i | sed "s/\.txt//")
    cp $i $(echo $i | sed "s/\.txt//")
done

longest_line=0
cat $last_newfile | while read -r; do
    length=$(echo $REPLY | wc -c)
    if [ $length > $longest_line ]; then
        longest_line=$length
    fi
done

echo "The longest line in $last_newfile is $longest_line"
