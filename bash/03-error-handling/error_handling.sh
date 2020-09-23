#!/usr/bin/env bash
main(){
  if (( $# != 1 )); then
    echo "Usage: error_handling.sh <person>";
    return 1;
  else 
    echo "Hello, $1";
    return 0;
  fi
}
# call main with all of the positional arguments
main "$@"

# call main with all of the positional arguments
