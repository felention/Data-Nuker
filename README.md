# Directory-nuker
A simple bash script that'll make it hard to recover/figure out the name/contents of files/directories.

It's essentially a DBAN for files/directories rather than a drive.

This will work in the Windows Subsystem for Linux (WSL).

This has also been tested in Windows with Recuva and successfully works.

***This will delete everything in the selected directory recursively.***

***Disclaimer: Never use this on an SSD or any other kind of erasing using overwriting. This could affect your SSDs lifespan. For SSDs, you should be able to just delete the files/directories and then use the TRIM function if your SSD supports it. Any new SSDs should have this already.***

### Setup
To make better use out of this script, add it to your bashrc file. You can do that with the following:

1. Using your preferred editor, add ***alias nuke='bash ~/Documents/nuke.sh'*** to ~/.bashrc

2. For instant use without having to restart your terminal session type ***source ~/.bashrc***


Now you can run it, i.e. nuke ~/Desktop/priv/
