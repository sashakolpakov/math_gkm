"""Machine-authored next-boundary symbolic experiment. No Lean inequality is asserted."""
from pathlib import Path
from math import comb
import json,time
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,coerce,serialize
from probe_shift_f2da221d import load,subst
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-5dc9c88d'
shapes=[load(p) for p in json.loads((R/'evidence/markov-00a02b28/middle-symbolic.json').read_text())['middle_shapes']]
rows=[load(x['numerator']) for x in json.loads((R/'evidence/markov-6604cff8/fourth-rational-normalization.json').read_text())['rows']]
start=time.monotonic();result=dict(status='Symbolic candidate certificates; not proofs',charts=[])
for name,ch,cv,rv in [('low_general',0,2*Rr+C+5,Rr+2),('low_one',0,C+5,coerce(1)),('high_general',3,2*C+Rr+5,C+Rr+3),('high_one',3,Rr+5,Rr+4)]:
 vals=[];corrections=[]
 for k in range(1,8):
  cor=coerce(0)
  for ks,v in rows[ch].items():
   if ks[1]!=2:continue
   d=13-ks[7];j=5-k
   if 0<=d<=j:
    cor+=P({tuple(0 if i in [1,7] else e for i,e in enumerate(ks)):v*5040*comb(7+j-d,7)})
  v=subst(shapes[ch],[N,Z,C,Rr,2*N+k,T,U,X])+cor
  corrections.append(serialize(cor))
  vals.append(subst(v,[N+7,Z,cv,rv,Q,T,U,X]))
 gaps=[vals[i+1]**2-vals[i]*vals[i+2] for i in range(5)]
 row=dict(name=name,chamber_representative=ch,run='N+7',values=[serialize(v) for v in vals],corrections=corrections,gaps=[serialize(v) for v in gaps],gap_terms=[len(g) for g in gaps],negative_terms=[sum(v<0 for v in g.values()) for g in gaps])
 result['charts'].append(row);result['seconds']=time.monotonic()-start
 (O/'onset-candidates.json').write_text(json.dumps(result,indent=2)+'\n')
 print(name,row['gap_terms'],row['negative_terms'],flush=True)
