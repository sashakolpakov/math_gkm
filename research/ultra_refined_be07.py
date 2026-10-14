"""Machine-authored stronger Pell gap test, literal integer arithmetic."""
import json,time,pathlib,random
from math import comb
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def H(a,j,s,q):return C(a-q,s)*C(s+q-1,q)*C(2*s,j-q)
t=time.monotonic();ct=0;fails={};random.seed(707)
samples=[(a,j,s) for a in range(3,41) for j in range(2*a+1) for s in range(1,a-1)]
samples += [(a:=random.randrange(4,180),random.randrange(2*a+1),random.randrange(1,a-1)) for _ in range(250)]
for a,j,s in samples:
 L=[H(a,j,s,q) for q in range(a-s+1)]
 M=[H(a,j,s+1,q) for q in range(a-s)]
 R=[H(a,j,s+2,q) for q in range(a-s-1)]
 def conv(x,y):
  z=[0]*(len(x)+len(y)-1)
  for k,v in enumerate(x):
   if v:
    for l,w in enumerate(y):z[k+l]+=v*w
  return z
 mm=conv(M,M);lr=conv(L,R)
 for k,(b,c) in enumerate(zip(mm,lr)):
  if not b and not c:continue
  ct+=1;v=(s+1)*(a-s-1)*b-(s+2)*(a-s)*c
  if v<0:fails.setdefault('binomial_a_coefficient',dict(a=a,j=j,s=s,k=k,middle=b,endpoints=c,gap=v))
rec=dict(status='finite exact only',samples=len(samples),nonzero_coefficients=ct,failures=fails,seconds=time.monotonic()-t)
pathlib.Path('evidence/markov-be07ef75/ultra-refined.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec),flush=True)
