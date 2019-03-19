#!/bin/bash
echo "Disclaimer: Some systems such as Windows might leave traces of the files due to Master File Tables."
echo "            This can be countered by CCleaner that'll fill up the drive with random zero'd files."
echo -e "\n            Also, never use this on SSDs. Just delete the files then use the TRIM function if supported.\n"
echo -e "            For directories, this will destroy *everything* in the selected directory, recursively.\n"
if [[ -z $1 ]]; then
  echo "Usage: nuke secret.txt - Destroys contents and obfuscates filename"
  echo '       nuke "secret 1.txt" - Filenames including spaces require quotation'
  echo "       nuke . - Runs nuke in the current directory"
  echo "       nuke ~ - Nukes everything in the current users home directory"
  exit 0
elif [[ -z $2 ]]; then
  echo "Confirm the nuke by typing 'Continue'"
  read con
fi
if [[ $con == "Continue" ]] || [[ $2 == "f" ]]; then #The OR check for $2 == f is to bypass the confirmation when running the script. This is safe to remove or change.
  ld=$(pwd)
  if [[ -f $1 ]]; then
    echo "Nuking $1"
    temp=$(cat /dev/urandom | tr -dc "a-zA-Z0-9" | fold -w 32 | head -n 1)
    mkdir "$temp"
    cd $_
    mv -- ../"$1" .
    find . -name ".*" -exec mv -- {} $RANDOM \; 2>/dev/null
    for c1 in {1..50}; do
      for f1 in *; do
        dd if=/dev/null of="$f1" 2>/dev/null
        dd if=/dev/zero of="$f1" bs=$RANDOM count=5 2>/dev/null
        dd if=/dev/urandom of="$f1" bs=$RANDOM count=5 2>/dev/null
        mv -- "$f1" "$(cat /dev/urandom | tr -dc "a-zA-Z0-9" | fold -w 32 | head -n 1)" 2>/dev/null
      done
    done
    for c2 in {1..50}; do
      touch "$(cat /dev/urandom | tr -dc "a-zA-Z0-9" | fold -w 32 | head -n 1)"
      for f2 in *; do
        mv -- "$f2" "$(cat /dev/urandom | tr -dc "a-zA-Z0-9" | fold -w 32 | head -n 1)" 2>/dev/null
      done
    done
    cd $ld
    rm -rf -- "$temp/"
  elif [[ -d $1 ]]; then
    cd "$1"
    echo "Nuking files in $(pwd)"
    find . -name "*" -depth -exec mv -- {} . \; 2>/dev/null
    find . -name ".*" -exec mv -- {} $RANDOM \; 2>/dev/null
    for c1 in {1..50}; do
      for f1 in *; do
        dd if=/dev/null of="$f1" 2>/dev/null
        dd if=/dev/zero of="$f1" bs=$RANDOM count=5 2>/dev/null
        dd if=/dev/urandom of="$f1" bs=$RANDOM count=5 2>/dev/null
        mv -- "$f1" "$(cat /dev/urandom | tr -dc "a-zA-Z0-9" | fold -w 32 | head -n 1)" 2>/dev/null
      done
    done
    for c2 in {1..50}; do
      touch "$(cat /dev/urandom | tr -dc "a-zA-Z0-9" | fold -w 32 | head -n 1)"
      for f2 in *; do
        mv -- "$f2" "$(cat /dev/urandom | tr -dc "a-zA-Z0-9" | fold -w 32 | head -n 1)" 2>/dev/null
      done
    done
    rm -rf -- *
    cd $ld
  fi
  echo "Finished."
fi
exit 0
