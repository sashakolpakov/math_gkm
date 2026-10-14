"""Machine-authored exact checks of the revised degree-minus-cut alignment."""
from pathlib import Path
from math import comb
import json
from count_layers_68a4 import count
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def expected(n,e,s):
 if e==0:return int(s==0)+int(s==1)
 if e<n:return 2*C(e-1,s-1)+(e+1)*C(e-1,s-2)
 if e==n:return 3*C(e-1,s-1)+(n+2)*C(e-1,s-2)
 if e<=2*n+1:return (2*n+2-e)*C(e-1,s-2)
 return 0
tests=0;lc=0
for n in range(1,51):
 f=count((1,)*n+(0,)+(1,)*(n+1),limit=12)
 for e in range(2*n+4):
  for s in range(13):
   assert expected(n,e,s)==f.get((s,s+e),0),(n,e,s)
   tests+=1
  for s in range(11):
   assert expected(n,e,s+1)**2>=expected(n,e,s)*expected(n,e,s+2)
   lc+=1
rec=dict(status='finite exact experiment; the general aligned formula is a derivation, not a new Lean theorem',n_range=[1,50],cut_bound=12,coefficient_identities=tests,inequalities=lc,failures=[])
Path('evidence/markov-68a44d34/aligned-counts.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec))
