"""Reproducer for the already executed source-core invariant scan."""
import json,math,pathlib
from invariant_probe_80b7 import pair,mixed
from aggregate_a3c5 import core,add,shift
def main():
 out={};ct=0
 for b in range(2,65):
  for a in range(1,b):
   if math.gcd(a,b)!=1:continue
   f,g=pair(core(a,b),1);h=add(shift(f,0,1),shift(g,1,0));q=add(shift(h,1,0),shift(h,0,1))
   tests={'h':(shift(f,0,1),shift(g,1,0)),'A_g':(h,g),'AC_q':(q,shift(f,0,1)),'AC_g':(add(q,shift(f,0,1)),h)}
   for name,(x,y) in tests.items():
    if name in out:continue
    bad=mixed(x,y)
    if bad:out[name]=dict(a=a,b=b,**bad)
   ct+=1
 print(json.dumps(dict(cases=ct,failures=out),indent=2))
if __name__=='__main__':main()
