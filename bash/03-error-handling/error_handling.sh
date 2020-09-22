#!/usr/bin/env bash
main () { 
  if (( $# == 1 )); then
    echo "Hello, $1"
  else 
    echo "Usage: error_handling.sh <person>" 
  fi
}

# call main with all of the positional arguments
main "$@"
