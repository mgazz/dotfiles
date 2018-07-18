####
# Read write from system socket
####
# open socket at keep it open (using -k)
nc -lkU socket.sock
# write on socket
echo hello | nc -U socket.sock




