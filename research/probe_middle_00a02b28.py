"""Machine-authored exact symbolic middle bridge comparison. Experiments, not proofs."""
from pathlib import Path
from fractions import Fraction as F
import re,json,time
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,coerce,serialize
from probe_shift_f2da221d import load,subst
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-00a02b28'
t0=time.monotonic()
src=(R/'research/MarkovPenultimateM1B.lean').read_text()
parts=[]
for k in range(11):
 s=re.search(rf'def penPart{k}M1B .*?:=\n (.*?)\n',src).group(1)
 parts.append(eval(s.replace('^','**'),{'__builtins__':{}},dict(n=N,c=C,r=Rr,q=Q,t=T,u=U)))
backs=[load(row['shape']) for row in json.loads((R/'evidence/markov-94b1de05/backward-candidates.json').read_text())]
counts=[(0,0,0),(0,0,0),(0,3*Rr-C,0),(2*Rr-C,C-Rr,0),(2*Rr-C,C-Rr,3*Rr-2*C),(2*Rr-C,C-Rr,3*Rr-2*C)]
shapes=[]
for ch,(q,t,u) in enumerate(counts):
 v=16*subst(backs[ch],[N,Z,C,Rr,Q,4*N-Q,U,X])
 for d,p in enumerate(parts):
  w=subst(p,[N,Z,C,Rr,coerce(q),coerce(t),coerce(u),X])
  for a in range(7):w*=3*N+13-Q-d-a
  v+=w
 shapes.append(v)
assert shapes[0]==shapes[1]==shapes[2]
assert shapes[3]==shapes[4]==shapes[5]
old=json.loads((R/'evidence/markov-8067e0c5/second-block-probe.json').read_text())
charts=[('low_r_ge_2',0,2*Rr+C+5,Rr+2),('low_r_eq_1',0,C+5,coerce(1)),('high_d_ge_2',3,2*C+Rr+5,C+Rr+3),('high_d_eq_1',3,Rr+5,Rr+4)]
comparisons=[]
for name,ch,c,r in charts:
 vals=[subst(shapes[ch],[Q+T+6,Z,c,r,2*(Q+T+6)+Q+6+i,T,U,X]) for i in range(3)]
 prev=next(row for row in old['charts'] if row['name']==name)
 assert all(v==16*load(p) for v,p in zip(vals,prev['values']))
 g=vals[1]**2-vals[0]*vals[2]
 assert g==256*load(prev['gap'])
 assert all(v>=0 for v in g.values())
 comparisons.append(dict(chart=name,value_terms=[len(v) for v in vals],gap_terms=len(g),negative_terms=0,exact_forward_comparison=True,scale=16))
out=dict(status='Exact symbolic experiments; not Lean theorems',middle_shapes=[serialize(v) for v in shapes],chamber_equalities=[[0,1,2],[3,4,5]],comparisons=comparisons,meaning='The formal source adapters use 120960 times the raw coefficient. In the middle chart n=J+E+6,j=2n+J+6 with C,R,J,E nonnegative, all three new values are exactly 16 times the inherited 7560-scaled forward values. Gaps are 256 times the previous candidates.',seconds=time.monotonic()-t0)
(O/'middle-symbolic.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:v for k,v in out.items() if k!='middle_shapes'}),flush=True)
