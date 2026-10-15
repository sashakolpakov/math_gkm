"""Machine-authored candidate extraction from exact finite data; interpolation is not proof."""
from pathlib import Path
from fractions import Fraction as F
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-38ebef17'
rows=json.loads((O/'small-cycle-normalized.json').read_text())['rows'];out=[]
for c,r in [(2,1),(3,1),(3,2),(4,1),(4,3)]:
 fam={0:range(7),1:range(2,7),2:range(4,7)} if c==2 else {0:range(4),1:range(2,4)} if c==3 else {0:range(1)}
 get=lambda n:dict(next(z['numerator'] for z in rows if (z['n'],z['c'],z['r'])==(n,c,r)))
 terms=[]
 for z,ks in fam.items():
  for k in ks:
   v6,v7,v8=[F(get(n).get(z*n+k,0)) for n in [6,7,8]]
   aa=(v8-2*v7+v6)/2;bb=v7-v6-13*aa;dd=v6-36*aa-6*bb
   if aa or bb or dd:terms.append(dict(run_shift=z,x_shift=k,n_coefficients=list(map(str,[dd,bb,aa]))))
 for n in range(25):
  p={}
  for t in terms:
   j=t['run_shift']*n+t['x_shift'];v=sum(F(a)*n**k for k,a in enumerate(t['n_coefficients']));p[j]=p.get(j,0)+v
  p={j:v for j,v in p.items() if v}
  assert p==get(n),(c,r,n,p,get(n))
 out.append(dict(c=c,r=r,denominator_power=2*(4-c),shift='b=a+c',terms=terms,checked_n=list(range(25))))
(O/'small-cycle-correction-candidates.json').write_text(json.dumps(dict(status='Interpolated candidate identities, verified only for n=0..24; not Lean theorems',meaning='24 actual_cut - extrapolated_c_ge_5_quotient = 24 X^b/(1-X)^d times displayed numerator, where terms are coefficient(n) X^(run_shift*n+x_shift)',families=out),indent=2)+'\n')
print(json.dumps(out),flush=True)
