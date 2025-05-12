#!/bin/bash

# 1a
mkdir GG
cd GG
curl -o gg.txt https://raw.githubusercontent.com/levinalex/deutsche_verfassungen/master/grundgesetz/grundgesetz.txt 

# 1b
# from line 0 delete everything until "I\nDie Grundrechte"
# credits: a little bit of chatgpt and alot of thinking
# //!d = //=match previous regex !=not d=delete
# /b = branching. If no branch is defined, it will skip to the end
sed -e '/^I$/b' -e '0, /Die Grundrechte/{//!d}' gg.txt > gg_bereinigt.txt

# 1c
mkdir Kapitel
cd Kapitel
# -s silent -f name -b printf syntax -z discard empty files
csplit -s -f '' -b '%02d.txt' -z ../gg_bereinigt.txt '/^[IVX]\{1,4\}[a-z]\{0,1\}$/' {*}

# 1d
for filename in ./*.txt; do
    # remove ./ from filename
    basename=$(basename $filename)

    # -A1 get one more line after match
    headline=$(grep -E -A1 '^[IVX]{1,4}[a-z]?$' "$filename" | tr '\n' ' ')
    mkdir "$headline"
    cd "$headline"

    csplit -s -f '' -b '%02d.txt' -z "../$basename" '/^Artikel [0-9]\{1,3\}$/' {*}

    # delete first csplit file because it contains the article headline
    rm '00.txt'

    for article in ./*.txt; do 
        if [[ "$article" == "./*.txt" ]]; then
            continue
        fi

        article_number=$(grep -E '^Artikel [0-9]{1,3}[a-z]?$' "$article")

        # rename
        mv "$article" "$article_number.txt"
    done

    cd ..

done


# 1e
for file in *; do
    # delete all txt files
    if [ -f "$file" ]; then
        rm "$file"
    # move folders to parent folder
    elif [ -d "$file" ]; then
        mv "$file" ..
    fi
done

cd ..

rm 'gg.txt'
rm 'gg_bereinigt.txt'
rm -r Kapitel

# 1f
cd ..
tar -cf GG.tar GG 


