"""Machine-authored 9647c1ba. Exact finite source and scalar diagnostics, not proofs."""
from pathlib import Path
from fractions import Fraction as F
from math import comb
import json,time
from three_probe_9e205206 import frame
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-9647c1ba'
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def lift(j,s,m):return C(s+m+3,m)*(C(s+j+3,s+m+3)+4*C(s+j+4,s+m+5))
def L(d,j,s):return sum(C(d,s-m)*lift(j,s,m) for m in range(s+1)) if s>=0 else 0
def run():
 start=time.monotonic();out={'status':'finite exact computation only; not a universal proof',
 'q_values':list(range(1,13))+[16,24,32,48,64],'coefficients':0,'zeros':0,'triples':0,
 'polygon_triples':0,'formula_checks':0,'two_slot_checks':0,'scalar_checks':0,'endpoint_checks':0,'failures':[]}
 for q in out['q_values']:
  for r in [False,True]:
   a,b,p=frame([False]*(q-1)+[True,r]);j=q+3;d=q-(6 if r else 5)
   c0=96 if r else 72;c1=44*q-108 if r else 28*q-44;c2=4*(q-1)*(q-2) if r else 2*q*(q-1)
   vals=[p.get((i,j),0) for i in range(b+8)]
   for i,v in enumerate(vals):
    out['coefficients']+=1;out['zeros']+=v==0
    if d>=0:
     pred=L(d,j,i-3)+c0*C(d,i-2)+c1*C(d,i-3)+c2*C(d,i-4)
     out['formula_checks']+=1
     if pred!=v:out['failures'].append(['formula',q,r,i,pred,v])
     if i>=4:
      t=i-4;s=t+1;extra=F(c0*max(d-s,0),s+1)+c1
      weighted=L(d,j,s)+C(d,s)*extra+C(d,t)*c2
      out['two_slot_checks']+=1
      if weighted!=v:out['failures'].append(['weighted',q,r,i,str(weighted),v])
   for i in range(len(vals)-2):
    out['triples']+=1
    valid=all(a*b<=b*k+a*j and k+j<=a+b-1 for k in range(i,i+3))
    out['polygon_triples']+=valid
    if vals[i]*vals[i+2]>vals[i+1]**2:out['failures'].append(['raw_lc',q,r,i,vals[i:i+3],valid])
   if d>=0:
    assert vals[d+4]-L(d,j,d+1)==c2>0
    out['endpoint_checks']+=1
    for s in range(7,d+2):
     B=C(s+j+3,j);U=F(c0*d,s+1)+c1;M=lift(j,s+1,0)**2
     N=C(s+1+j+3,j)**2-B*C(s+2+j+3,j)
     out['scalar_checks']+=1
     if (2*B*U+U*U)*M>B*B*N:out['failures'].append(['margin',q,r,s])
     if c2>U*j:out['failures'].append(['slot_bound',q,r,s])
  (O/'source-progress.json').write_text(json.dumps(out,indent=2)+'\n')
 out['seconds']=time.monotonic()-start
 (O/'source-experiment.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':run()
