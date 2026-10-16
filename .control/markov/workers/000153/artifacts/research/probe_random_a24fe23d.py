"""Machine-authored a24fe23d. Seeded exact midpoint probe."""
from probe_a24fe23d import H,O
import random,json
rng=random.Random(24023); failures=[]; checks=0
for _ in range(60000):
 a=rng.randrange(3,501);j=rng.randrange(2*a+1);s=rng.randrange(1,a-1)
 q=rng.randrange(a-s+1);r=rng.randrange(a-s-1)
 lhs=H(a,j,s,q)*H(a,j,s+2,r)
 if not lhs:continue
 k=(q+r)//2;rhs=H(a,j,s+1,k)*H(a,j,s+1,q+r-k);checks+=1
 if lhs>rhs:
  failures.append([a,j,s,q,r,str(lhs),str(rhs)])
  if len(failures)>=5:break
d={'seed':24023,'checks':checks,'failures':failures,'status':'finite exact experiment only'}
(O/'pell-random.json').write_text(json.dumps(d,indent=2)+'\n');print(json.dumps(d))
