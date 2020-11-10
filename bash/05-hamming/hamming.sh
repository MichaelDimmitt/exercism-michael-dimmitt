#!/usr/bin/env bash

main () {
  [ $# -lt 2 ] && echo "Usage: hamming.sh <string1> <string2>" && exit 1
  ! [ ${#1} -eq ${#2} ] && echo "left and right strands must be of equal length" && exit 1
  
  # difference between two strings in bash: https://stackoverflow.com/a/454579/5283424
  hammingDistance=$(cmp -bl <(echo -n "$1") <(echo -n "$2") | wc -l )
  echo $hammingDistance
  
}

# call main with all of the positional arguments
 main "$@"
