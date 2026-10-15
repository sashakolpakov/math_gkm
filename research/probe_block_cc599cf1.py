"""Machine-authored whole first-shift block gap experiment, not a proof."""
from pathlib import Path
import json,time
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,coerce,serialize
from probe_shift_f2da221d import load,subst
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-cc599cf1'
def main():
 start=time.monotonic()
 s=load(json.loads((R/'evidence/markov-0b212317/compact-low-candidates.json').read_text())['shape'])
 l=load(json.loads((O/'linear-factor.json').read_text())['shape'])
 values=[subst(s,[N,Z,C,N*C+Rr,N+Q+t,T,U,X])+subst(l,[N,Z,C,Rr,Q+t,T,U,X]) for t in range(3)]
 gap=values[1]**2-values[0]*values[2]
 print('gap',len(gap),flush=True)
 result=dict(status='Symbolic experiments only; no log-concavity theorem claimed',domain='k=j-n>=5; n>=k; c>=5; 1<=r<c',gap=serialize(gap),certificates=[])
 (O/'block-gap-checkpoint.json').write_text(json.dumps(dict(terms=len(gap),seconds=time.monotonic()-start,status='gap formed, substitutions pending'),indent=2)+'\n')
 for rv,cv,label in [(Rr+4,Rr+C+5,'r>=4'),(coerce(3),C+5,'r=3'),(coerce(2),C+5,'r=2'),(coerce(1),C+5,'r=1')]:
  p=subst(gap,[Q+T+5,Z,cv,rv,Q+5,T,U,X])
  row=dict(case=label,terms=len(p),negative_terms=sum(v<0 for v in p.values()),polynomial=serialize(p))
  result['certificates'].append(row)
  print(label,row['terms'],row['negative_terms'],flush=True)
  result['seconds']=time.monotonic()-start
  (O/'block-gap-probe.json').write_text(json.dumps(result,indent=2)+'\n')
if __name__=='__main__':main()
