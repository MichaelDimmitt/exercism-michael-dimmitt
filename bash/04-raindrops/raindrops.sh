#!/usr/bin/env bash

# 3 'Pling'
# 5 'Plang'
# 7 'Plong'

main(){
  if (( $# != 1 )); then
    echo "Error: argument required for raindrops.sh";
    return 1;
  elif ! [ "$1" -ge 0 ] 2>/dev/null; then
    # https://unix.stackexchange.com/a/367406/188491
    echo "Error: number must be provided as an argument for raindrops.sh";
    return 1;
  fi

  rain_noises="";
  (($1 % 3 == 0)) && rain_noises+="Pling";
  (($1 % 5 == 0)) && rain_noises+="Plang";
  (($1 % 7 == 0)) && rain_noises+="Plong";
  [ -z "$rain_noises" ] && echo "$1" || echo $rain_noises;
}
main "$@";
