"""Machine-authored next-obligation experiment; source extraction NOT proved here."""
from pathlib import Path
import json,re
from rational_third_bdee import N,P,coerce
from small_runs_fd72158c import fmt,serialize,subst
from verify_third_75ad import source,path_for,backward
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-fd72158c'
def body(file,name):
 s=(R/'research'/file).read_text();return s.split('def '+name+' ',1)[1].split(':=\n',1)[1].split('\n',1)[0].strip().replace('^','**')
sec=body('MarkovSecondShape07F1.lean','secondShape07F1')
t0=body('MarkovTailShape53D.lean','thirdTailCoeff053D')
t1=body('MarkovTailShape53D.lean','thirdTailCoeff153D')
def ev(s,j=0):return coerce(eval(s,{'__builtins__':{}},dict(n=N,c=2,r=1,q=0,j=j)))
a=[ev(sec,2*N+k) for k in [1,2,3,4]]
a[2]+=15*ev(t0)-90*(2*N+2)-180
a[3]+=90*ev(t0)+15*ev(t1)-90*(6*N+2)-180
gaps=[a[1]**2-a[0]*a[2],a[2]**2-a[1]*a[3]]
shifted=[subst(p,[N+4,0,0,0,0,0,0,0]) for p in gaps]
assert all(v>=0 for p in shifted for v in p.values())
checks=rawchecks=0;inputs=[]
for n in range(4,41):
 aa=2*n+1;bb=2*n+3;w=tuple((k+1)*aa//bb-k*aa//bb for k in range(1,bb));p=backward(w,3)
 vals=[sum(v*n**ks[0] for ks,v in z.items()) for z in a]
 for k,v in enumerate(vals,1):
  assert v==90*p.get(2*n+k,0),(n,k,v,p.get(2*n+k,0));checks+=1
 if n<=8:
  x,y,raw=source(path_for(aa,bb));assert (x,y)==(aa,bb)
  for k,v in enumerate(vals,1):
   assert v==90*raw.get((4-k,2*n+k),0);rawchecks+=1
 inputs.append([n,aa,bb])
out=dict(status='Exact symbolic and finite source evidence; universal source coefficient extraction remains unproved in this run',scaled_coefficients_90_raw=[fmt(p) for p in a],shifted_gaps=[fmt(p) for p in shifted],checks=checks,literal_raw_checks=rawchecks,inputs=inputs,failures=[],remaining='Extend the inherited third-band extraction to c=2 with its 6F X^(2n+3) term, then combine with the corrected source subtraction. This run proves neither universal tail identity nor its source LC.')
(O/'two-cycle-tail-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({k:v for k,v in out.items() if k!='inputs'}))
