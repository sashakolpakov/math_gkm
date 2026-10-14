"""Machine-authored exact source tests of sums over degree intervals."""
from pathlib import Path
from math import gcd
import json,time
from degree_groups_07a7 import grouped
from cuts_fe01 import value
from group_cuts_07a7 import add
O=Path('evidence/markov-07a7e5b7')
def main():
 t=time.monotonic();tests=0;failure=None;sources=0
 for b in range(2,31):
  for a in range(1,b):
   if gcd(a,b)!=1:continue
   w=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,);G=grouped(w);sources+=1
   for s in range(b):
    ds=sorted(d for ss,d in G if ss==s)
    for z,lo in enumerate(ds):
     acc=[]
     for hi in ds[z:]:
      acc=add(acc,G[s,hi])
      for j in range(1,len(acc)):
       tests+=1
       if acc[j]**2<value(acc,j-1)*value(acc,j+1):failure=dict(a=a,b=b,s=s,lo=lo,hi=hi,j=j,p=acc);break
      if failure:break
     if failure:break
    if failure:break
   if failure:break
  if failure:break
 rec=dict(status='finite exact source tests only',bound=30,sources=sources,tests=tests,failure=failure,seconds=time.monotonic()-t)
 (O/'degree-intervals.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec))
if __name__=='__main__':main()
