"""Machine-authored exact integer verification of the sixth-moment route."""
from pathlib import Path
from math import comb
from fractions import Fraction as F
import json,time,hashlib
from exact_integer_experiment_73199834 import scalar,cut
from weighted_beta_symbolic_ca9709f2 import P
O=Path('/Users/sasha/math_gkm/evidence/markov-97b019af')
def run():
 start=time.monotonic();raw=json.loads((O/'sixth-probe.json').read_text())
 polys={n:P({tuple(k):F(v) for k,v in vs}) for n,vs in raw['polynomials'].items()}
 out=dict(cases=0,base_identities=0,actual_bounds=0,generator_checks=0,certificate_checks=0,groups=0,outside_quadratic=0,failures=[])
 for a in [1,2,3,6,7,8,11,20,50]:
  for r in [1,2,5,10,30,100]:
   for H in [3*a+r+4,3*a+2*r+7]:
    for m in sorted(set([0,1,2,r,r+1,2*r-2,2*r-1,2*r])):
     base=[comb(a+k-1,a-1)*comb(a+m-k-1,a-1) for k in range(m+1)]
     ds=[comb(a+k-1,a-1)*comb(H+k-1,a+2) for k in range(m+1)]
     ws=[ds[k]*ds[m-k]*cut(r,k)*cut(r,m-k) for k in range(m+1)]
     mass=sum(ws);v6=sum(w*(2*k-m)**6 for k,w in enumerate(ws))
     B=(2*a+1)*(2*a+3)*(2*a+5);N=polys['num6'].ev([a,m,H,0])
     out['cases']+=1;out['base_identities']+=1;out['actual_bounds']+=1
     if B*sum(w*(2*k-m)**6 for k,w in enumerate(base))!=N*sum(base):out['failures'].append(['base6',a,r,m,H])
     if B*v6>N*mass:out['failures'].append(['actual6',a,r,m,H])
     L1=L2=group=0
     for k,w in enumerate(ws):
      l=m-k;x=2*k-m;b=(a+k)*(H+k)*l*(H-a-3+l);d=k*(H-a-3+k)*(a+l)*(H+l)
      L1+=w*(-b*((x+2)**2-x*x)-d*((x-2)**2-x*x))
      L2+=w*(-b*((x+2)**4-x**4)-d*((x-2)**4-x**4))
      group+=w*scalar(a,H,k,l)
     out['generator_checks']+=2
     if L1>0 or L2>0:out['failures'].append(['generators',a,r,m,H])
     vals={n:p.ev([a,m,H,0]) for n,p in polys.items()}
     out['certificate_checks']+=1
     if vals['delta']*group+vals['A']*F(L1,4)+vals['C']*F(L2,16)!=vals['J']*mass+vals['K']*F(v6,64):out['failures'].append(['identity',a,r,m,H])
     if a>=7 and 2<=m<=2*r:
      out['groups']+=1;out['outside_quadratic']+=4*(m-2)>(a-3)**2
      if group<=0:out['failures'].append(['group',a,r,m,H])
 out.update(seconds=time.monotonic()-start,status='finite exact experiment only',script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
 (O/'sixth-exact-experiment.json').write_text(json.dumps(out,indent=2))
 print(json.dumps(out))
if __name__=='__main__':run()
