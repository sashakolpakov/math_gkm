"""Machine-authored stabilized fourth-slice tail experiment; not a Lean theorem."""
from pathlib import Path
from fractions import Fraction as F
from math import comb,gcd
import json,time
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,coerce,serialize
from probe_shift_f2da221d import load,subst
from experiment_8833 import backward,polyguard
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-8067e0c5'
start=time.monotonic()
rows=[load(x['numerator']) for x in json.loads((R/'evidence/markov-6604cff8/fourth-rational-normalization.json').read_text())['rows']]
s0=load(json.loads((R/'evidence/markov-0b212317/compact-low-candidates.json').read_text())['shape'])
s1=load(json.loads((R/'evidence/markov-cc599cf1/linear-factor.json').read_text())['shape'])
s2=[load(p) for p in json.loads((O/'second-block-probe.json').read_text())['second_shapes']]
s3=[load(p) for p in json.loads((O/'third-block-probe.json').read_text())['third_shapes']]
bounds=[(0,1),(1,4),(1,3),(1,2),(2,3),(3,4),(1,1)]
result=dict(status='Exact symbolic tail candidates and finite checks; not a formal source theorem',minimum_run=7,starting_offsets=list(range(6)),charts=[],finite_checks=0)
allvals=[]
for t,((p,q),(s,u)) in enumerate(zip(bounds,bounds[1:])):
 vals=[]
 for k in range(8):
  v=subst(s0,[N,Z,C,N*C+Rr,4*N+k,T,U,X])+subst(s1,[N,Z,C,Rr,3*N+k,T,U,X])+subst(s2[int(t>=3)],[N,Z,C,Rr,2*N+k,T,U,X])+subst(s3[t],[N,Z,C,Rr,N+k,T,U,X])
  v+=P({tuple(0 if i in [1,7] else e for i,e in enumerate(ks)):z*315*comb(7+k-ks[-1],7) for ks,z in rows[t].items() if ks[1]==4 and ks[-1]<=k}) if False else coerce(0)
  # Sum rather than dictionary overwrite: several X-degrees share other exponents.
  for ks,z in rows[t].items():
   if ks[1]==4 and ks[-1]<=k:
    v+=P({tuple(0 if i in [1,7] else e for i,e in enumerate(ks)):z*315*comb(7+k-ks[-1],7)})
  assert all(ks[0]==0 for ks in v),(t,k,'unexpected run dependence')
  vals.append(v)
 allvals.append(vals)
 chartvals=[subst(v,[N,Z,q*(C+1)+u*(Rr+1),p*(C+1)+s*(Rr+1),Q,T,U,X]) for v in vals]
 gaps=[chartvals[k+1]**2-chartvals[k]*chartvals[k+2] for k in range(6)]
 rec=dict(chamber=t,left=[p,q],right=[s,u],run_independent=True,values=[serialize(v) for v in vals],nonnegative_values=all(v>=0 for z in chartvals for v in z.values()),gap_terms=[len(g) for g in gaps],negative_gap_terms=[sum(v<0 for v in g.values()) for g in gaps],gaps=[serialize(g) for g in gaps])
 result['charts'].append(rec)
 (O/'tail-probe.json').write_text(json.dumps(result,indent=2)+'\n')
 print({k:v for k,v in rec.items() if k not in ['values','gaps']},flush=True)
def ev(p,c,r):return sum(v*c**ks[2]*r**ks[3] for ks,v in p.items())
inputs=[(n,c,r) for c in range(5,18) for r in range(1,c) if gcd(c,r)==1 for n in [7,12,31]]
for n,c,r in inputs:
 t=next(t for t,((p,q),(s,u)) in enumerate(zip(bounds,bounds[1:])) if p*c<q*r and u*r<s*c)
 a=n*c+r;b=a+c;raw=backward([(k+1)*a//b-k*a//b for k in range(1,b)],4)
 for k in range(8):
  assert ev(allvals[t][k],c,r)==7560*raw.get(4*n+k,0),(n,c,r,k)
  result['finite_checks']+=1
result.update(inputs=inputs,seconds=time.monotonic()-start,failures=[])
(O/'tail-probe.json').write_text(json.dumps(result,indent=2)+'\n')
print('Finite tail checks',result['finite_checks'],flush=True)
