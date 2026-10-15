"""Machine-authored exact experiment for missing early shifted positions."""
from pathlib import Path
from math import comb
import json,time
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,coerce,serialize
from probe_shift_f2da221d import load,subst
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-04290504'
s=load(json.loads((R/'evidence/markov-0b212317/compact-low-candidates.json').read_text())['shape'])
lin=load(json.loads((R/'evidence/markov-cc599cf1/linear-factor.json').read_text())['linear'])
vals={}
for k in range(1,7):
 corr=P({})
 for ks,v in lin.items():
  if ks[-1]<=k:
   key=ks[:-1]+(0,);corr[key]=corr.get(key,0)+315*v*comb(k-ks[-1]+7,7)
 vals[k]=subst(s,[N,Z,C,N*C+Rr,N+k,T,U,X])+corr
result={'status':'Symbolic experiment only; no theorem','domain':'n>=4,c>=5,1<=r<c; k=1,2,3,4','certificates':[]}
for k in range(1,5):
 gap=vals[k+1]**2-vals[k]*vals[k+2]
 for tag,rv,cv in [('L',Rr+4,Rr+C+5),('A',coerce(3),C+5),('B',coerce(2),C+5),('D',coerce(1),C+5)]:
  p=subst(gap,[N+4,Z,cv,rv,Q,T,U,X]);v=[subst(vals[k+i],[N+4,Z,cv,rv,Q,T,U,X]) for i in range(3)]
  row=dict(k=k,chart=tag,terms=len(p),negative_terms=sum(a<0 for a in p.values()),values=[serialize(a) for a in v],gap=serialize(p))
  result['certificates'].append(row)
  print(k,tag,len(p),row['negative_terms'],flush=True)
 (O/'onset-probe.json').write_text(json.dumps(result,indent=2)+'\n')
