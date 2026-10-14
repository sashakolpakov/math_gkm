"""Machine-authored exact finite probe. No experiment is a proof."""
import pathlib,json,math,time
from ambient_transfer_probe_5c90 import transfer
def choose(n,k):return math.comb(n,k) if 0<=k<=n else 0
t=time.monotonic();counts=dict(fractions=0,triples=0,polygon_triples=0,identities=0,zero_products=0,small=0);fail=[];strong=[]
for a in range(1,101):
 for b in range(a+1,121):
  if math.gcd(a,b)!=1:continue
  d=a+b-1;N=b-1;B=a-1
  w=[a*k//b<a*(k+1)//b for k in range(b)][1:-1]
  p=transfer(w) if b<=25 else None
  counts['fractions']+=1
  for i in range(d-1):
   j=d-2-i;inside=a*b<=b*i+a*j
   if d<4:counts['small']+=1;continue
   R=choose(d,i)
   M=N*choose(d-2,i-1)+B*choose(d-2,i)
   twiceL=N*(N-1)*choose(d-4,i-2)+2*(a*b-4*a+2)*choose(d-4,i-1)+B*(B-1)*choose(d-4,i)
   assert twiceL%2==0
   L=twiceL//2;gap=M*M-L*R
   counts['triples']+=1;counts['polygon_triples']+=inside;counts['zero_products']+=L*R==0
   if gap<0:fail.append(dict(a=a,b=b,i=i,j=j,gap=gap))
   if inside and M*M<2*L*R and len(strong)<10:strong.append(dict(a=a,b=b,i=i,j=j,coefficients=[L,M,R]))
   if p is not None:
    actual=[p.get((i+j-a+k,j+k),0) for k in range(3)]
    assert actual==[L,M,R],(a,b,i,j,actual,[L,M,R])
    counts['identities']+=1
rec=dict(status='finite exact experiment only',bounds=dict(a_max=100,b_max=120,transfer_b_max=25),counts=counts,failures=fail,factor_two_failures=strong,seconds=time.monotonic()-t)
pathlib.Path('evidence/markov-b5dbe087/vertical-probe.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec))
