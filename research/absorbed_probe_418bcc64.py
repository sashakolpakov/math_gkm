"""Machine-authored 418bcc64: move binomial perturbation into last surviving coefficient."""
from correction_probe_418bcc64 import C,term,mul
from fractions import Fraction as F
from pathlib import Path
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-418bcc64')
def p(j,d,c,t):
 assert t>=1
 a=[F(term(j,t-1,t-1-r)) for r in range(t)]
 a[-1]+=F(c*(d-t+1),t)
 return a
out={'status':'finite rational experiment only','checks':0,'failures':[],'extra_failures':[]};start=time.monotonic()
for j in range(4,31):
 for d,c in [(j-3,8),(j-2,4)]:
  for t in range(1,d):
   for h in range(t+2):
    a,b,e=[p(j,d,c,t+k) for k in range(3)]
    aa,bb,ee=[[v if r>=h else 0 for r,v in enumerate(z)] for z in [a,b,e]]
    g=[x-y for x,y in zip(mul(bb,bb),mul(aa,ee))]
    for k,x in enumerate(g):
     out['checks']+=1
     if x<0 and len(out['failures'])<10:out['failures'].append([j,d,c,t,h,k,str(x)])
out['seconds']=time.monotonic()-start
(O/'absorbed-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
