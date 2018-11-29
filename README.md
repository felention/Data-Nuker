# Directory-nuker
A simple bash script that'll make it hard to recover/figure out the name/contents of files/directories.

It's essentially a DBAN for files/directories rather than a partition/drive.

***To prevent accidental deletion of other files, the user must place the files they want erased into a temporary directory.***

***Disclaimer: Depending on your system this'll only act as a secure erase. Systems such as Windows will remember the filename because of how the file system works.***

### Setup
To make sure it works properly, place ranchar.sh into your Documents directory. You can rename it and/or place it elsewhere as long as you update the location in nuke.sh

To make better use out of this script, add it to your bashrc file. You can do that with the following:

1. Using your prefered editor, add ***alias nuke='bash ~/Documents/nuke.sh'*** to ~/.bashrc

2. For instant use without having to restart your terminal session type ***source ~/.bashrc***


Now you can run it, i.e. nuke ~/Desktop/priv/

### Break-down
#### If an explanation is wanted for the code then I'll make it, however for now this is an example:

This sets **$ld** as the current directory the user executes the script in to return to after
```sh
ld=$(pwd)
```

To ensure the user set the location they want to nuke, exit if no location is entered.
```sh
if [[ -z $1 ]]; then
    echo 'No directory entered'
    exit 0
fi
```
