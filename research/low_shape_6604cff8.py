"""Machine-authored fourth-slice interior polynomial and gap probe; not proof."""
from pathlib import Path
from fractions import Fraction as F
import json,time
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,coerce,serialize
from fourth_probe_01f51d63 import BOUNDS
O=Path('evidence/markov-6604cff8');start=time.monotonic()
d=json.loads((O/'fourth-rational-normalization.json').read_text())
low=[P({tuple(k):F(v) for k,v in z['low_numerator']}) for z in d['rows']]
assert all(z==low[0] for z in low)
shape=P()
for ks,v in low[0].items():
 nn,zz,cc,rr,qq,tt,uu,xx=ks;assert not (zz or qq or tt or uu)
 b=coerce(F(1,5040))
 for k in range(7):b=b*(Q+7-xx-k)
 shape=shape+v*N**nn*C**cc*Rr**rr*b
def subst(p,vals):
 out=coerce(0)
 powers={(i,k):vals[i]**k for i in range(8) for k in {a[i] for a in p}}
 for ks,v in p.items():
  mon=coerce(v)
  for i,k in enumerate(ks):
   if k:mon=mon*powers[i,k]
  out=out+mon
 return out
minus=subst(shape,[N,Z,C,Rr,Q-1,T,U,X]);plus=subst(shape,[N,Z,C,Rr,Q+1,T,U,X])
gap=shape**2-minus*plus
rows=[]
for ch in range(6):
 p,q=BOUNDS[ch];s,t=BOUNDS[ch+1]
 # N and Q now represent nonnegative length/index slacks; C,Rr chamber slacks.
 g=subst(gap,[N+Q+7,Z,q*(C+1)+t*(Rr+1),p*(C+1)+s*(Rr+1),Q+6,T,U,X])
 neg=P({k:v for k,v in g.items() if v<0})
 rows.append(dict(chamber=ch,terms=len(g),negative_terms=len(neg),negative_examples=serialize(neg)[:10],certificate=serialize(g)))
 print(json.dumps({k:v for k,v in rows[-1].items() if k!="certificate"}),flush=True)
 (O/'fourth-low-shape.json').write_text(json.dumps(dict(status='Exact Python candidate; universal coefficient extraction and certificate not Lean-checked',coefficient_scale=24,range='center j=t+6; n=s+t+7; s,t nonnegative; strict Farey chamber coordinates',low_shape=serialize(shape),low_shape_terms=len(shape),shape_degrees=[max(k[i] for k in shape) for i in range(8)],gap_terms=len(gap),rows=rows,seconds=time.monotonic()-start),indent=2)+'\n')
