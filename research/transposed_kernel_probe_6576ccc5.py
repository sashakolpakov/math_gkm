"""Machine-authored 6576ccc5. Test a possible next universal kernel route.
The exact source lift is proved separately. Kernel gap positivity here is
only a tested candidate, and any failures are auxiliary, never root refutations.
"""
from fractions import Fraction as F
from math import comb
from pathlib import Path
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-6576ccc5')
C=lambda n,k:comb(n,k) if 0<=k<=n else 0
def correction_term(k,t,m,r):
 a=2 if r else 1
 return 4*C(t+m+1,m)*(a*C(k+t+3,t+m+3)+(3-a)*C(k+t+2,t+m+3))
def kernel(d,k,r,s):
 j=d+3*k+(3 if r else 2);out=[]
 for h in range(s+1):
  m=s-h
  v=F(C(s+m+3,m)*(C(j+s+3,s+m+3)+4*C(j+s+4,s+m+5)))
  v+=correction_term(k,s+1,m+1,r)
  if h==s:v+=F(correction_term(k,s+1,0,r)*max(d-s,0),s+1)
  out.append(v)
 return out
def conv(a,b):
 out=[F(0)]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):out[i+j]+=x*y
 return out
def run():
 start=time.monotonic()
 out=dict(status='finite candidate-kernel probe, not a proof',d_values=list(range(13))+[25,50],k_values=list(range(13))+[20,36],s_values=list(range(3,13)),triplets=0,weighted_identity_checks=0,cut_coefficient_checks=0,negative_cut_coefficients=0,negative_examples=[],identity_failures=[])
 for d in out['d_values']:
  for k in out['k_values']:
   for r in [False,True]:
    j=d+3*k+(3 if r else 2)
    for s in out['s_values']:
     A,B,D=[kernel(d,k,r,s+t) for t in range(3)];out['triplets']+=1
     for t,P in enumerate([A,B,D]):
      raw=sum(C(d,h)*v for h,v in enumerate(P))
      base=sum(C(d,s+t-m)*C(s+t+m+3,m)*(C(j+s+t+3,s+t+m+3)+4*C(j+s+t+4,s+t+m+5)) for m in range(s+t+1))
      correction=sum(C(d,s+t+1-m)*correction_term(k,s+t+1,m,r) for m in range(s+t+2))
      out['weighted_identity_checks']+=1
      if raw!=base+correction:out['identity_failures'].append([d,k,r,s+t])
     for cut in range(min(d,s+2)+1):
      aa,bb,cc=A[:cut+1],B[:cut+1],D[:cut+1]
      lhs=conv(bb,bb);rhs=conv(aa,cc)
      for i in range(max(len(lhs),len(rhs))):
       z=(lhs[i] if i<len(lhs) else 0)-(rhs[i] if i<len(rhs) else 0)
       out['cut_coefficient_checks']+=1
       if z<0:
        out['negative_cut_coefficients']+=1
        if len(out['negative_examples'])<12:out['negative_examples'].append([d,k,r,s,cut,i,str(z)])
 out['seconds']=time.monotonic()-start
 (O/'transposed-kernel-probe.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out))
if __name__=='__main__':run()
