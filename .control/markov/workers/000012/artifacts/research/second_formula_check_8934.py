"""Machine-authored exact finite identity check and non-source obstruction."""
import json,pathlib,itertools,math,time
from balanced_f80 import A,B,mm
start=time.monotonic();out=pathlib.Path('evidence/markov-8934af17')
def row(w):
 p=A
 for c in w[1:]:p=mm(p,A if c=='A' else B)
 return [p[1].get((i,2),0) for i in range(len(w)+w.count('B'))]
def residual(w):
 c=row(w)
 while c and not c[-1]:c.pop()
 for _ in range(len(w)-5):
  q=[c[0]]
  for a in c[1:-1]:q.append(a-q[-1])
  assert c[-1]==q[-1]
  c=q
 return c
fail=[];checked=0
for b in range(5,13):
 for z in itertools.product('AB',repeat=b-2):
  z=''.join(z);w='A'+z+'B';m=z.count('B');n=len(z)
  s=int(z[0]=='B')+int(z[-1]=='B')+2*sum(z[i:i+2]=='BB' for i in range(n-1))
  expected=[0]*m+[2*s,(9*m*m+13*m+6)//2,3*m*m+3*m*n+4*m+3*n+3,math.comb(m+n+2,2)]
  actual=residual(w);checked+=1
  if expected!=actual:fail.append(dict(word=w,actual=actual,expected=expected))
w='AB'+'A'*16+'B';r=residual(w);cs=r[1:4]
result=dict(status='exact finite evidence only; no source refutation',checked=checked,failures=fail,
 nonsource_residual_obstruction=dict(word=w,counts=[2,19],residual=r,coefficients=cs,
  middle_square=cs[1]**2,neighbor_product=cs[0]*cs[2]),seconds=time.monotonic()-start)
(out/'second-formula-check.json').write_text(json.dumps(result,indent=2));print(json.dumps(result))
