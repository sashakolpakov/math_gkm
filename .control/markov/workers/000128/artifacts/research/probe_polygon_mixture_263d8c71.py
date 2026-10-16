"""Machine-authored polygon-guarded positive-mixture probe; no root witness."""
from experiment_terminal_263d8c71 import pair
from itertools import product,combinations
from math import gcd
from pathlib import Path
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-263d8c71')
st=time.monotonic();count=0;negative_mixed=0;bad=0;first=None
for n in range(1,10):
 groups={}
 for w in product([0,1],repeat=n):
  for end in [0,1]:
   a=sum(w)+end;b=n+2
   if not 0<a<b or gcd(a,b)!=1:continue
   ww=(0,)+w+(end,)
   groups.setdefault((a,b,end),[]).append((ww,pair(ww)[1]))
 for (a,b,end),vs in groups.items():
  for (w,p),(z,q) in combinations(vs,2):
   for j in range(a+b):
    for i in range(a+b-2-j):
     if a*b>b*i+a*j:continue
     t=[p.get((i+k,j),0) for k in range(3)];s=[q.get((i+k,j),0) for k in range(3)]
     g=t[1]**2-t[0]*t[2];h=s[1]**2-s[0]*s[2]
     M=2*t[1]*s[1]-t[0]*s[2]-t[2]*s[0];count+=1
     if M>=0:continue
     negative_mixed+=1
     if g<0 or h<0 or M*M>4*g*h:
      bad+=1
      if first is None:
       alpha,beta=(2*h,-M) if h else (1,g+1)
       triple=[alpha*x+beta*y for x,y in zip(t,s)]
       first={'words':[w,z],'counts':[a,b],'i':i,'j':j,'triples':[t,s],'gaps':[g,h],'mixed':M,'weights':[alpha,beta],'mixture':triple,'mixture_gap':triple[1]**2-triple[0]*triple[2]}
 if first or time.monotonic()-st>90:break
out={'status':'Finite exact enlarged-family test, not proof or source witness','max_core_length_completed':n,'comparisons':count,'negative_mixed':negative_mixed,'noncopositive':bad,'first':first,'seconds':time.monotonic()-st}
(O/'polygon-mixture-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
