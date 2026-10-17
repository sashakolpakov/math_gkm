"""Machine-authored finite exact checks of actual weighted moments; not a proof."""
from math import comb
from pathlib import Path
import json,time
start=time.monotonic();counts={'moment_cases':0,'new_margin_checks':0};fails=[]
for d in [0,1,2,7,23,60]:
 for c in [0,1,4,9,10,11,12,15,16,24,40]:
  for r in [0,1,2,3,4,8,20,50]:
   T=c+r
   weights=[(1 if s==T else 4*(T-s))*comb(s,c)*comb(d+s+c+8,c+3) for s in range(T+1)]
   eig=lambda s:s*(s+d+9)
   M=sum(weights);N=sum(w*eig(s) for s,w in enumerate(weights));N2=sum(w*eig(s)**2 for s,w in enumerate(weights))
   E=N-eig(c)*M;V=M*N2-N*N;G=sum(w*(T-s)**2 for s,w in enumerate(weights));R=eig(T)-eig(c);Q=2*T+d+9
   counts['moment_cases']+=1
   if V+(R*M-E)**2>Q*Q*M*G:fails.append(['centered',d,c,r])
   if c>=10 and r>=3:
    counts['new_margin_checks']+=1
    if (15*c+47)*E*E+(c+1)*(8*(c+4)+1)*(2*c+d+10)*M*E-(c+1)*(8*(c+4)+1)*V<0:fails.append(['margin',d,c,r])
def scalar(i,r,H):
 I=i+3;J=i+4;A=(i+1)*(8*(i+4)+1);B=15*i+47;D=H-r+1;R=r*H;S=i*(i+1)+6*r*(i+1)+6*r*r
 return 4*I*J*B*R*R+4*I*J*A*D*R-I*J*A*D*D-4*(A+B)*(H+r)**2*S
negative=next(([9,r,r+27,scalar(9,r,r+27)] for r in range(3,10001) if scalar(9,r,r+27)<0),None)
out=dict(counts=counts,failures=fails,auxiliary_cutoff9_failure=negative,seconds=time.monotonic()-start,
 status='Finite exact checks only. A negative sufficient scalar certificate does not refute source coefficient log-concavity.')
Path('evidence/markov-e8743310/centered-experiment.json').write_text(json.dumps(out,indent=2));print(json.dumps(out))
