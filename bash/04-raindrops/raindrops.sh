#!/usr/bin/env bash

# 3 'Pling'
# 5 'Plang'
# 7 'Plong'

main(){
  rain_noises="";
  (($1 % 3 == 0)) && rain_noises+="Pling";
  (($1 % 5 == 0)) && rain_noises+="Plang";
  (($1 % 7 == 0)) && rain_noises+="Plong";
  [ -z "$rain_noises" ] && echo "$1" || echo $rain_noises;
}
main "$@";