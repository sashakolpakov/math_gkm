"""Machine-authored beca0ad5. Exact auxiliary experiments, never root evidence."""
from pathlib import Path
from math import comb
from fractions import Fraction as F
import random,json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-beca0ad5')
def conv(a,b):
 return [sum(a[i]*b[k-i] for i in range(max(0,k-len(b)+1),min(k+1,len(a)))) for k in range(len(a)+len(b)-1)]
def check(w,j,s):
 a,b,c=[[w[j-i]*comb(s+t+i+3,i) for i in range(j+1)] for t in range(3)]
 A=conv(a,c);B=conv(b,b)
 return [(n,B[n+1]*A[n]-B[n]*A[n+1]) for n in range(2*j) if B[n+1]*A[n]<B[n]*A[n+1]]
def run():
 start=time.monotonic();rng=random.Random(0xbeca0ad5)
 out=dict(status='finite auxiliary experiment only',cases=0,failures=[])
 for trial in range(2000):
  j=rng.randrange(2,16);ratios=sorted([F(rng.randrange(1,30),rng.randrange(1,10)) for _ in range(j)],reverse=True)
  w=[F(1)]
  for r in ratios:w.append(w[-1]*r)
  for s in [0,1,5]:
   out['cases']+=1;bad=check(w,j,s)
   if bad:
    out['failures'].append(dict(j=j,s=s,w=list(map(str,w)),bad=[(n,str(g)) for n,g in bad]));break
  if out['failures']:break
 out['seconds']=time.monotonic()-start
 (O/'logconcave-weight-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out),flush=True)
if __name__=='__main__':run()
