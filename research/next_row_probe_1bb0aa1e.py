"""Machine-authored finite checks of the proposed next row; no Lean bridge."""
from pathlib import Path
import json,time
from sparse_probe_96ada19b import solve,frame
from low_probe_e9cdd527 import l3,l4
O=Path('/Users/sasha/math_gkm/evidence/markov-1bb0aa1e')
def main():
 t=time.monotonic();out={'status':'finite next-row checks only; identities and inequalities unproved universally','checks':0,'source_checks':0,'triples':0,'failures':[],'exceptional_q1':[]}
 for q in range(1,201):
  for r in [False,True]:
   n=3*q+(1 if r else 2);a=solve(q,r,4,q+2)
   if q==1:out['exceptional_q1'].append({'branch':r,'columns2_3_4':[a[i,q+2] for i in [2,3,4]]})
   else:
    for i,b,c in [(2,0,36 if r else 24),(3,l3(q+2),44*q-152 if r else 28*q-72),(4,l4(n,q+2),(q-4)*(26*q-98) if r else 16*(q-3)**2)]:
     out['checks']+=1
     if a[i,q+2]!=b+c:out['failures'].append(['candidate',q,r,i,a[i,q+2],str(b+c)])
   if q<=12:
    p=frame([False]*(q-1)+[True,r])[2]
    for i in [2,3,4]:
     out['source_checks']+=1
     if a[i,q+2]!=p.get((i,q+2),0):out['failures'].append(['source',q,r,i])
   for i in [3,4]:
    out['triples']+=1
    z=[a[i,q+k] for k in range(3)]
    if z[0]*z[2]>=z[1]**2:out['failures'].append(['strict_lc',q,r,i,z])
 out['seconds']=time.monotonic()-t;(O/'next-row-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
