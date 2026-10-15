"""Machine-authored exact candidate positivity probe; not a proof."""
from pathlib import Path
from fractions import Fraction as F
import json,time
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,coerce,serialize
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-0b212317';start=time.monotonic()
def subst(p,vals):
 out=coerce(0);powers={(i,k):vals[i]**k for i in range(8) for k in {a[i] for a in p}}
 for ks,v in p.items():
  z=coerce(v)
  for i,k in enumerate(ks):
   if k:z=z*powers[i,k]
  out=out+z
 return out
data=json.loads((O/'compact-low-candidates.json').read_text())
s=P({tuple(k):F(v) for k,v in data['shape']})
gap=s*s-subst(s,[N,Z,C,Rr,Q-1,T,U,X])*subst(s,[N,Z,C,Rr,Q+1,T,U,X])
rows=[]
for offset in [0,1,2,5]:
 g=subst(gap,[N,Z,C+offset,(C+offset)*(Q+7)+Rr,Q+6,T,U,X])
 neg={k:v for k,v in g.items() if v<0}
 rows.append(dict(offset=offset,terms=len(g),negative_terms=len(neg),certificate=serialize(g),negative_examples=serialize(neg)[:5]))
 print(offset,len(g),len(neg),flush=True)
 (O/'compact-gap-probe.json').write_text(json.dumps(dict(status='Exact symbolic experiment, not Lean proof',gap_terms=len(gap),rows=rows,seconds=time.monotonic()-start),indent=2)+'\n')
