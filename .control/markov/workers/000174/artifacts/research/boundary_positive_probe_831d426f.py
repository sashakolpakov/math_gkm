"""Machine-authored 831d426f. Exact finite tests of a positive boundary expression."""
from pathlib import Path
import json,time
from math import comb
from band_experiment_139fed75 import Q,add,mul,scale,C
O=Path('/Users/sasha/math_gkm/evidence/markov-831d426f')
def B(k,r):
 return [2*C(2*m+2,m+1)*((2 if r else 1)*C(k+m+3,2*m+3)+
          (1 if r else 2)*C(k+m+2,2*m+3)) for m in range(k+1)]
def series_mul(a,b,N):
 return [add(*[mul(a[i],b[n-i]) for i in range(n+1)]) for n in range(N+1)]
def run():
 t=time.monotonic();out={'status':'finite exact tests; no universal proof','boundary_checks':0,
   'boundary_failures':[],'convolution_checks':0,'convolution_failures':[],
   'formula_equivalence_checks':0,'formula_equivalence_failures':[]}
 for k in range(61):
  for r in [False,True]:
   b=B(k,r);q=Q(2*k+(2 if r else 1),r,k)
   for m,v in enumerate(b):
    out['boundary_checks']+=1
    if v!=q[m]:out['boundary_failures'].append([k,r,m,v,q[m]])
    lhs=(2*m+3)*v
    rhs=2*(3*k+m+6 if r else 3*k+3-m)*C(k+m+2,2*m+2)*C(2*m+2,m+1)
    out['formula_equivalence_checks']+=1
    if lhs!=rhs:out['formula_equivalence_failures'].append([k,r,m,lhs,rhs])
 # lambda=1+u, u=w(1+u)(X+(1+X)u). Positive polynomial recurrence.
 N=16;lam=[[1]]
 for n in range(1,N+1):
  u=[[],*lam[1:]]
  a=add(scale(lam[n-1],0),mul([0,1],lam[n-1]),
        mul([1,1],add(*[mul(lam[i],u[n-1-i]) for i in range(n)])))
  lam.append(a)
 out['lambda_prefix']=lam[:7]
 for r in [False,True]:
  base=[B(k,r) for k in range(N+1)];row=base
  for d in range(13):
   for k in range(N+1):
    q=Q(d+2*k+(2 if r else 1),r,k)
    out['convolution_checks']+=1
    if row[k]!=q:out['convolution_failures'].append([d,k,r,row[k],q])
   row=series_mul(row,lam,N)
 out['seconds']=time.monotonic()-t
 (O/'positive-boundary-probe.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k!='lambda_prefix'}))
if __name__=='__main__':run()
