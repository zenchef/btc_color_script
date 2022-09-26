#!/bin/sh
chmod u+x ./fisrtShellScript.sh

cd ~
cd Desktop/test_script/

if [ -e color.swift ]
then
    echo "color.swift already exists"
else
    touch color.swift
fi

fileContent=$(<color.swift)
echo $fileContent
fileContent=${fileContent//"enum"/}
fileContent=${fileContent//"{"/}
fileContent=${fileContent//"}"/}

#fileAfterRemove= ${fileContent/enum/};
echo $fileContent


echo "enum {" > "color.swift"
echo "$fileContent" >> "color.swift"

while getopts c: flag
do
    case "${flag}" in
        c) color=${OPTARG};;
    esac
done

if [[ $fileContent == *$color* ]];
then
    echo "color already exists"
else
    echo "\ncase $color" >> "color.swift"
    echo "$color has been added"
fi

echo "}" >> "color.swift"

sed -i "" '/^[[:space:]]*$/d' color.swift

#wget -O ABC.txt "https://docs.google.com/spreadsheets/d/1DkqiGcV--2Rr-bTqflsExqsilvw7xPWyEymLrA-yueY/export?format=txt"
wget --output-file="logs.csv" "https://docs.google.com/spreadsheets/d/1DkqiGcV--2Rr-bTqflsExqsilvw7xPWyEymLrA-yueY/export?format=csv&gid=0" -O "downloaded_content.csv"


    
