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
csplit -f '' -b "%02d.txt" -z gg_bereinigt.txt '/^[IVX]\{1,3\}[a-z]\{0,1\}$/' {*}

