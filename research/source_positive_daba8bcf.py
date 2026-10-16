"""Machine-authored direct source comparisons; finite experiments only."""
from pathlib import Path
from math import comb
import json,time
from three_probe_9e205206 import frame
O=Path('/Users/sasha/math_gkm/evidence/markov-daba8bcf')
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def candidate(n,i,j):
 if i<3:return 0
 t=i-3
 return C(n-j-1,t)*C(t+j+3,j)+4*sum((j-s)*C(n-2*j+s-1,t)*C(t+s+3,s) for s in range(j))
def main():
 start=time.monotonic();o={'status':'finite exact direct source experiment, not proof',
 'q_max':40,'sources':0,'coefficient_comparisons':0,'zero_comparisons':0,'polygon_positive_checks':0,'horizontal_triples':0,'failures':[]}
 for q in range(1,41):
  for r in [False,True]:
   a,n,p=frame([False]*(q-1)+[True,r]);assert a==3 and n==3*q+(1 if r else 2)
   o['sources']+=1
   for j in range(q+1):
    for i in range(n+6):
     v=p.get((i,j),0);w=candidate(n,i,j);o['coefficient_comparisons']+=1
     if v==0:o['zero_comparisons']+=1
     if v!=w:o['failures'].append(['coeff',q,r,i,j,v,w])
     if 3*n<=n*i+3*j and i+j<=n+2:
      o['polygon_positive_checks']+=1
      if v<=0:o['failures'].append(['positive',q,r,i,j,v])
     abc=[p.get((i+s,j),0) for s in range(3)]
     o['horizontal_triples']+=1
     if abc[0]*abc[2]>abc[1]**2:o['failures'].append(['lc',q,r,i,j,abc])
 o['seconds']=time.monotonic()-start
 (O/'source-positive.json').write_text(json.dumps(o,indent=2)+'\n');print(json.dumps(o))
if __name__=='__main__':main()
