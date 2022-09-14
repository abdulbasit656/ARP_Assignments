#this bash script is used to compile all programs of given assignment

clear

echo "Program Compilation starts in $1 ... ";

unzip ./simulator.zip;	#Unzip the simulator folder

echo "Check status of required Libraries...";

dpkg --status konsole &> /dev/null 	#Checking if the konsole pkg already exist
if [ $? -eq 0 ]
then
	echo "konsole pkg already Exist."
else										#If the pkg is not installed it will be installed
	echo "For compiling, you need to install konsole pkg.";
	while true; do
		read -p "Do you wish to Install? [Y/n] " yn #installing the konsole pkg for running
		case $yn in
			[y]* ) sudo apt-get install -y konsole; break;; # You need to be superuser!
			[n]* ) exit;;
			* ) "Please, answer [y] for YES or [n] for NO ";;
		esac
	done
fi

dpkg --status libncurses-dev &> /dev/null 	#Checking if the ncurses library already exist
if [ $? -eq 0 ]
then
	echo "ncurses library already Exist."
else										#If the library is not installed it will be installed
	echo "For compiling, You need to install ncurses library";
	while true; do
		read -p "Do you wish to install? [Y/n] " yn #installing the ncurses library that is needed for the Graphic Interface
		case $yn in
			[Y]* ) sudo apt-get install -y libncurses-dev; break;; # You need to be superuser!
			[n]* ) exit;;
			* ) "Please, answer [y] for YES or [n] for NO ";;
		esac
	done
fi

echo "Program compilation begins in $1/simulator directory...";

#Compiling all the scripts and moving the executables in the <pathname> directory.
#The <pathname> directory will contain the simulator folder, the help.sh and run.sh bash scripts
#In the "simulator" folder there's a directorry called "executables" in which all the executables will be moved
gcc $1/simulator/master/master.c -o $1/simulator/executables/master;
gcc $1/simulator/command/command.c -o $1/simulator/executables/command;
gcc $1/simulator/motor_h/motor_h.c -o $1/simulator/executables/motor_h;
gcc $1/simulator/motor_v/motor_v.c -o $1/simulator/executables/motor_v;
gcc $1/simulator/inspection/inspection.c -o $1/simulator/executables/inspection -lncurses -lm;
gcc $1/simulator/watchdog/wd.c -o $1/simulator/executables/wd;

echo "Compilation Successfull ";
echo "You can run the program using './run.sh' command from $1 directory";

