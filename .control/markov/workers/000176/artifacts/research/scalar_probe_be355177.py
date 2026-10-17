"""Machine-authored be355177. Exact sharp coefficient ratios versus inherited margin."""
from fractions import Fraction as F
from transposed_stress_be355177 import C,kernel,conv,O
import json,time
def parts(d,k,r,s):
 j=d+3*k+(3 if r else 2);a=2 if r else 1
 L=C(j+s+3,s+3)+4*C(j+s+4,s+5)
 E0=4*(a*C(k+s+4,s+4)+(3-a)*C(k+s+3,s+4))
 E1=4*(s+3)*(a*C(k+s+4,s+5)+(3-a)*C(k+s+3,s+5))
 return L,F(E0*max(d-s,0),s+1)+E1
start=time.monotonic();out=dict(status='finite exact experiment, not proof',sharp_bound_checks=0,sharp_bound_failures=[],margin_checks=0,margin_failures=0,first_margin_failure=None,examples=[])
for d in list(range(11))+[20,50]:
 for k in list(range(31))+[50,100,200,500,1000]:
  for r in [False,True]:
   for s in range(3,21):
    j=d+3*k+(3 if r else 2)
    L0,U0=parts(d,k,r,s);L1,U1=parts(d,k,r,s+1);L2,U2=parts(d,k,r,s+2)
    if k<=50:
     K=kernel(d,k,r,s)
     for h,Kscaled in enumerate(K):
      m=s-h;low=C(s+m+3,m)*(C(j+s+3,s+m+3)+4*C(j+s+4,s+m+5))
      out['sharp_bound_checks']+=1
      if L0*F(Kscaled,s+1)>(L0+U0)*low:out['sharp_bound_failures'].append([d,k,r,s,h])
    N=C(j+s+4,j)**2-C(j+s+3,j)*C(j+s+5,j);M=L1**2
    gap=L0*L2*M-(L0+U0)*(L2+U2)*(M-N)
    out['margin_checks']+=1
    if gap<0:
     out['margin_failures']+=1
     if out['first_margin_failure'] is None:out['first_margin_failure']=dict(d=d,k=k,r=r,s=s,L=[L0,L1,L2],U=[str(U0),str(U1),str(U2)],N=N,M=M,gap=str(gap))
out['seconds']=time.monotonic()-start
(O/'scalar-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
