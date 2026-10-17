"""Machine-authored c3e5369f. Exact finite two-slot cut-gap candidate test."""
from fractions import Fraction as F
from math import comb
from pathlib import Path
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-c3e5369f')
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def lift(j,t,k):
 m=t-k
 return C(t+m+3,m)*(C(t+j+3,t+m+3)+4*C(t+j+4,t+m+5)) if 0<=k<=t else 0
def kernel(q,r,t):
 d=q-(6 if r else 5);j=q+3;c0=96 if r else 72;c1=44*q-108 if r else 28*q-44
 c2=4*(q-1)*(q-2) if r else 2*q*(q-1)
 a=[F(lift(j,t,k)) for k in range(t+1)]
 a[t]+=F(c0*max(d-t,0),t+1)+c1
 if t:a[t-1]+=c2
 return a
def conv(a,b,h,k):return sum((a[i]*b[k-i] for i in range(h,len(a)) if h<=k-i<len(b)),F(0))
def run():
 start=time.monotonic();out={'status':'finite candidate checks only, not a theorem','q_values':[5,6,7,8,10,12,16,20,24],
 'parameters':0,'cut_coefficients':0,'weighted_comparisons':0,'failures':[]}
 for q in out['q_values']:
  for r in [False,True]:
   d=q-(6 if r else 5)
   if d<0:continue
   for t in range(4,d+2):
    a,b,c=[kernel(q,r,t+s) for s in range(3)];out['parameters']+=1
    for h in range(t+3):
     for k in range(2*t+4):
      gap=conv(b,b,h,k)-conv(a,c,h,k);out['cut_coefficients']+=1
      if gap<0 and len(out['failures'])<12:out['failures'].append({'q':q,'r':r,'t':t,'h':h,'k':k,'gap':str(gap)})
    vals=[sum(C(d,k)*p[k] for k in range(len(p))) for p in [a,b,c]]
    out['weighted_comparisons']+=1
    if vals[1]**2<vals[0]*vals[2]:out['failures'].append({'weighted':True,'q':q,'r':r,'t':t})
   (O/'two-slot-progress.json').write_text(json.dumps(out,indent=2)+'\n')
 out['seconds']=time.monotonic()-start
 (O/'two-slot-experiment.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':run()
