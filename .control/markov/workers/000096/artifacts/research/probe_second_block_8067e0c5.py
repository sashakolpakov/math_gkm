"""Machine-authored second shifted block candidate; exact experiments, not a Lean theorem."""
from pathlib import Path
from fractions import Fraction as F
from math import factorial
import json,time
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,coerce,serialize
from probe_shift_f2da221d import load,subst
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-8067e0c5'
start=time.monotonic()
rows=[load(x['numerator']) for x in json.loads((R/'evidence/markov-6604cff8/fourth-rational-normalization.json').read_text())['rows']]
blocks=[P({tuple(0 if i==1 else e for i,e in enumerate(k)):v for k,v in p.items() if k[1]==2}) for p in rows]
assert blocks[0]==blocks[1]==blocks[2] and blocks[3]==blocks[4]==blocks[5]
shape0=load(json.loads((R/'evidence/markov-0b212317/compact-low-candidates.json').read_text())['shape'])
shape1=load(json.loads((R/'evidence/markov-cc599cf1/linear-factor.json').read_text())['shape'])
def toshape(p):
 out=coerce(0)
 for ks,v in p.items():
  k=ks[-1];z=coerce(v*F(315,factorial(7)))
  for a in range(7):z*=Q+7-k-a
  for i,a in enumerate(ks[:-1]):
   if a:z*=[N,Z,C,Rr,Q,T,U][i]**a
  out+=z
 return out
shape2=[toshape(blocks[i]) for i in [0,3]]
result=dict(status='Exact symbolic candidate certificates only; no new source bridge or universal inequality proved',second_shapes=[serialize(s) for s in shape2],second_numerators=[serialize(blocks[i]) for i in [0,3]],charts=[])
(O/'second-block-probe.json').write_text(json.dumps(result,indent=2)+'\n')
charts=[('low_r_ge_2',0,2*Rr+C+5,Rr+2),('low_r_eq_1',0,C+5,coerce(1)),('high_d_ge_2',1,2*C+Rr+5,C+Rr+3),('high_d_eq_1',1,Rr+5,Rr+4)]
for name,t,cv,rv in charts:
 vals=[]
 for i in range(3):
  s=subst(shape0,[N,Z,C,N*C+Rr,2*N+Q+i,T,U,X])+subst(shape1,[N,Z,C,Rr,N+Q+i,T,U,X])+subst(shape2[t],[N,Z,C,Rr,Q+i,T,U,X])
  vals.append(subst(s,[Q+T+6,Z,cv,rv,Q+6,T,U,X]))
 gap=vals[1]**2-vals[0]*vals[2]
 rec=dict(name=name,variables=['N','Z','C','R','J','E','U','X'],meaning='n=J+E+6, k=J+6; j=2n+k; C,R,J,E nonnegative',value_terms=[len(v) for v in vals],gap_terms=len(gap),negative_terms=sum(v<0 for v in gap.values()),gap=serialize(gap),values=[serialize(v) for v in vals])
 result['charts'].append(rec);result['seconds']=time.monotonic()-start
 (O/'second-block-probe.json').write_text(json.dumps(result,indent=2)+'\n')
 print({k:v for k,v in rec.items() if k not in ['gap','values']},flush=True)
print('Complete',time.monotonic()-start,flush=True)
