#####
## Debugging
#####
#open debug console from code
import pdb; pdb.set_trace()  # XXX BREAKPOINT
#from console
import pkgutil
[name for _, name, _ in pkgutil.iter_modules(['name_pkg'])]
