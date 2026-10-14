"""Machine-authored exact diagnostics, request 6a40862b; experiments only."""
import json, math, pathlib, random, time
from fractions import Fraction as F
out=pathlib.Path('evidence/markov-6a40862b')
def c(n,k):return math.comb(n,k) if 0<=k<=n else 0
def h(a,j,s,q):return c(a-q,s)*c(s+q-1,q)*c(2*s,j-q) if s>0 else int(q==j==0)
def run():
 rng=random.Random(640862); failures={}; count=0; examples={}; start=time.monotonic()
 for z in range(16000):
  a=rng.randrange(3,400);s=rng.randrange(2,a);j=rng.randrange(2*a+1);k=rng.randrange(2*(a-s)+1)
  ratios=[]; layers=[]
  for q in range(k//2+1):
   r=k-q;M=h(a,j,s,q)*h(a,j,s,r)
   D=2*M-h(a,j,s-1,q)*h(a,j,s+1,r)-h(a,j,s+1,q)*h(a,j,s-1,r)
   layers.append(D if q!=r else D//2)
   if M:
    ratios.append((q,F(D,M)))
    def am(z):return F((2*s-j+z)*(2*s-1-j+z),(a-s-z+1)*(s+z-1))
    def bp(z):return F((a-s-z)*(s+z),(2*s+2-j+z)*(2*s+1-j+z))
    rational=2-F((s-1)*(2*s+1),s*(2*s-1))*(am(q)*bp(r)+am(r)*bp(q))
    if F(D,M)!=rational:failures['ratio_identity']=dict(a=a,j=j,s=s,k=k,q=q)
  if ratios:count+=1
  bad=next(((x,y) for x,y in zip(ratios,ratios[1:]) if x[1]>y[1]),None)
  if bad and 'normalized_monotonicity' not in failures:failures['normalized_monotonicity']={'a':a,'j':j,'s':s,'k':k,'adjacent':[(q,str(v)) for q,v in bad]}
  signs=[v>0 for v in layers if v]
  if any(x and not y for x,y in zip(signs,signs[1:])) and 'single_crossing' not in failures:failures['single_crossing']=dict(a=a,j=j,s=s,k=k,layers=layers)
  if sum(layers)<0 and 'total' not in failures:failures['total']=dict(a=a,j=j,s=s,k=k,layers=layers)
  if time.monotonic()-start>35:break
 result=dict(seed=640862,trials=z+1,nonzero=count,failures=failures,seconds=time.monotonic()-start,status='finite exact experiment only')
 (out/'fiber-shape.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result))
if __name__=='__main__':run()
