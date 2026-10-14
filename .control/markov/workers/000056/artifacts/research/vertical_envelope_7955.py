"""Machine-authored follow-up algebra; finite/ symbolic evidence, not Lean proof."""
from topnext_7955 import terms,record,i,j,b
import json,pathlib
bad={};tested=0
for aa in range(1,65):
 for bb in range(aa+1,100):
  D=aa+bb-4
  if D<3:continue
  for I in range(D+1):
   J=D-I
   if bb*I+aa*J<aa*bb:continue
   for s in [0,2]:
    tested+=1;g=terms(I,J,aa-1,s)[1]
    if g<0:bad.setdefault(str(s),dict(a=aa,b=bb,i=I,j=J,gap=g))
# i=0,1,2 and B>=3; j=N+B-2-i, N=B+1+c.
cases={}
for I in [0,1,2]:
 for S in [0,2]:
  p=terms(I,2*b+j+5-I,b+3,S)[1]
  cases[f'i{I}s{S}']=record(p)
rec=dict(status='candidate certificates only; no Lean result',tests=tested,first_failures=bad,cases=cases)
pathlib.Path('evidence/markov-7955df0c/vertical-envelope.json').write_text(json.dumps(rec,indent=2)+'\n')
print(json.dumps(dict(tests=tested,first_failures=bad,cases={k:[v['terms'],len(v['negative_terms'])] for k,v in cases.items()})))
