"""Machine-authored proof-layout repair for the sixth scalar sign."""
from pathlib import Path
from fractions import Fraction as F
from math import lcm
from weighted_beta_symbolic_ca9709f2 import P,var,expr
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-97b019af'
raw=json.loads((O/'sixth-sign-probe.json').read_text())
p=P({tuple(k):F(v) for k,v in raw['reduced']});a,m,H,w=[var(j) for j in range(4)]
q=p.ev([a+7,m+2,3*(a+7)+(m+2)*F(1,2)+4+H,w]);scale=lcm(*(v.denominator for v in q.d.values()))
expanded=expr(q*scale,['x','y','z','w'])
def horner(p,vs):
 if not vs:return str(next(iter(p.values())))
 kmax=max(k[0] for k in p);parts={}
 for k,v in p.items():parts.setdefault(k[0],{})[k[1:]]=v
 cur=horner(parts[kmax],vs[1:])
 for k in range(kmax-1,-1,-1):
  cur=f'({cur})*{vs[0]}'
  if k in parts:cur+=f'+({horner(parts[k],vs[1:])})'
 return cur
hh=horner({k[:3]:int(v*scale) for k,v in q.d.items()},['x','y','z'])
path=R/'research/MarkovTopSixthReducedSignM97B.lean';s=path.read_text()
assert s.count(expanded)==2
s=s.replace(expanded,hh).replace('by dsimp only; unfold','by unfold')
s=s.replace('theorem sixth_reduced_positive','attribute [local irreducible] sixthReducedM97B\ntheorem sixth_reduced_positive')
path.write_text(s)
