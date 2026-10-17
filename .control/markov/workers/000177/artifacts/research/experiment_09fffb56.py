"""Machine-authored exact finite checks. Experiments are not proofs."""
from pathlib import Path
from fractions import Fraction as F
from math import comb
import json,time,random
from three_probe_9e205206 import frame
from transposed_stress_be355177 import kernel,C
from source_experiment_6576ccc5 import correction
from source_experiment_9647c1ba import L
O=Path('/Users/sasha/math_gkm/evidence/markov-09fffb56')
def parts(d,k,r,s):
 j=d+3*k+2+int(r);a=1+int(r)
 B=C(j+s+3,s+3)+4*C(j+s+4,s+5)
 E0=4*(a*C(k+s+4,s+4)+(3-a)*C(k+s+3,s+4))
 E1=4*(s+3)*(a*C(k+s+4,s+5)+(3-a)*C(k+s+3,s+5))
 return B,F(E0*max(d-s,0),s+1)+E1
def run():
 start=time.monotonic();out=dict(status='finite exact experiment, not proof',rows=0,coefficients=0,zeros=0,triples=0,polygon_triples=0,bounds=0,failures=[])
 for q in list(range(2,26))+[30,40,55]:
  for r in [False,True]:
   a,b,p=frame([False]*(q-1)+[True,r])
   for k in range((q-(2 if r else 1))//2+1):
    d=q-2*k-(2 if r else 1);j=q+k+1;out['rows']+=1;vals=[]
    for i in range(b+6):
     raw=p.get((i,j),0);vals.append(raw);out['coefficients']+=1;out['zeros']+=raw==0
     if raw!=L(d,j,i-3)+correction(d,k,i-2,r):out['failures'].append(['source identity',q,r,k,i])
     if i>=6:
      s=i-3;K=kernel(d,k,r,s)
      if sum(C(d,h)*v for h,v in enumerate(K))!=(s+1)*raw:out['failures'].append(['weighting',q,r,k,i])
      out['bounds']+=1;D=C(s+9,4)
      if D*raw>(D+s+3)*L(d,j,s):out['failures'].append(['new source bound',q,r,k,i])
    for i in range(len(vals)-2):
     valid=all(a*b<=b*x+a*j and x+j<=a+b-1 for x in range(i,i+3))
     out['triples']+=1;out['polygon_triples']+=valid
     if vals[i]*vals[i+2]>vals[i+1]**2:out['failures'].append(['raw LC',q,r,k,i,valid])
  (O/'source-progress.json').write_text(json.dumps(out,indent=2)+'\n')
 out['seconds']=time.monotonic()-start
 (O/'source-experiment.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out),flush=True)
 start=time.monotonic();rng=random.Random(0x09fffb56)
 scan=dict(status='finite exact auxiliary experiment, not proof',budget_checks=0,top_scalar_checks=0,clamp_zero=0,clamp_positive=0,failures=[],max_ratio=['0',None])
 cases=[(d,k,r,s) for d in list(range(15))+[30,100,1000] for k in list(range(15))+[30,100,1000] for r in [False,True] for s in list(range(3,21))+[30,50,100]]
 cases += [(rng.randrange(100001),rng.randrange(100001),bool(rng.randrange(2)),rng.randrange(3,101)) for _ in range(1000)]
 for d,k,r,s in cases:
  b,u=parts(d,k,r,s);D=C(s+9,4);scan['budget_checks']+=1
  scan['clamp_zero' if d<=s else 'clamp_positive']+=1
  ratio=D*u/((s+3)*b)
  if ratio>F(scan['max_ratio'][0]):scan['max_ratio']=[str(ratio),[d,k,r,s]]
  if ratio>1:scan['failures'].append(['budget',d,k,r,s,str(ratio)])
  if s<=d+3*k+2+int(r):
   b1,_=parts(d,k,r,s+1);b2,u2=parts(d,k,r,s+2);scan['top_scalar_checks']+=1
   if (b+u)*(b2+u2)>b1*b1:scan['failures'].append(['top scalar',d,k,r,s])
 scan['seconds']=time.monotonic()-start
 (O/'budget-experiment.json').write_text(json.dumps(scan,indent=2)+'\n');print(json.dumps(scan),flush=True)
if __name__=='__main__':run()
