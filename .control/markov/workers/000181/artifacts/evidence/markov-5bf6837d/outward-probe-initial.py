"""Machine-authored exact outward-shift experiment; not a proof."""
from probe_moments_1c65a306 import kernel,moments
from fractions import Fraction as F
from pathlib import Path
import json,time,hashlib,random
O=Path('/Users/sasha/math_gkm/evidence/markov-5bf6837d')
def birth(j,t):return F(4*j) if t==0 else F(j-t-1)+F(j,t)
def run():
 start=time.monotonic();out=dict(status='finite exact experiment',cases=0,birth_checks=0,radial_checks=0,identities=0,failures=[])
 cases=[(j,s,h) for j in range(2,40) for s in [0,1,2,7,25,1000] for h in range(1,j+1)]
 rng=random.Random(181)
 cases += [(j,s,rng.randrange(1,j+1)) for j,s in [(rng.randrange(40,200),rng.randrange(100)) for _ in range(100)]]
 for j,s,h in cases:
  f=kernel(j,s);H=h-1;N=s+j+3;y=N+1;z=F(y)-F(h,2)
  S,T,v=moments(f,h);P,U,u=moments(f,H)
  w=[f[t]*f[H-t] for t in range(H+1)]
  x=[(F(t)-F(H,2))**2 for t in range(H+1)]
  b=[birth(j,t)+birth(j,H-t) for t in range(H+1)]
  mass=sum(a*c for a,c in zip(w,b));moment=sum(a*c*d for a,c,d in zip(w,b,x));tail=2*y*f[0]*f[h]
  out['cases']+=1
  for t in range(h):
   out['birth_checks']+=1
   if (N-t)*f[t+1]!=birth(j,t)*f[t]:out['failures'].append(['birth',j,s,h,t])
  ordered=sorted(zip(x,b))
  for (x0,b0),(x1,b1) in zip(ordered,ordered[1:]):
   out['radial_checks']+=1
   if b0>b1:out['failures'].append(['radial',j,s,h,str(x0),str(x1)])
  tests=[mass+tail==2*z*S,moment+tail*(F(H,2)+1)**2==2*(z+1)*T+z*S/2,
    U*mass<=P*moment,U<=P*(F(H,2)+1)**2,(z+1)*v-z*u+z/4>=0]
  out['identities']+=2
  if not all(tests):out['failures'].append(['moment',j,s,h,tests])
 out.update(seconds=time.monotonic()-start,script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
 (O/'outward-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':run()
