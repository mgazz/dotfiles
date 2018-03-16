####
# Step for plotting raw data
####

# isolate list of values
values = []
lines_number += 1
with open(file_path) as f:
    for line in f:
        lines_number += 1
        line_elements = re.findall(r"[\w']+", line)
        values.append(line_elements[x])

# create figure based on figure
figure = plt.figure(figsize=(15, 10), dpi=80, facecolor='w', edgecolor='k')
mx = figure.add_subplot(111)
# x=range(1,len(values))
x = range(1, lines_number)
ram_line, = mx.plot(x, values, lw=2)
mx.set_title("Title")
mx.set_xlabel("x label")
mx.set_ylabel("y label")
plt.grid(True)
plt.savefig(path_figure)


# compute mean of list of values
# from string to floats (use int or whatever)
float_values_list = map(float, values)
avg = reduce(lambda x, y: x + y, floats_value_list) / len(float_values_list)
print avg


####
## create percentile
####

data_gathered=[]
lines_number=1
with open(resource_file) as f:
    # skip header
    next(f)
    for line in f:
        lines_number+=1
        #read float 
        splitted_data=re.findall("\d+\.\d+", line)
        # each entry is a float in the file
        data_gathered.append(splitted_data[0])

prctile_fig = plt.figure(figsize=(15, 10), dpi=80, facecolor='w', edgecolor='k')
prctilex = prctile_fig.add_subplot(111)

# list of interesting percentile
p = np.array([0.0, 25.0, 50.0, 75.0, 90.0, 100.0])

# from string to floats
data = np.asarray(data_gathered,dtype=np.float32)

# sort entries
d = np.sort(data)
perc = mlab.prctile(d, p=p)
plt.plot(d)

# Place red dots on the percentiles
plt.plot((len(d)-1) * p/100., perc, 'ro')

# Set tick locations and labels
plt.xticks((len(d)-1) * p/100., map(str, p))
plt.yticks(np.arange(0.05, max(d)+0.1, 0.1))
prctilex.set_title("Response distribution")
prctilex.set_xlabel("Percetiles")
prctilex.set_ylabel("seconds")
plt.grid(True)
plt.savefig("./prctile.png")
