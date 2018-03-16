# read lines from file
with open(fname, 'r') as f:
    content = f.readlines()
#or
f=open(fname, 'r')
while condition:
    content = f.readlines()

# write to file
#f=open(fname, 'w')
with open(fname, 'w') as f:
    f.write("message: {}".format(parameter))

#remove readline
content = [x.strip() for x in content]

#remove new line
lines = [line.rstrip('\n') for line in open('filename')]

#splitting sting 
#split and save x-th element
elem=filename.split(".")[x]
#split and save x-th element from end
elem=filename.split(".")[-x]


### create dictionary from file
d = {}
with open("file.txt") as f:
    for line in f:
       (key, val) = line.split()
       d[int(key)] = val


