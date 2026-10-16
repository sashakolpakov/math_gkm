"""Machine-authored exact direct-source experiments; finite observations only."""
from pathlib import Path
from math import comb
from fractions import Fraction
import time,json
from three_probe_9e205206 import frame
from lift_probe_ae9e841e import F as kernel,C
from column_certificates_ae9e841e import column
O=Path('/Users/sasha/math_gkm/evidence/markov-ae9e841e')
def ev(p,n,j):return sum(v*n**a*j**b for (a,b),v in p.items())
def main():
 start=time.monotonic();out={'status':'finite exact experiments, not a proof', 'q_max':30,'sources':0,'lift_comparisons':0,'column_comparisons':0,'zeros':0,'horizontal_triples':0,'vertical_triples':0,'diagonal_triples':0,'polygon_triples':0,'zero_triples':0,'failures':[]}
 cols=[column(t) for t in range(6)]
 for q in range(1,31):
  for r in [False,True]:
   a,n,p=frame([False]*(q-1)+[True,r]);assert a==3 and n==3*q+(1 if r else 2)
   out['sources']+=1
   for j in range(q+1):
    d=n-2*j-1
    for t in range(n+2):
     v=p.get((t+3,j),0);w=sum(C(d,k)*kernel(j,t,k) for k in range(t+1))
     out['lift_comparisons']+=1;out['zeros']+=v==0
     if v!=w:out['failures'].append(['lift',q,r,j,t,v,w])
    for t,poly in enumerate(cols):
     v=p.get((t+3,j),0);w=ev(poly,n,j);out['column_comparisons']+=1
     if v!=w:out['failures'].append(['column',q,r,j,t,v,str(w)])
    tests=[('horizontal',[(i,j),(i+1,j),(i+2,j)]) for i in range(4,7)]
    if j+2<=q:
     tests += [('vertical',[(i,j),(i,j+1),(i,j+2)]) for i in range(6,9)]
     tests += [('diagonal',[(i,j+2),(i+1,j+1),(i+2,j)]) for i in range(4,7)]
    for name,points in tests:
     abc=[p.get(z,0) for z in points];out[name+'_triples']+=1
     out['zero_triples']+=0 in abc
     out['polygon_triples']+=all(3*n<=n*i+3*k and i+k<=n+2 for i,k in points)
     if abc[0]*abc[2]>abc[1]**2:out['failures'].append([name,q,r,points,abc])
 out['seconds']=time.monotonic()-start
 (O/'source-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
