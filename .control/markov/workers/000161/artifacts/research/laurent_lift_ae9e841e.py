"""Machine-authored exact Laurent-extension probes; not a universal proof."""
from pathlib import Path
from math import comb
from functools import lru_cache
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-ae9e841e')
def C(n,k):return comb(n,k) if 0<=k<=n else 0
@lru_cache(None)
def E(j,t,r):
 m=t-r
 if m<0 or m>j:return 0
 return C(t+m+3,m)*(C(t+j+3,t+m+3)+4*C(t+j+4,t+m+5))
def c(r):return 1 if r==0 else 4*r
def conv(a,b):
 z=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for k,y in enumerate(b):z[i+k]+=x*y
 return z
def main():
 start=time.monotonic();out={'status':'finite exact auxiliary tests only','extended_formula_checks':0,'Q_gap_coefficients':0,'laurent_gap_coefficients':0,'pair_sign_sequences':0,'failures':[]}
 for j in range(31):
  for t in range(1,2*j+5):
   for r in range(t-j-1,t+2):
    a=sum(c(j-s)*C(t+s+3,s)*C(s,t-r) for s in range(j+1));b=E(j,t,r)
    out['extended_formula_checks']+=1
    if a!=b:out['failures'].append(['extension',j,t,r,a,b])
   qs=[[c(j-s)*C(v+s+3,s) for s in range(j+1)] for v in [t-1,t,t+1]]
   aa=conv(qs[1],qs[1]);bb=conv(qs[0],qs[2])
   for k,(a,b) in enumerate(zip(aa,bb)):
    out['Q_gap_coefficients']+=1
    if a<b and len(out['failures'])<20:out['failures'].append(['Qgap',j,t,k,a-b])
   for v in range(2*(t-j-1),2*t+3):
    vals=[]
    for r in range(min(t-j-1,v-t-1),v//2+1):
     s=v-r
     z=2*E(j,t,r)*E(j,t,s)-E(j,t-1,r)*E(j,t+1,s)-E(j,t+1,r)*E(j,t-1,s)
     vals.append(z)
    out['pair_sign_sequences']+=1
    seen_positive=False;bad=False
    for z in vals:
     if z>0:seen_positive=True
     if z<0 and seen_positive:bad=True
    if bad and len(out['failures'])<20:out['failures'].append(['sign_pattern',j,t,v,vals])
    gap=sum(E(j,t,r)*E(j,t,v-r)-E(j,t-1,r)*E(j,t+1,v-r) for r in range(t-j-1,t+2))
    out['laurent_gap_coefficients']+=1
    if gap<0 and len(out['failures'])<20:out['failures'].append(['Laurentgap',j,t,v,gap])
 out['seconds']=time.monotonic()-start
 (O/'laurent-lift.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
