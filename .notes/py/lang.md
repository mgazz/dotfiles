#### Assigments 

Every thing in Python is passed and assigned by value, in the same way that everything is passed and assigned by value in Java. Every value in Python is a reference (pointer) to an object. Objects cannot be values. Assignment always copies the value (which is a pointer); two such pointers can thus point to the same object. Objects are never copied unless you're doing something explicit to copy them.


#### Numpy array concatenation

```
# Note if you dont't put [1,2] inside [] you get (2,)
a = np.array([[1,2]])
a.T.shape
b = np.array([[3,4]])
np.concatenate((a.T,b.T),axis=1)
```

```
# inds will tell us, for each reacall threshold, if it
# is bigger or smaller that rc (smaller is 0, bigger is 1)
inds = np.searchsorted(rc, p.recThrs, side='left')
```

