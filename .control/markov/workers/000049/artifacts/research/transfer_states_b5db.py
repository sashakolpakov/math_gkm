"""Machine-authored exact source-word probe of transfer invariants."""
from ambient_transfer_probe_5c90 import add,shift,mul
import json,time,pathlib,math
def states(w):
 f={(1,0):1,(1,1):1};g={(0,0):1,(1,0):1,(1,1):1}
 for r in reversed(w):
  if r:
   h=mul({(1,1):1,(1,2):1},f);k=mul({(1,0):1,(1,1):1},g)
   f,g=add(shift(f,0,1),h,k),add({ij:2*c for ij,c in shift(f,0,1).items()},h,g,k)
  else:
   h=add(shift(f,1,1),shift(g,1,0));f,g=h,add(h,g)
 return f,g,add(shift(f,0,1),g)
