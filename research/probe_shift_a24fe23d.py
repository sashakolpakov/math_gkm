"""Machine-authored a24fe23d. Fixed-shift four-function probes."""
from probe_a24fe23d import H,O
import json
d={}
for c in range(-5,6):
 failure=None;checks=0
 for a in range(3,30):
  for j in range(2*a+1):
   for s in range(1,a-1):
    for q in range(a-s+1):
     for r in range(a-s-1):
      lhs=H(a,j,s,q)*H(a,j,s+2,r)
      if not lhs:continue
      x=min(q+c,r);y=max(q+c,r)-c
      rhs=H(a,j,s+1,x)*H(a,j,s+1,y) if x>=0 and y>=0 else 0
      checks+=1
      if lhs>rhs:failure=[a,j,s,q,r,x,y,lhs,rhs];break
     if failure:break
    if failure:break
   if failure:break
  if failure:break
 d[c]={'checks':checks,'failure':failure}
(O/'shift-probe.json').write_text(json.dumps(d,indent=2)+'\n');print(json.dumps(d))
