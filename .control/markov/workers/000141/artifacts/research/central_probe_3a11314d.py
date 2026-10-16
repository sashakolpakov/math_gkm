"""Machine-authored exact finite exploration; identities remain conjectures until Lean checks."""
from pathlib import Path
from math import comb
import json,sys,time
sys.path.insert(0,'research')
from experiment_interior_f1e4fe3b import raw
O=Path('evidence/markov-3a11314d')
out={'status':'finite exact experiment only','sources':0,'general_formula_checks':0,'triple_checks':0,'failures':[]}
for q in range(1,61):
 p=raw(2,2*q+1);out['sources']+=1
 vals=[p.get((i,q),0) for i in [2,3,4]]
 l,m,r=vals
 assert 6*l==(q+1)*(q+2)*(2*q+3)
 assert 30*m==q*(q+1)*(q+2)*(q+3)*(2*q+3)
 assert 336*r==q*(q-1)*(q+1)*(q+2)*(q+3)*(q+4)*(2*q+3)
 assert 1400*(m*m-l*r)==l*l*q*(q+3)*(31*q*q+93*q+100)
 out['triple_checks']+=1
 for i in range(2,2*q+4):
  pred=comb(2*i-2,i-2)*(comb(q+i+1,2*i-1)+comb(q+i,2*i-1))
  assert p.get((i,q),0)==pred,(q,i)
  out['general_formula_checks']+=1
 if q in [1,2,5,10,30,60]:out.setdefault('examples',[]).append({'q':q,'triple':vals})
(O/'central-experiments.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
