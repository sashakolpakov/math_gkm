"""Machine-authored exact randomized refined ULC tests; not a proof."""
from math import comb
import random,json,pathlib,time
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def H(a,j,s,q):return C(a-q,s)*C(s+q-1,q)*C(2*s,j-q)
t=time.monotonic(); rng=random.Random(70745);fail=[];ct=0;nonzero=0;params=[]
for z in range(5000):
 a=rng.randrange(4,1200);s=rng.randrange(1,min(a-1,120));j=rng.randrange(2*a+1)
 qlo=max(0,j-2*s-4);qhi=min(a-s,j)
 if qlo>qhi:continue
 k=rng.randrange(2*qlo,2*qhi+1)
 lo=max(qlo,k-qhi);hi=min(qhi,k-qlo)
 mm=lr=0
 for q in range(lo,hi+1):
  r=k-q
  mm+=H(a,j,s+1,q)*H(a,j,s+1,r)
  lr+=H(a,j,s,q)*H(a,j,s+2,r)
 ct+=1;nonzero+=bool(mm or lr)
 gap=(s+1)*(a-s-1)*mm-(s+2)*(a-s)*lr
 if gap<0:fail.append(dict(a=a,s=s,j=j,k=k,mid=mm,ends=lr,gap=gap));break
 params.append([a,j,s,k])
rec=dict(status='finite seeded exact computation',seed=70745,attempts=5000,tested=ct,nonzero=nonzero,failures=fail,parameters=params,seconds=time.monotonic()-t)
pathlib.Path('evidence/markov-be07ef75/ultra-random.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps({k:v for k,v in rec.items() if k!='parameters'}),flush=True)
