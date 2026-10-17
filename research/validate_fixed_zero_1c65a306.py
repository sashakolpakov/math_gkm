"""Machine-authored independent numerical checks of symbolic fixed-parameter sums."""
from fractions import Fraction as F
from math import comb,factorial
from pathlib import Path
import json,time,hashlib
O=Path('/Users/sasha/math_gkm/evidence/markov-1c65a306')
def ev(p,h,k):return sum(F(v)*h**e[0]*k**e[1] for e,v in p)
def raw(j,s,t,h):
 return sum((1 if r==0 else 4*r)*(1 if h-r==0 else 4*(h-r))*
   comb(s+j-r+3,s+3)*comb(t+j-h+r+3,t+3) for r in range(h+1))
start=time.monotonic();out=dict(status='finite numerical validation only',formula_checks=0,gap_checks=0,failures=[])
for s in range(3):
 d=json.loads((O/f'fixed-parameter-s{s}.json').read_text())
 for j in range(2,51):
  for h in range(1,j+1):
   A=raw(j,s,s+2,h);B=raw(j,s+1,s+1,h)
   for name,val,fac in [('A',A,factorial(s+3)*factorial(s+5)),('B',B,factorial(s+4)**2)]:
    out['formula_checks']+=1
    if ev(d[name],h,j-h)!=val*fac:out['failures'].append(['formula',s,j,h,name])
   if h>=2:
    g=raw(j,s+1,s+1,h-1)*A-B*raw(j,s,s+2,h-1)
    out['gap_checks']+=1
    scale=factorial(s+3)*factorial(s+5)*factorial(s+4)**2
    if ev(d['shifted'],h-2,j-h)!=g*scale:out['failures'].append(['gap',s,j,h])
out['seconds']=time.monotonic()-start;out['script_sha256']=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
(O/'fixed-parameter-validation.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out),flush=True)
