#!/usr/bin/env bash

main () {
  (( $# != 2 )) && echo "Usage: hamming.sh <string1> <string2>" && exit 1
  (( ${#1} != ${#2} )) && echo "left and right strands must be of equal length" && exit 1

  # loopingSolution "$1" "$2"
  processSubstitution "$1" "$2"
}

loopingSolution () {
  for (( counter=0, index=0; index <= ${#1} ; index++ )); do
    # Substring Extraction - https://unix.stackexchange.com/a/303983/188491
    ! [ "${1:index:1}" = "${2:index:1}" ] && ((++counter))
  done
  echo "$counter"
}

processSubstitution () {
  # Process Substitution solution, difference between two strings in bash: https://stackoverflow.com/a/454579/5283424
  hammingDistance=$(cmp -bl <(echo -n "$1") <(echo -n "$2") | wc -l )
  echo $hammingDistance
}

# call main with all of the positional arguments
 main "$@"
