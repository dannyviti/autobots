#!/bin/bash

output_dir=$1

if [ -d /opt/data ]; then
	data_dir=/opt/data
fi

cd $data_dir

for i in $(ls *.txt); do
    if [ $i == "bar.txt" ]; then
        continue
    fi
    last_newfile=$(echo $i | sed "s/\.txt//")
    cp $i $(echo $i | sed "s/\.txt//")
done

du -sh $data_dir/$output_dir 2>&1 >> /tmp/logfile

rm -rf $data_dir/$output_dir

longest_line=0
cat $last_newfile | while read -r; do
    length=$(echo $REPLY | wc -c)
    if [ $length > $longest_line ]; then
        longest_line=$length
    fi
done

echo "The longest line in $last_newfile is $longest_line"


