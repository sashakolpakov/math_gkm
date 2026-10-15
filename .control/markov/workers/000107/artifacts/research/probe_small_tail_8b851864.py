"""Machine-authored exact symbolic threshold probe; no proof assertion."""
from pathlib import Path
from fractions import Fraction
from math import comb
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-8b851864'
data=json.loads((R/'evidence/markov-1b02dddc/onset-candidates.json').read_text())
out=[]
for base in [3,4,5,6,7]:
 for ch in data:
  p={}
  for key,v in ch['gap']:
   for t in range(key[0]+1):
    kk=tuple([t]+key[1:]);p[kk]=p.get(kk,Fraction(0))+Fraction(v)*comb(key[0],t)*(base-7)**(key[0]-t)
  neg=[(key,str(v)) for key,v in p.items() if v<0]
  out.append(dict(n_base=base,chamber=ch['chamber'],start=ch['k'],nonzero_terms=sum(v!=0 for v in p.values()),negative_terms=len(neg),first_negative=neg[:2]))
d=dict(status='Exact symbolic experiment only; negative coefficients do not refute an inequality',meaning='Translate N to N+n_base-7 in final onset gaps at j=3n+k. Source validity must be checked separately.',results=out)
(O/'small-tail-thresholds.json').write_text(json.dumps(d,indent=2)+'\n')
for base in [3,4,5,6,7]:
 xs=[x for x in out if x['n_base']==base];print(base,sum(x['negative_terms']==0 for x in xs),'of',len(xs))
