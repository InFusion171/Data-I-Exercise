#!/bin/bash

#2a
# $1 $2 argument 1 and 2
# -o <format> see: https://ss64.com/bash/ps_keywords.html and man ps line 301
# -n interval in sec
watch -n $2 "ps --pid=$1 -o comm= && echo is running || echo not running"
