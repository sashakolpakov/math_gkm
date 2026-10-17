"""Machine-authored exact exploratory bounds for signed offsets; not a proof."""
from pathlib import Path
from weak_margin_probe_6738b4ea import C,X,add,scale,mul
from correction_kernel_d0292f14 import top,raw
import json,time
t=time.monotonic();thresholds=[]
for shift in range(5):
 for cutoff in range(4,21):
  i=add(X(0),C(cutoff));r=add(X(1),C(3));H=add(r,scale(i,2),X(2),C(9-shift))
  I=add(i,C(3));J=add(i,C(4));D=add(H,scale(r,-1),C(1))
  A=mul(add(i,C(1)),add(scale(J,8),C(1)));B=add(scale(i,15),C(47));Q=add(H,r);R=mul(r,H)
  S=add(mul(i,add(i,C(1))),scale(mul(r,add(i,C(1))),6),scale(mul(r,r),6))
  P=add(mul(C(4),I,J,B,R,R),mul(C(4),I,J,A,D,R),scale(mul(I,J,A,D,D),-1),scale(mul(C(4),add(B,A),Q,Q,S),-1))
  if all(v>0 for v in P.values()):
   thresholds.append(dict(shift=shift,cutoff=cutoff,terms=len(P),minimum=min(P.values())));break
checks=0;fails=[]
for x in [-4,-3,-2,-1]:
 for r in [False,True]:
  B=5 if r else 4
  for k in range(3,61):
   T=x+3*k+B
   for c in range(26):
    A=top(x,T,c);v=raw(x,k,r,c+3);corr=v-A;checks+=1
    if corr<0 or 3**(c+2)*corr>21*A:fails.append(['relative',x,k,r,c,A,corr])
    if c>=10 and c+3<=T:
     aa=[top(x,T,c+h) for h in range(3)]
     if (8*(c+4)+1)*aa[0]*aa[2]>8*(c+4)*aa[1]**2:fails.append(['weak',x,k,r,c])
out=dict(scalar_shift_thresholds=thresholds,relative_checks=checks,failures=fails,seconds=time.monotonic()-t,
 status='Finite exact experiments and symbolic coefficient sign observations only. Signed source and weighted-moment bridges remain unproved.')
Path('evidence/markov-e8743310/central-bounds.json').write_text(json.dumps(out,indent=2));print(json.dumps(out))
