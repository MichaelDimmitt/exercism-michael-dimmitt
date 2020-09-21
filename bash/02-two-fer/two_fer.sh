#!/usr/bin/env bash

   main () { 
     name=$1
     echo "One for ${name:-you}, one for me." 
   }

   # call main with all of the positional arguments
   main "$@"
