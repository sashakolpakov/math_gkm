"""Exact finite validation of the new Pell matching formula; not proof."""
import pathlib,json,math,time
from gas_probe_0618 import add,mul,U,V,ONE,poly
def choose(n,k):return math.comb(n,k) if 0<=k<=n else 0
t=time.monotonic();e=p=ONE;checks=0;fail=[]
for n in range(41):
 for i in range(n+3):
  for j in range(n+3):
   checks+=2
   expected=[choose(max(n-j,0),i)*choose(max(n-i,0),j),choose(max(n-j,0),i)*choose(max(n-i-1,0),j)]
   if [e.get((i,j),0),p.get((i,j),0)]!=expected:fail.append([n,i,j,expected])
 pn=add(e,mul(U,p));e,p=add(pn,mul(V,e)),pn
result=dict(status='finite exact experiment, not proof',checks=checks,failures=fail,seconds=time.monotonic()-t,formula='P_n[u^i v^j]=choose(n-j,i)*choose(n-i-1,j), truncated natural upper indices')
pathlib.Path('evidence/markov-061840e8/pell-formula-check.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result))
