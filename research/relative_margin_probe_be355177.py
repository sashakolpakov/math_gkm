"""Machine-authored be355177. Challenge a stronger complete-kernel margin."""
from transposed_stress_be355177 import C,conv,O
import json,time
start=time.monotonic();out=dict(status='finite exact test, not a theorem',complete_coefficients=0,complete_failures=[],pair_checks=0,pair_failures=[],pair_failure_count=0)
def L(j,t,m):return C(t+m+3,m)*(C(t+j+3,t+m+3)+4*C(t+j+4,t+m+5))
for j in range(1,81):
 for s in list(range(21))+[30,50,100]:
  A,B,D=[[L(j,s+t,m) for m in range(j+1)] for t in range(3)]
  ac=conv(A,D);bb=conv(B,B)
  for n,(x,y) in enumerate(zip(ac,bb)):
   out['complete_coefficients']+=1
   gap=A[0]*D[0]*y-B[0]**2*x
   if gap<0 and len(out['complete_failures'])<10:out['complete_failures'].append([j,s,n,gap])
  for i in range(j+1):
   for k in range(i,j+1):
    out['pair_checks']+=1
    gap=2*A[0]*D[0]*B[i]*B[k]-B[0]**2*(A[i]*D[k]+A[k]*D[i])
    if gap<0:
     out['pair_failure_count']+=1
     if len(out['pair_failures'])<10:out['pair_failures'].append([j,s,i,k,gap])
out['seconds']=time.monotonic()-start
(O/'relative-margin-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
