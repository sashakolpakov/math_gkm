"""Machine-authored finite exact tests of the proposed fourth-moment attachment."""
from pathlib import Path
from math import comb
import json,time
from exact_integer_experiment_73199834 import scalar,cut
def run():
 start=time.monotonic();out=dict(cases=0,base_moment_identities=0,actual_moment_bounds=0,quadratic_cases=0,beyond_old_wedge=0,failures=[])
 for a in [2,3,5,10,20,50,100]:
  for r in [5,10,20,50,100]:
   H=3*a+r+4
   for m in sorted(set([r,r+1,3*r//2,2*r-2,2*r-1,2*r])):
    W=[comb(a+k-1,a-1)*comb(a+m-k-1,a-1) for k in range(m+1)]
    t=[comb(a+k-1,a-1)*comb(H+k-1,a+2) for k in range(m+1)]
    mass=sum(W);four=sum(w*(2*k-m)**4 for k,w in enumerate(W));den=(2*a+1)*(2*a+3)
    num=m*(2*a+m)*(3*m*(2*a+m)-4*a)
    out['base_moment_identities']+=1
    if den*four!=num*mass:out['failures'].append(['base_identity',a,r,m])
    ws=[t[k]*t[m-k]*cut(r,k)*cut(r,m-k) for k in range(m+1)]
    actualmass=sum(ws);actualfour=sum(w*(2*k-m)**4 for k,w in enumerate(ws))
    out['actual_moment_bounds']+=1;out['cases']+=1
    if den*actualfour>num*actualmass:out['failures'].append(['actual_bound',a,r,m])
    if a>=3 and (a-3)**2>=4*(m-2):
     out['quadratic_cases']+=1;out['beyond_old_wedge']+=a<2*m
     group=sum(w*scalar(a,H,k,m-k) for k,w in enumerate(ws))
     if group<=0:out['failures'].append(['group',a,r,m])
 out.update(seconds=time.monotonic()-start,status='finite exact experiments; normalized-moment and covariance bridge not yet formalized')
 Path('evidence/markov-73199834/fourth-moment-experiment.json').write_text(json.dumps(out,indent=2))
 print(json.dumps(out))
if __name__=='__main__':run()
