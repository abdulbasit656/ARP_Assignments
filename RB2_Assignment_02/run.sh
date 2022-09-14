# for named pipe

clear

echo "Executing Un-named Pipe codes...";
cd src/unnamed_pipe/exec;
./writer
./reader
./m
cd ..
cd ..

echo "Executing Named Pipe codes in new Terminal...";
# for unnamed pipe
#gnome-terminal will open new terminal to execute named pipe executables

gnome-terminal -- bash -c "cd named_pipe/exec; ./g1; ./g2; ./r; ./m; exec bash"

#cd src/named_pipe/exec
#./g1
#./g2
#./r
#./m

