"""Machine-authored exact consistency checks; not universal proof."""
import json,time,hashlib
from pathlib import Path
from fractions import Fraction
from experiment_interior_f1e4fe3b import raw
out={'status':'finite exact consistency checks, not proof','cases':[]};t=time.monotonic()
for d in range(1,9):
 s=8*d+2;b=2*s+1;p=raw(1,b);L,M,R=[p.get((i,s),0) for i in [1,2,3]]
 assert L==s+1 and 2*M==s*(s+1)*(s+2) and 12*R==s*(s-1)*(s+1)*(s+2)*(s+3)
 assert R>=4*d*(L+M) and M*M>=L*R
 W=L+2*M+R;U=2*(L+M);V=4*L+2*M;C=1+Fraction(U,W)
 def score(c):return 4*(c*U-V)-2*(c-1)**2*W
 assert score(C)>=0
 assert all(score(Fraction(z,d))<0 for z in range(-d,5*d+1))
 out['cases'].append({'d':d,'a':1,'b':b,'row':s,'triple':[L,M,R],
  'optimal_center':str(C),'optimal_score':str(score(C)),'raw_gap':M*M-L*R})
out['seconds']=time.monotonic()-t
out['script_sha256']=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
Path('evidence/markov-55306a3b/grid-experiments-reproduced.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'cases':len(out['cases']),'seconds':out['seconds']}))
