"""Machine-authored 418bcc64. Include clamped endpoint and every lower cut."""
from correction_probe_418bcc64 import C,term,mul
from fractions import Fraction as F
from pathlib import Path
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-418bcc64')
def p(j,d,c,t):
 a=[F(term(j,t,t-r)) for r in range(t+1)]
 a[-1]+=F(c*max(d-t,0),t+1)
 return a
out={'status':'finite rational experiment only','d_range':[0,40],'checks':0,'failures':[],'identities':0,'identity_failures':[]};start=time.monotonic()
for d in range(41):
 for j,c in [(d+3,8),(d+2,4)]:
  for t in range(d+3):
   ps=[p(j,d,c,t+k) for k in range(3)]
   for k,z in enumerate(ps):
    actual=sum(C(d,r)*v for r,v in enumerate(z))
    expected=sum(C(d,t+k-m)*term(j,t+k,m) for m in range(t+k+1))+c*C(d,t+k+1)
    out['identities']+=1
    if actual!=expected:out['identity_failures'].append([d,j,c,t,k])
   for h in range(t+3):
    aa,bb,ee=[[v if r>=h else 0 for r,v in enumerate(z)] for z in ps]
    g=[x-y for x,y in zip(mul(bb,bb),mul(aa,ee))]
    for k,x in enumerate(g):
     out['checks']+=1
     if x<0 and len(out['failures'])<20:out['failures'].append([j,d,c,t,h,k,str(x)])
out['seconds']=time.monotonic()-start
(O/'absorbed-clamped-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
