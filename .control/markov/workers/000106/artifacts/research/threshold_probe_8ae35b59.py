"""Machine-authored exact symbolic experiment, not a Lean proof."""
from pathlib import Path
from fractions import Fraction
from math import comb
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-8ae35b59'
data=json.loads((R/'evidence/markov-5dc9c88d/onset-candidates.json').read_text())
out=[]
for base in range(1,8):
 for ci,ch in enumerate(data['charts']):
  for k,rows in enumerate(ch['gaps'],1):
   p={}
   for key,v in rows:
    for t in range(key[0]+1):
     kk=list(key);kk[0]=t;kk=tuple(kk)
     p[kk]=p.get(kk,Fraction(0))+Fraction(v)*comb(key[0],t)*(base-7)**(key[0]-t)
   neg=[(key,str(v)) for key,v in p.items() if v<0]
   out.append(dict(n_base=base,chart=ci,start=k,nonzero_terms=sum(v!=0 for v in p.values()),negative_terms=len(neg),first_negative=neg[:2]))
(O/'threshold-probe.json').write_text(json.dumps(dict(status='Exact symbolic experiment only; coefficient-sign test is not a Lean theorem',meaning='Substitute N -> N+(n_base-7) in inherited onset gap polynomials, so n=N+n_base',results=out),indent=2)+'\n')
for base in range(1,8):
 xs=[x for x in out if x['n_base']==base]
 print(base,'nonnegative certificates',sum(x['negative_terms']==0 for x in xs),'of',len(xs),flush=True)
