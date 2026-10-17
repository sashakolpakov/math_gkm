"""Machine-authored be355177. Larger exact checks of the two remaining candidates."""
from transposed_stress_be355177 import C,conv,O
from fractions import Fraction as F
import json,random,time
def parts(d,k,r,s):
 j=d+3*k+(3 if r else 2);a=2 if r else 1
 B=C(j+s+3,s+3)+4*C(j+s+4,s+5)
 U=F(4*(a*C(k+s+4,s+4)+(3-a)*C(k+s+3,s+4))*max(d-s,0),s+1)
 U+=4*(s+3)*(a*C(k+s+4,s+5)+(3-a)*C(k+s+3,s+5))
 return B,U
def L(j,t,m):return C(t+m+3,m)*(C(t+j+3,t+m+3)+4*C(t+j+4,t+m+5))
def run():
 rng=random.Random(355177);start=time.monotonic()
 out=dict(status='finite exact candidate checks, not proofs',seed=355177,scalar_checks=0,scalar_failures=[],complete_checks=0,complete_failures=[],clamp_counts=dict(zero=0,positive=0))
 cases=[(d,k,r,s) for s in [3,4,5,10,20,50,100] for d in [0,1,s-1,s,s+1,s+2,2*s,10000] for k in [0,1,2,3,10,100,10000,1000000] for r in [False,True]]
 cases += [(rng.randrange(1000001),rng.randrange(1000001),bool(rng.randrange(2)),rng.randrange(3,151)) for _ in range(2000)]
 for d,k,r,s in cases:
  j=d+3*k+(3 if r else 2)
  if s>j:continue
  B0,U0=parts(d,k,r,s);B1,_=parts(d,k,r,s+1);B2,U2=parts(d,k,r,s+2)
  out['scalar_checks']+=1;out['clamp_counts']['zero' if d<=s else 'positive']+=1
  if (B0+U0)*(B2+U2)>B1*B1:out['scalar_failures'].append([d,k,r,s])
 for j,s in [(j,s) for j in [1,2,3,5,10,20,50,100,150,200,300] for s in [0,1,3,10,30,100,1000]]:
  A,B,D=[[L(j,s+t,m) for m in range(j+1)] for t in range(3)]
  for n,(ac,bb) in enumerate(zip(conv(A,D),conv(B,B))):
   out['complete_checks']+=1
   if A[0]*D[0]*bb<B[0]**2*ac:out['complete_failures'].append([j,s,n])
 out['seconds']=time.monotonic()-start
 (O/'candidate-stress.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':run()
