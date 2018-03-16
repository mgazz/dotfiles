#connect to raspberry using serial conn
sudo minicom -b 115200 -o -D /dev/ttyUSB0 

#generate password command line
openssl rand -base64 32

# redirect error and output messages to /dev/null
./script.sh > /dev/null 2>&1
# redirect error and output messages to file
/path/to/my/cool/appname > myapp.log 2>&1

# redirect output and error to different files
command 2> error 1> output

#all arguments
"$@"



