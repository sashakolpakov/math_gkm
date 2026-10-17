"""Machine-authored be355177. Test discarding positive middle corrections."""
from transposed_stress_be355177 import C,kernel,conv,O
import json,time
def lower(d,k,r,s):
 j=d+3*k+(3 if r else 2)
 return [(s+1)*C(2*s-h+3,s-h)*(C(j+s+3,2*s-h+3)+4*C(j+s+4,2*s-h+5)) for h in range(s+1)]
start=time.monotonic()
out=dict(status='finite exact sufficient-candidate test, not a proof',triples=0,raw_failures=[],cut_failures=[],cut_negative_count=0,raw_negative_count=0)
for s in range(3,31):
 for d in [0,1,s,s+1,2*s,5*s]:
  for k in [0,1,2,3,s//2,s,s+1,2*s,5*s]:
   for r in [False,True]:
    A,B,D=[kernel(d,k,r,s+t)+[0]*(2-t) for t in range(3)]
    L=lower(d,k,r,s+1)+[0]
    u=(s+1)*(s+3);v=(s+2)**2
    raw=u*sum(C(d,h)*x for h,x in enumerate(L))**2-v*sum(C(d,h)*x for h,x in enumerate(A))*sum(C(d,h)*x for h,x in enumerate(D))
    if raw<0:
     out['raw_negative_count']+=1
     if len(out['raw_failures'])<10:out['raw_failures'].append([d,k,r,s,raw])
    gap=[u*x-v*y for x,y in zip(conv(L,L),conv(A,D))]
    for h in range(s+4):
     for n,z in enumerate(gap):
      if z<0:
       out['cut_negative_count']+=1
       if len(out['cut_failures'])<10:out['cut_failures'].append([d,k,r,s,h,n,z])
     if h<s+3:
      for j in range(h,s+3):
       if j==h:gap[2*h]-=u*L[h]**2-v*A[h]*D[h]
       else:gap[h+j]-=2*u*L[h]*L[j]-v*(A[h]*D[j]+A[j]*D[h])
    out['triples']+=1
out['seconds']=time.monotonic()-start
(O/'robust-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
