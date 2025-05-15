#!/bin/bash

#2b
create_indent ()
{   
    # $# argument count
    # [] = test function
    if [ "$#" -ne 1 ]; then
        echo "[indent] Error, insufficient parameters"
        exit
    fi

    indent_depth="$1"

    INDENTS=""

    # seq = sequence like range in python
    #$() = run command
    for _ in $(seq "$indent_depth"); do
        INDENTS+="    "
    done
}

walk_dirs ()
{
    # $1 $2 arguments thats getting passed to walk_dirs
    path="$1"

    if [ "$#" -eq 1 ]; then
        indent=0
    else
        indent="$2"
    fi

    # loop over current directory
    for entry in "$path"/*; do
        create_indent "$indent"
        
        # test if the entry is an directory
        if [ -d "$entry" ]; then
            # print the dir with indentation and remove leading / from entry
            printf "%sDirectory: %s\n" "$INDENTS" "${entry:1}"
            # call walk_dir for the children dir and increment the indent
            walk_dirs "$entry" $(("$indent + 1"))
        else
            printf "%sFile: %s\n" "$INDENTS" "${entry:1}"
        fi
    done
}

walk_dirs "$1"
