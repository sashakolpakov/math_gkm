"""Machine-authored stress of proposed telescoping lower bounds."""
from stein_probe_ca9709f2 import solve,ev,O
from fractions import Fraction as F
import json,time
def run():
 t=time.monotonic();out=dict(cases=0,nonpositive_C=0,nonpositive_uniform=0,nonpositive_a2=0,first_failures=[])
 for a in [2,3,10,20,50,100,300,1000,10000]:
  for r in [5,10,20,30,50,100,300]:
   for m in sorted(set([r,r+1,r+r//4,r+r//2,2*r-3,2*r-2,2*r-1])):
    H=3*a+r+4;n=m-r;L=2*r-m;C,P,ff=solve(a,m,r,H)
    b=L*ev(ff,n)-4*n*(a+r)*ev(P,n)
    uniform=2*C*(L+1)+b
    a2=2*C*F(sum((k+1)*(m-k+1) for k in range(n,r+1)),(n+1)*(r+1))+b
    out['cases']+=1
    out['nonpositive_C']+=C<=0;out['nonpositive_uniform']+=uniform<=0;out['nonpositive_a2']+=a2<=0
    if C<=0 or uniform<=0 or a2<=0:
     if len(out['first_failures'])<20:out['first_failures'].append(dict(a=a,r=r,m=m,C=str(C),uniform=str(uniform),a2=str(a2)))
 out.update(seconds=time.monotonic()-t,status='finite exact experiment; auxiliary bound failures are not root refutations')
 (O/'stein-stress.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out),flush=True)
if __name__=='__main__':run()
