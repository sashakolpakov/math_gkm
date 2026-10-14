"""Machine-authored source mechanical-word polarization experiment."""
from polarization_34071 import cuts,coeff
import math,json,pathlib,itertools,time
out=pathlib.Path('evidence/markov-34071a88');t=time.monotonic();tests=0;fails=[]
for b in range(3,13):
 for a in range(1,b):
  if math.gcd(a,b)!=1:continue
  v=tuple((k+1)*a//b-k*a//b for k in range(1,b-1));w=v+(1,);n=len(w)
  assert v==v[::-1]
  d=cuts(w)
  for I in range(1<<n):
   rem=[i for i in range(n) if not I>>i&1];m=len(rem)
   for p,q in itertools.combinations(rem,2):
    for j in range(a+b):
     A,B,C,D=[coeff(d,k,j) for k in [I,I|1<<p,I|1<<q,I|1<<p|1<<q]];tests+=1
     if D and m*A*D>2*(m-1)*B*C:
      fails.append(dict(a=a,b=b,word=''.join('B' if r else 'A' for r in v),I=I,p=p,q=q,j=j,m=m,coefficients=[A,B,C,D],gap=2*(m-1)*B*C-m*A*D));break
    if fails:break
   if fails:break
  if fails:break
 if fails:break
rec=dict(status='finite test; mechanical source identification remains dependent on inherited bridge',tests=tests,failures=fails,seconds=time.monotonic()-t)
(out/'polarization-source.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec))
