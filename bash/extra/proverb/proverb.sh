#!/usr/bin/env bash

for (( index=1; index <= $# ; index++ )); do
  next=$(( $index+1 ))
  [ -n "${!next}"  ] && echo "For want of a ${!index} the ${!next} was lost.";
done

[ -n "$1"  ] && echo "And all for the want of a $1."