"""Machine-authored alternate onset certificate probe; exact symbolic evidence only."""
from pathlib import Path
import json
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,coerce,serialize
from probe_shift_f2da221d import load,subst
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-1b02dddc'
backs=json.loads((R/'evidence/markov-94b1de05/backward-candidates.json').read_text())
rows=json.loads((O/'onset-candidates.json').read_text())
out=[]
for row in rows:
 ch,k=row['chamber'],row['k']
 base=subst(load(backs[ch]['gap']),[N,Z,C,Rr,Q,N+7-k,U,X])
 diff=load(row['gap'])-base
 rec=dict(chamber=ch,k=k,difference_terms=len(diff),negative_terms=sum(v<0 for v in diff.values()),difference=serialize(diff))
 out.append(rec);print({a:v for a,v in rec.items() if a!='difference'})
(O/'perturbation-probe.json').write_text(json.dumps(out,indent=2)+'\n')
