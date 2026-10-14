"""Machine-authored finite exact raw-source transfer cross-check."""
import pathlib,json,math,time
from ambient_transfer_probe_5c90 import transfer
from second_certificate_a27f import norm
out=pathlib.Path('evidence/markov-34071a88');start=time.monotonic()
count=checks=triples=0;fail=[]
for b in range(5,71):
 for a in range(1,b):
  if math.gcd(a,b)!=1:continue
  w=tuple(bool((k+1)*a//b-k*a//b) for k in range(1,b-1))
  n=b-2;m=a-1;t=int(w[0])+int(w[-1])+2*sum(w[k] and w[k+1] for k in range(len(w)-1))
  assert 0<=t<=2*m and (n<=2*m or t==0)
  F=transfer(w);N=b-1
  K=N*(N-1)*(N-2)*(N-3)
  for i in range(a-1,a+b-2):
   k=i+2-a
   if not 1<=k<=N:continue
   A=F.get((k,2),0);checks+=1
   if 2*K*A!=math.comb(N,k)*norm(k,N,m,t):fail.append(dict(kind='formula',a=a,b=b,i=i))
   if k+2<=N and a*b<=b*i+2*a:
    B=F.get((k+1,2),0);C=F.get((k+2,2),0);triples+=1
    gap=(k+1)*(N-k-1)*B*B-(k+2)*(N-k)*A*C
    if gap<0:fail.append(dict(kind='scaled_lc',a=a,b=b,i=i,coefficients=[A,B,C],gap=gap))
  count+=1
 rec=dict(status='finite exact experiment only',denominator_bound=70,sources=count,formula_checks=checks,scaled_triples=triples,failures=fail,seconds=time.monotonic()-start)
 (out/'second-source-probe.json').write_text(json.dumps(rec,indent=2)+'\n')
print(json.dumps(rec))
