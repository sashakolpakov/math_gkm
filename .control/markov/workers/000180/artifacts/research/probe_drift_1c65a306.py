"""Machine-authored exact fourth-moment/drift experiments; no universal proof."""
from probe_moments_1c65a306 import kernel,moments
from fractions import Fraction as F
from pathlib import Path
from math import factorial
import json,time,hashlib,random
O=Path('/Users/sasha/math_gkm/evidence/markov-1c65a306')
def data(j,s,h):
 f=kernel(j,s);S,M,v=moments(f,h);p=moments(f,h-1)[2]
 z=F(s+j+4)-F(h,2)
 U=sum((F(r)-F(h,2))**4*f[r]*f[h-r] for r in range(h+1))/S
 return dict(v=v,previous=p,z=z,drift=(z+1)*v-z*p+z/4,normalized=v-p+F(1,4)+v/z,fourth=U)
def run():
 start=time.monotonic();out=dict(status='finite exact experiments; all asymptotic and monotonicity bridges remain unproved',grid_checks=0,stress_checks=0,variance_contraction_checks=0,limit_checks=0,failures=[],samples=[])
 for j in range(2,35):
  for h in range(2,j+1):
   old=None
   for s in range(35):
    d=data(j,s,h)
    if old:
     out['grid_checks']+=1
     if d['normalized']>old['normalized']:out['failures'].append(['normalized s monotonicity',j,s,h])
     defect=(old['fourth']-old['v']**2)/(old['z']**2-old['v'])
     out['variance_contraction_checks']+=1
     if old['v']-d['v']!=defect:out['failures'].append(['fourth moment identity',j,s,h])
    if d['drift']<0:out['failures'].append(['gap sign',j,s,h])
    old=d
 rng=random.Random(180)
 for it in range(400):
  j=rng.randrange(6,251);h=rng.randrange(6,j+1);s=rng.choice([0,1,2,10,100,1000,10000])
  d=data(j,s,h);e=data(j,s+1,h);out['stress_checks']+=1
  if e['normalized']>d['normalized']:out['failures'].append(['stress monotonicity',j,s,h])
  if d['drift']<0:out['failures'].append(['stress sign',j,s,h])
 for j in range(2,121):
  f=[F((1 if r==0 else 4*r)*factorial(j),factorial(j-r)) for r in range(j+1)]
  for h in range(2,j+1):
   v=moments(f,h)[2];p=moments(f,h-1)[2];L=v-p+F(1,4)
   out['limit_checks']+=1
   if L<0:out['failures'].append(['candidate limit sign',j,h,str(L)])
 for j,s,h in [(15,2,15),(20,0,20),(10,1000,10),(70,2,70)]:
  out['samples'].append(dict(j=j,s=s,h=h,**{k:str(v) for k,v in data(j,s,h).items()}))
 out['seconds']=time.monotonic()-start;out['script_sha256']=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
 (O/'drift-probe.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k!='samples'}),flush=True)
if __name__=='__main__':run()
