"""Machine-authored 418bcc64. Diagnose pre-composition gaps of the absorbed Q kernel."""
from correction_probe_418bcc64 import C,mul
from fractions import Fraction as F
from pathlib import Path
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-418bcc64')
def qp(d,j,c,t):
 a=[F((1 if k==j else 4*(j-k))*C(t+k+3,k)) for k in range(j+1)]
 a[0]+=F(c*max(d-t,0),t+1)
 return a
out={'status':'finite exact diagnostic only','nonconstant_negative':[],'first_pair_negative':[],
 'constant_negative':0,'checks':0};start=time.monotonic()
for d in range(1,45):
 for j,c in [(d+3,8),(d+2,4)]:
  for t in range(d):
   a,b,e=[qp(d,j,c,t+k) for k in range(3)]
   gap=[x-y for x,y in zip(mul(b,b),mul(a,e))]
   out['checks']+=len(gap);out['constant_negative']+=gap[0]<0
   for k,x in enumerate(gap[1:],1):
    if x<0 and len(out['nonconstant_negative'])<20:out['nonconstant_negative'].append([d,j,c,t,k,str(x)])
   if gap[0]+gap[1]<0 and len(out['first_pair_negative'])<20:out['first_pair_negative'].append([d,j,c,t,str(gap[0]),str(gap[1])])
out['seconds']=time.monotonic()-start
(O/'absorbed-q-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
