#!/bin/bash
#set -ev

for file in $( git diff --name-only HEAD^ ); do
  dirname $file
done
