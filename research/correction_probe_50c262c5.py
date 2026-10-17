"""Machine-authored finite test of the actual-source minus ramp-model difference.
No universal identity or sign premise is inferred from this experiment.
"""
from pathlib import Path
from math import comb
from three_probe_9e205206 import frame
import json,time
start=time.monotonic()
def D(i,j,b):
 c=i-3;k=b+2-i-j
 if k<0:return 0
 return sum((1 if s==0 else 4*s)*comb(j-s+c+3,c+3)*comb(k-s+c,c) for s in range(min(j,k)+1))
out={'coefficients':0,'negative_difference':[],'support_failures':[],
 'correction_lc_failures':[[],[],[]],'mixed_gap_failures':[[],[],[]],
 'triples':[0,0,0],'minimum_mixed': [None,None,None]}
for q in range(1,29):
 for r in (False,True):
  _,b,p=frame([False]*(q-1)+[True,r]);model={};err={}
  for i in range(3,b+5):
   for j in range(b+5):
    d=D(i,j,b);e=p.get((i,j),0)-d;model[i,j]=d;err[i,j]=e;out['coefficients']+=1
    if e<0 and len(out['negative_difference'])<10:out['negative_difference'].append([q,r,i,j,e])
    if e!=0 and not (q<j and i+j<=b-q) and len(out['support_failures'])<10:
     out['support_failures'].append([q,r,i,j,e])
  for i in range(3,b+3):
   for j in range(b+3-i):
    for di,pts in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):
     A,B,C=[model[x] for x in pts];a,bb,c=[err[x] for x in pts]
     if not any((a,bb,c)):continue
     out['triples'][di]+=1;gap=2*B*bb-A*c-C*a
     if out['minimum_mixed'][di] is None or gap<out['minimum_mixed'][di]:out['minimum_mixed'][di]=gap
     if bb*bb<a*c and len(out['correction_lc_failures'][di])<8:out['correction_lc_failures'][di].append([q,r,pts,[a,bb,c]])
     if gap<0 and len(out['mixed_gap_failures'][di])<8:out['mixed_gap_failures'][di].append([q,r,pts,[A,B,C],[a,bb,c],gap])
out.update(seconds=time.monotonic()-start,status='Finite auxiliary decomposition experiment. Failures concern proposed summand arguments, not the full raw source inequality.')
Path('evidence/markov-50c262c5/correction-probe.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
