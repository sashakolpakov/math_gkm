"""Machine-authored third shifted block certificates, symbolic experiments only."""
from pathlib import Path
from fractions import Fraction as F
from math import factorial
import json,time
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,coerce,serialize
from probe_shift_f2da221d import load,subst
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-8067e0c5'
start=time.monotonic()
rows=[load(x['numerator']) for x in json.loads((R/'evidence/markov-6604cff8/fourth-rational-normalization.json').read_text())['rows']]
shape0=load(json.loads((R/'evidence/markov-0b212317/compact-low-candidates.json').read_text())['shape'])
shape1=load(json.loads((R/'evidence/markov-cc599cf1/linear-factor.json').read_text())['shape'])
shape2=[load(p) for p in json.loads((O/'second-block-probe.json').read_text())['second_shapes']]
def toshape(p,zdegree):
 out=coerce(0)
 for ks,v in p.items():
  if ks[1]!=zdegree:continue
  k=ks[-1];z=coerce(v*F(315,factorial(7)))
  for a in range(7):z*=Q+7-k-a
  for i,a in enumerate(ks[:-1]):
   if a and i!=1:z*=[N,Z,C,Rr,Q,T,U][i]**a
  out+=z
 return out
shape3=[toshape(p,3) for p in rows]
bounds=[(0,1),(1,4),(1,3),(1,2),(2,3),(3,4),(1,1)]
result=dict(status='Exact symbolic candidate certificates only; missing formal source bridge',third_shapes=[serialize(s) for s in shape3],charts=[])
(O/'third-block-probe.json').write_text(json.dumps(result,indent=2)+'\n')
for t,((p,q),(s,u)) in enumerate(zip(bounds,bounds[1:])):
 cv=q*(C+1)+u*(Rr+1);rv=p*(C+1)+s*(Rr+1)
 vals=[]
 for i in range(3):
  v=subst(shape0,[N,Z,C,N*C+Rr,3*N+Q+i,T,U,X])+subst(shape1,[N,Z,C,Rr,2*N+Q+i,T,U,X])+subst(shape2[int(t>=3)],[N,Z,C,Rr,N+Q+i,T,U,X])+subst(shape3[t],[N,Z,C,Rr,Q+i,T,U,X])
  vals.append(subst(v,[Q+T+7,Z,cv,rv,Q+7,T,U,X]))
 gap=vals[1]**2-vals[0]*vals[2]
 rec=dict(chamber=t,left=[p,q],right=[s,u],meaning='n=J+E+7, k=J+7, j=3n+k; c=q(C+1)+u(R+1), r=p(C+1)+s(R+1); C,R,J,E nonnegative',value_terms=[len(v) for v in vals],gap_terms=len(gap),negative_terms=sum(v<0 for v in gap.values()),gap=serialize(gap),values=[serialize(v) for v in vals])
 result['charts'].append(rec);result['seconds']=time.monotonic()-start
 (O/'third-block-probe.json').write_text(json.dumps(result,indent=2)+'\n')
 print({k:v for k,v in rec.items() if k not in ['gap','values']},flush=True)
print('Complete',time.monotonic()-start,flush=True)
