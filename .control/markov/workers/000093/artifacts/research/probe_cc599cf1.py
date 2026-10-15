"""Machine-authored exact symbolic experiments; none are proof premises."""
from pathlib import Path
from fractions import Fraction as F
from math import comb
import json,time
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,coerce,serialize
from probe_shift_f2da221d import subst,load
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-cc599cf1'
def main():
 start=time.monotonic()
 parts=[load(p) for p in json.loads((R/'evidence/markov-0b212317/compact-low-candidates.json').read_text())['parts']]
 coeffs=[sum((parts[k]*comb(7+j-k,7) for k in range(min(j,12)+1)),coerce(0)) for j in range(7)]
 vals=[subst(p,[N,Z,C,4*C+Rr,Q,T,U,X]) for p in coeffs]
 delta=16*(C-Rr)*(5*C+Rr-13)*(5*C+Rr-14)*(5*C+Rr-15)
 gap=vals[5]**2-vals[4]*(vals[6]+delta)
 rows=[]
 for rv,cv,label in [(Rr+1,Rr+C+2,'c>=2'),(Rr+4,Rr+C+5,'r>=4'),(coerce(3),C+5,'r=3'),(coerce(2),C+5,'r=2'),(coerce(1),C+5,'r=1')]:
  p=subst(gap,[N,Z,cv,rv,Q,T,U,X]); neg=sum(v<0 for v in p.values())
  rows.append(dict(case=label,terms=len(p),negative_terms=neg,polynomial=serialize(p)))
  print(label,len(p),neg,flush=True)
 (O/'run-four-probe.json').write_text(json.dumps(dict(rows=rows,seconds=time.monotonic()-start,status='Exact symbolic experiment only'),indent=2)+'\n')
 # Check how many shift groups are common to all six chambers.
 data=json.loads((R/'evidence/markov-6604cff8/fourth-rational-normalization.json').read_text())['rows']
 groups=[]
 for z in range(5):
  pp=[P({tuple(k[:1]+[0]+k[2:]):F(v) for k,v in row['numerator'] if k[1]==z}) for row in data]
  groups.append(dict(z=z,common=all(p==pp[0] for p in pp),terms=[len(p) for p in pp],xmin=[min(k[-1] for k in p) if p else None for p in pp],xmax=[max(k[-1] for k in p) if p else None for p in pp],polynomial=serialize(pp[0]) if all(p==pp[0] for p in pp) else None))
 print('shift groups',[(g['z'],g['common'],g['terms'],g['xmin'],g['xmax']) for g in groups],flush=True)
 (O/'shift-groups.json').write_text(json.dumps(dict(groups=groups,status='Experimental expressions; formal identification required'),indent=2)+'\n')
if __name__=='__main__':main()
