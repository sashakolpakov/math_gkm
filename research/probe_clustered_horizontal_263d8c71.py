"""Machine-authored full raw horizontal scan of clustered original words."""
from experiment_terminal_263d8c71 import pair
from pathlib import Path
from math import gcd
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-263d8c71')
st=time.monotonic();count=0;done=0;first=None;zeros=0
for b in range(3,81):
 for a in range(1,b):
  if gcd(a,b)!=1:continue
  w=(0,)*(b-a)+(1,)*a;p=pair(w)[1]
  for j in range(a+b):
   for i in range(a+b-2-j):
    if a*b>b*i+a*j:continue
    t=[p.get((i+k,j),0) for k in range(3)];count+=1;zeros+=int(0 in t)
    if t[1]**2<t[0]*t[2]:
     first={'a':a,'b':b,'word':w,'i':i,'j':j,'triple':t,'gap':t[1]**2-t[0]*t[2]};break
   if first:break
  done+=1
  if first or time.monotonic()-st>80:break
 if first or time.monotonic()-st>80:break
out={'status':'Finite exact enlarged-word experiment; polygon guards retained','words':done,'comparisons':count,'zero_triples':zeros,'first_failure':first,'last_parameters':[a,b],'seconds':time.monotonic()-st}
(O/'clustered-horizontal-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
