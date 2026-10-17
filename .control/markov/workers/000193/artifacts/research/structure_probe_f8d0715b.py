"""Machine-authored exact exploratory probes. Experiments are not proofs."""
from correction_kernel_d0292f14 import correction,C,top
from top_rr_b3eed364 import counts
from pathlib import Path
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-f8d0715b')
def run():
 t=time.monotonic(); out={'status':'finite exact evidence only','correction_sturm':[],'kernel_midpoint_failures':[]}
 for d in [0,1,2,5,20]:
  for k in range(2,14):
   for r in [False,True]:
    row=[correction(d,k,r,c) for c in range(1,k+2)]
    nr,degree,gcd=counts(row)
    tail=row[2:];nt,dt,gt=counts(tail)
    out['correction_sturm'].append(dict(d=d,k=k,r=r,roots=nr,degree=degree,tail_roots=nt,tail_degree=dt))
 for d in range(4):
  for s in range(8):
   for a in range(s+1):
    for t1 in range(s,10):
     for b in range(t1+1):
      f=lambda s,i:C(s,i)*C(d+s+i+8,i+3)
      lo=((s+t1)//2,(a+b)//2);hi=((s+t1+1)//2,(a+b+1)//2)
      lhs=f(s,a)*f(t1,b);rhs=f(*lo)*f(*hi)
      if lhs>rhs and len(out['kernel_midpoint_failures'])<20:out['kernel_midpoint_failures'].append([d,s,a,t1,b,lhs,rhs])
 out['seconds']=time.monotonic()-t
 (O/'structure-probe.json').write_text(json.dumps(out,indent=2))
 print(json.dumps(dict(correction_cases=len(out['correction_sturm']),full_nonreal=[r for r in out['correction_sturm'] if r['roots']<r['degree']][:8],tail_nonreal=[r for r in out['correction_sturm'] if r['tail_roots']<r['tail_degree']][:3],midpoint_failures=out['kernel_midpoint_failures'][:4],seconds=out['seconds'])))
if __name__=='__main__':run()
