"""Machine-authored finite probes of signed offsets at the central rows.
This extends Python integer arguments only; no Lean/source bridge is claimed.
"""
from pathlib import Path
from three_probe_9e205206 import frame
from correction_kernel_d0292f14 import raw,top
import json,time
t=time.monotonic();cache={};fail=[];gaps=[];checks=0;zeros=0;rows=[]
for r in [False,True]:
 B=5 if r else 4
 for x in [-4,-3,-2,-1]:
  for k in range(24):
   q=x+2*k+B
   if q<1 or k>q:continue
   if (q,r) not in cache:cache[q,r]=frame([False]*(q-1)+[True,r])
   a,b,p=cache[q,r];j=b-q-k-1
   if j<0:continue
   rows.append([q,r,x,k,j])
   for c in range(33):
    val=raw(x,k,r,c+3);actual=p.get((c+3,j),0)
    checks+=1;zeros+=int(actual==0)
    if val!=actual:fail.append([q,r,x,k,c,actual,val])
    v=[raw(x,k,r,c+3+h) for h in range(3)]
    if v[1]**2<v[0]*v[2]:gaps.append([q,r,x,k,c,v])
out=dict(comparisons=checks,zeros=zeros,formula_failures=fail,gap_failures=gaps,
 rows=rows,seconds=time.monotonic()-t,status='Finite exact source comparison of an unproved signed-offset extension; not a theorem or root closure.')
Path('evidence/markov-e8743310/central-extension.json').write_text(json.dumps(out,indent=2))
print(json.dumps({k:v for k,v in out.items() if k!='rows'}))
