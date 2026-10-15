"""Machine-authored remaining fourth-slice certificate search; experiments only."""
from pathlib import Path
from math import comb
import json,time
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,coerce,serialize
from probe_shift_f2da221d import load,subst
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-8067e0c5'
start=time.monotonic()
rows=[load(x['numerator']) for x in json.loads((R/'evidence/markov-6604cff8/fourth-rational-normalization.json').read_text())['rows']]
s0=load(json.loads((R/'evidence/markov-0b212317/compact-low-candidates.json').read_text())['shape'])
s1=load(json.loads((R/'evidence/markov-cc599cf1/linear-factor.json').read_text())['shape'])
s2=[load(p) for p in json.loads((O/'second-block-probe.json').read_text())['second_shapes']]
bounds=[(0,1),(1,4),(1,3),(1,2),(2,3),(3,4),(1,1)]
result=dict(status='Exact symbolic candidate certificates only; no formal source bridge or universal source inequality',onsets=[],small_runs=[])
def fixedconv(p,zdegree,k):
 out=coerce(0)
 for ks,v in p.items():
  if ks[1]==zdegree and ks[-1]<=k:
   out+=P({tuple(0 if i in [1,7] else e for i,e in enumerate(ks)):v*315*comb(7+k-ks[-1],7)})
 return out
def save():
 result['seconds']=time.monotonic()-start
 (O/'remaining-probe.json').write_text(json.dumps(result,indent=2)+'\n')
for t,((p,q),(s,u)) in enumerate(zip(bounds,bounds[1:])):
 cv=q*(C+1)+u*(Rr+1);rv=p*(C+1)+s*(Rr+1)
 for block,last in [(2,5),(3,6)]:
  vals=[]
  for k in range(1,last+3):
   v=subst(s0,[N,Z,C,N*C+Rr,block*N+k,T,U,X])+subst(s1,[N,Z,C,Rr,(block-1)*N+k,T,U,X])
   if block==3:v+=subst(s2[int(t>=3)],[N,Z,C,Rr,N+k,T,U,X])
   v+=fixedconv(rows[t],block,k)
   vals.append(subst(v,[N+7,Z,cv,rv,Q,T,U,X]))
  gaps=[vals[k+1]**2-vals[k]*vals[k+2] for k in range(last)]
  rec=dict(chamber=t,block=block,run='N+7',starting_offsets=list(range(1,last+1)),value_terms=[len(v) for v in vals],negative_gap_terms=[sum(v<0 for v in g.values()) for g in gaps],gaps=[serialize(g) for g in gaps])
  result['onsets'].append(rec);save()
  print('onset',t,block,rec['negative_gap_terms'],flush=True)
 # Fixed n=4,5,6: all positions beyond the proved prefix through the polygon bound.
 for n in [4,5,6]:
  vals=[]
  for j in range(2*n+1,4*n+8):
   v=coerce(0)
   for ks,z in rows[t].items():
    shift=ks[1]*n+ks[-1]
    if shift<=j:
     v+=P({tuple(0 if i in [0,1,7] else e for i,e in enumerate(ks)):z*n**ks[0]*315*comb(7+j-shift,7)})
   vals.append(subst(v,[N,Z,cv,rv,Q,T,U,X]))
  gaps=[vals[k+1]**2-vals[k]*vals[k+2] for k in range(len(vals)-2)]
  rec=dict(chamber=t,run=n,starting_positions=list(range(2*n+1,4*n+6)),negative_gap_terms=[sum(v<0 for v in g.values()) for g in gaps],gaps=[serialize(g) for g in gaps])
  result['small_runs'].append(rec);save()
  print('small',t,n,rec['negative_gap_terms'],flush=True)
save()
print('Completed',time.monotonic()-start,flush=True)
