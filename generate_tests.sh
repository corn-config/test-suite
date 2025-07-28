#!/usr/bin/env bash

shopt -s globstar

export CORN_TEST="hello, world!"

rm -rf json/*
mkdir -p json

for file in corn/**/*.pos.corn; do
  dirname=$(dirname "$file" | sed 's/corn\///')
  basename=$(basename "$file" .pos.corn)
  
  path="$dirname/$basename"

  printf "$path"
  mkdir -p json/"$dirname"

  {
    IFS=$'\n' read -r -d '' error;
    IFS=$'\n' read -r -d '' output;
  } < <((printf '\0%s\0' "$(corn "$file" -t json)" 1>&2) 2>&1)

  if [[ -n $output ]]; then
    echo $output > json/"$path".json
    echo ' ✔️'
  else
    echo ' ❌'
    echo $error 
  fi
done