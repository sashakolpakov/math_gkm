"""Machine-authored exploratory lower-row representation, finite exact checks."""
from pathlib import Path
from math import comb
import json,time
from sparse_probe_96ada19b import solve
O=Path('/Users/sasha/math_gkm/evidence/markov-e9cdd527')
def divide_one(a):
 b=[a[0]]
 for z in a[1:-1]:b.append(z-b[-1])
 assert a[-1]==b[-1],(a,b)
 return b
def main():
 t=time.monotonic();out={'status':'finite exploratory checks only','checks':0,'residual_lc_failures':[],'residual_negative':[],'division_failures':[],'rows':[]}
 for q in range(1,21):
  for r in [False,True]:
   n=3*q+(1 if r else 2)
   a=solve(q,r,n+2,q)
   for j in range(q+1):
    row=[a[i,j] for i in range(3,n+3-j)]
    try:
     h=row
     for k in range(n-2*j-1):h=divide_one(h)
    except AssertionError:
     out['division_failures'].append([q,r,j]);continue
    assert len(h)==j+1
    out['checks']+=1
    if min(h)<0:out['residual_negative'].append([q,r,j,h])
    if any(h[k]*h[k+2]>h[k+1]**2 for k in range(len(h)-2)):out['residual_lc_failures'].append([q,r,j,h])
    if q in [3,5,10] and j<=5:out['rows'].append({'q':q,'r':r,'n':n,'j':j,'residual':h})
 out['seconds']=time.monotonic()-t
 (O/'row-experiments.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out))
if __name__=='__main__':main()
