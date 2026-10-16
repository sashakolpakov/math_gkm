"""Machine-authored finite exact checks, not proofs or mathematical oracles."""
from pathlib import Path
from math import comb
import json,time
from sparse_probe_96ada19b import frame,solve
from alternate_shape_e9cdd527 import lower
from low_probe_e9cdd527 import l3,l4
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-1bb0aa1e'
def main():
 t=time.monotonic();out={'status':'finite exact experiments only','correction_entries':0,'raw_source_comparisons':0,'first_tail_low_formulas':0,'crossing_triples':0,'zero_crossing_triples':0,'failures':[],'exceptional_tail':[]}
 for q in range(1,41):
  for r in [False,True]:
   n=3*q+(1 if r else 2);I=n+5; a=solve(q,r,I,q+1);b=lower(n,I,q+1)
   source=frame([False]*(q-1)+[True,r])[2] if q<=12 else None
   for i in range(I+1):
    corr=0 if i<2 else (8*(-1)**(i-2) if r and q==1 else ((8 if r else 4)*comb(q-(2 if r else 1),i-2) if i-2<=q-(2 if r else 1) else 0))
    actual=a[i,q+1]-b[i,q+1];out['correction_entries']+=1
    if corr!=actual:out['failures'].append(['correction',q,r,i,corr,actual])
    if source is not None:
     out['raw_source_comparisons']+=1
     if a[i,q+1]!=source.get((i,q+1),0):out['failures'].append(['source',q,r,i])
    if r and q==1:out['exceptional_tail'].append([i,a[i,q+1],b[i,q+1],actual])
 for q in range(1,301):
  for r in [False,True]:
   n=3*q+(1 if r else 2);a=solve(q,r,4,q+1)
   for i,c in [(2,8 if r else 4),(3,8*(q-2) if r else 4*(q-1)),(4,4*(q-2)*(q-3) if r else 2*(q-1)*(q-2))]:
    base=0 if i==2 else l3(q+1) if i==3 else l4(n,q+1)
    out['first_tail_low_formulas']+=1
    if a[i,q+1]!=base+c:out['failures'].append(['low',q,r,i])
   for i in [3,4]:
    z=[a[i,q-1+k] for k in range(3)];out['crossing_triples']+=1;out['zero_crossing_triples']+=int(0 in z)
    if z[0]*z[2]>=z[1]**2:out['failures'].append(['strict_lc',q,r,i,z])
 out['seconds']=time.monotonic()-t
 (O/'tail-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
