"""Machine-authored 139fed75. Boundary formula and discrete derivative probes."""
from band_experiment_139fed75 import Q,O,C
from fractions import Fraction
import json,time
start=time.monotonic();out={'status':'finite exact experiments only','boundary_checks':0,'boundary_failures':[],
'difference_checks':0,'difference_failures':[]}
for k in range(51):
 for r in [False,True]:
  h=Q(2*k+(2 if r else 1),r,k)
  for m,v in enumerate(h):
   pred=Fraction(2*(3*k+m+6 if r else 3*k+3-m)*C(k+m+2,2*m+2)*C(2*m+2,m+1),2*m+3)
   out['boundary_checks']+=1
   if v!=pred:out['boundary_failures'].append([k,r,m,v,str(pred)])
for k in range(1,11):
 for q in [2*k+2,2*k+3,3*k+5]:
  for m in range(1,k+1):
   lhs=4*(m+2)*(Q(q+1,False,k)[m]-Q(q,False,k)[m])
   rhs=(k+2)*(2*Q(q,False,k-1)[m-1]+Q(q+1,True,k-1)[m-1])
   out['difference_checks']+=1
   if lhs!=rhs and len(out['difference_failures'])<10:out['difference_failures'].append([q,k,m,lhs,rhs])
out['seconds']=time.monotonic()-start
(O/'boundary-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
