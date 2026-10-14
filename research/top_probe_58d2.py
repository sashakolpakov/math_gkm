"""Machine-authored exact top-layer experiment. Finite tests are not proofs."""
import pathlib,json,math,time
from ambient_transfer_probe_5c90 import transfer
def choose(n,k):return math.comb(n,k) if 0<=k<=n else 0
t=time.monotonic();counts=dict(fractions=0,triples=0,identities=0,small=0);fail=[]
for a in range(1,81):
 for b in range(a+1,101):
  if math.gcd(a,b)!=1:continue
  d=a+b-1;N=b-1;B=a-1
  w=[a*k//b<a*(k+1)//b for k in range(b)][1:-1]
  p=transfer(w) if b<=20 else None
  counts['fractions']+=1
  for j in range(d-1):
   i=d-2-j
   if a*b>b*i+a*j:continue
   R=choose(d,j)
   M=N*choose(d-2,j)+B*choose(d-2,j-1)
   L=(N*(N-1)*choose(d-4,j)+2*(a*b-4*a+2)*choose(d-4,j-1)+B*(B-1)*choose(d-4,j-2))//2 if d>=4 else None
   if L is None:counts['small']+=1;continue
   gap=(N-1)*M*M-2*N*L*R
   counts['triples']+=1
   if gap<0:fail.append(dict(a=a,b=b,i=i,j=j,gap=gap))
   if p is not None:
    actual=[p.get((i+j-a+k,j),0) for k in range(3)]
    assert actual==[L,M,R],(a,b,i,j,actual,[L,M,R])
    counts['identities']+=1
rec=dict(status='finite exact experiment only',bounds=dict(a_max=80,b_max=100,transfer_b_max=20),counts=counts,failures=fail,seconds=time.monotonic()-t)
pathlib.Path('evidence/markov-58d2f411/top-probe.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec))
