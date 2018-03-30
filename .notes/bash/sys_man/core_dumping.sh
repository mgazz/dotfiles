
# dump core when application has error or segmentation fault

# ----- add to /etc/sysctl.conf -------

####
## Core dump
####
# Appends the coring processes PID to the core file name.
kernel.core_uses_pid = 1
# Make sure you get core dumps for setuid programs.
fs.suid_dumpable = 2
#path output
#%% – A single % character
#%p – PID of dumped process
#%u – real UID of dumped process
#%g – real GID of dumped process
#%s – number of signal causing dump
#%t – time of dump (seconds since 0:00h, 1 Jan 1970)
#%h – hostname (same as â€™nodenameâ€™ returned by uname(2))
#%e – executable filename
kernel.core_pattern = /tmp/core-%e-%s-%u-%g-%p-%t

# ---------------------------------------------------


# refresh  /etc/sysctl.conf
sudo sysctl -p

# check updated conf
sudo cat /proc/sys/kernel/core_pattern
# expected: /tmp/core-%e-%s-%u-%g-%p-%t

# read core file in case of error
# if file is /tmp/core-compute_image_m-6-1000-1001-22258-1521712434

gdb binary_file /tmp/core-....

####
## Debugging processes using strace
####
# capture output and save it to text file
strace -o output.txt binary_file




