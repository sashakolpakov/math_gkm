"""Machine-authored be355177. Compare exact recurrence with the new bounds.
Finite evidence only. Imports below have guarded main functions.
"""
from pathlib import Path
from fractions import Fraction as F
from math import comb
import json,time
from three_probe_9e205206 import frame
from transposed_stress_be355177 import kernel,C
from source_experiment_6576ccc5 import correction
from source_experiment_9647c1ba import L
O=Path('/Users/sasha/math_gkm/evidence/markov-be355177')
def run():
 start=time.monotonic();out=dict(status='finite exact source experiment, not a proof',q_values=list(range(2,21))+[25,35,50],rows=0,coefficients=0,zeros=0,raw_triples=0,polygon_triples=0,uniform_bound_checks=0,failures=[],witness=None)
 for q in out['q_values']:
  for r in [False,True]:
   a,b,p=frame([False]*(q-1)+[True,r])
   for k in range((q-(2 if r else 1))//2+1):
    d=q-2*k-(2 if r else 1);j=q+k+1;out['rows']+=1;vals=[]
    for i in range(b+6):
     raw=p.get((i,j),0);vals.append(raw);out['coefficients']+=1;out['zeros']+=raw==0
     pred=L(d,j,i-3)+correction(d,k,i-2,r)
     if raw!=pred:out['failures'].append(['source identity',q,r,k,i,raw,pred])
     if i>=3:
      s=i-3;K=kernel(d,k,r,s)
      w=sum(C(d,h)*v for h,v in enumerate(K))
      if w!=(s+1)*raw:out['failures'].append(['kernel weighting',q,r,k,s])
      if d<=s:
       out['uniform_bound_checks']+=1
       B=C(s+9,4)
       if B*raw>(B+3*(s+3))*L(d,j,s):out['failures'].append(['uniform bound',q,r,k,s])
    for i in range(len(vals)-2):
     valid=all(a*b<=b*x+a*j and x+j<=a+b-1 for x in range(i,i+3))
     out['raw_triples']+=1;out['polygon_triples']+=valid
     if vals[i]*vals[i+2]>vals[i+1]**2:out['failures'].append(['raw LC',q,r,k,i,valid])
    if (q,r,k)==(3,False,1):
     out['witness']=dict(path=[False,False,True,False],fraction=[a,b],j=j,columns=[6,7,8],raw=vals[6:9],gap=vals[7]**2-vals[6]*vals[8])
  (O/'source-progress.json').write_text(json.dumps(out,indent=2)+'\n')
 out['seconds']=time.monotonic()-start
 (O/'source-experiment.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':run()
