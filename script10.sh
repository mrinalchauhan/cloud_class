
#!/bin/sh
#Q1
echo "Enter the path of the folder: "
read path

echo "Latest file in the given directory: "
cd $path
curr=$(ls -t | head -n1)
echo "$curr"

cp $curr  /home/iteradmin/a.txt
echo "File copied"

echo "Most occuring word in the file: "
cd /home/iteradmin/
sort a.txt | uniq -c | sort -nr| head -1



