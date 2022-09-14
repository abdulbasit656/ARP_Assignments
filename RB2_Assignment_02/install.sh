#!/bin/bash

# To compile the program you have to execute the bash script: install.sh
# If there isn't any first argument, which is <pathname>, there will be an echo containing the information to how install the program
# <pathname> is the folder you have to create in which you insert all processes' folders.

clear

if [ $# -eq 0 ]

then
    echo "To compile the codes insert the command correctly: ./install.sh <pathname> ";
    exit;
fi

# If there isn't any folder inside the path, we have to create it. We can check if there is a 
# folder and this if statement ($1 is the folder we have to create).

if [ ! -d $1 ]

then
 echo "There is an ERROR: $1 directory does NOT exist!";
 while true; do
  read -p "Do you want to create $1 directory? [y/n] " yn
  case $yn in
   [y]* ) mkdir $1; break;;
   [n]* ) exit;;
   * ) "press [y] for YES & [n] for NO ";;
  esac
 done
fi

# The following lines we will unzip the sources.script. 
# We export the path of the folder in order to use it in a file bash.

echo "Program Compilation starts in $1 ... ";

unzip ./src.zip;

# Compile of all the .c files and we put the executables and moved the executables inside a new folder.

echo "Unnamed pipe program compilation begins in $1/src/unnamed_pipe/exec directory...";
gcc $1/src/unnamed_pipe/writer.c -o $1/src/unnamed_pipe/exec/writer -lpthread -lrt
gcc $1/src/unnamed_pipe/reader.c -o $1/src/unnamed_pipe/exec/reader -lpthread -lrt
gcc $1/src/unnamed_pipe/m.c -o $1/src/unnamed_pipe/exec/m -lpthread -lrt

echo "Named pipe Program compilation begins in $1/src/named_pipe/exec directory...";
gcc $1/src/named_pipe/g1.c -o $1/src/named_pipe/exec/g1 -lpthread -lrt
gcc $1/src/named_pipe/g2.c -o $1/src/named_pipe/exec/g2 -lpthread -lrt
gcc $1/src/named_pipe/r.c -o $1/src/named_pipe/exec/r -lpthread -lrt
gcc $1/src/named_pipe/m.c -o $1/src/named_pipe/exec/m -lpthread -lrt

echo "Compilation Successfull ";
echo "You can run the program using './run.sh' command from $1 directory";
