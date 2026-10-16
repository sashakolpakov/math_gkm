"""Machine-authored finite checks of source correspondence, zero tails, and rational certificates."""
from pathlib import Path
from fractions import Fraction
import json,sys,hashlib,time
sys.path.insert(0,'research');sys.path.insert(0,'evidence/markov')
from experiment_interior_f1e4fe3b import raw,hguard
from experiment_ac3d4ab9 import region
from experiment_37bf1d20 import sharp
from scan import initial,child,polygon
O=Path('evidence/markov-3a11314d');t=time.monotonic()
out={'status':'finite exact experiments only','independent_source_comparisons':0,'raw_triples':0,'zero_triples':0,'previous_residual_triples':0,'rational_centers':0,'failures':[]}
f=initial
for q in range(1,41):
 a,b,p=child(f,True)[1]
 assert (a,b)==(2,2*q+1)
 assert p==raw(a,b)
 out['independent_source_comparisons']+=1
 for i in range(2*q+6):
  vals=[p.get((i+s,q),0) for s in range(3)]
  assert vals[1]**2>=vals[0]*vals[2]
  out['raw_triples']+=1;out['zero_triples']+=int(0 in vals)
 L,M,R=[p.get((i,q),0) for i in [2,3,4]]
 C=1+Fraction(10,q*q+3*q+5)
 score=-8*L+8*(C-1)*(L+M)-2*(C-1)**2*(L+2*M+R)
 assert 7*(q*q+3*q+5)**2*score==L*q*(q+3)*(31*q*q+93*q+100)
 assert score>=0;out['rational_centers']+=1
 if q>=5:
  assert all(polygon(a,b,i,q) for i in [2,3,4])
  assert 2+q+4<=a+b-1 and not hguard(a,b,2,q)
  assert not region(0,2,2,2+q) and not region(0,2,2,2+q,True) and not sharp(0,2,2,2+q)
  out['previous_residual_triples']+=1
 f=child(f,False)
out['seconds']=time.monotonic()-t
out['bindings']={str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in [Path(__file__),Path('research/experiment_interior_f1e4fe3b.py'),Path('evidence/markov/scan.py')]}
(O/'source-experiments.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
