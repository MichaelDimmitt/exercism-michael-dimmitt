#!/usr/bin/env bash

main () {
  words="${1//[^\'a-zA-Z]/ }";
  words="${words}" | tr '[:lower:]' '[:upper:]';
  printf "%c" $words
  unset acronym; unset words;
}

main "$@";
