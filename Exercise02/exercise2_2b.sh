#!/bin/bash

walk_dirs ()
{
    # $1 $2 arguments thats getting passed to walk_dirs
    path="$1"

    if [ "$#" -eq 1 ]; then
        indent=''
    else
        indent="$2"
    fi

    # loop over current directory
    for entry in "$path"/*; do        
        # test if the entry is an directory
        if [ -d "$entry" ]; then
            # print the dir with indentation 
            printf "%sDirectory: %s\n" "$indent" "$entry"
            # call walk_dir for the children dir and increment the indent
            walk_dirs "$entry" "    $indent"
        else
            printf "%sFile: %s\n" "$indent" "$entry"
        fi
    done
}

walk_dirs "$1"
