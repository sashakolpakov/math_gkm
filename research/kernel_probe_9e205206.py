"""Machine-authored independent finite checks of explicit quadratic kernels."""
from three_probe_9e205206 import *
from math import comb
def quad_sum(a,b,c,n):
 out={}
 for m in range(n+1):
  inner={}
  for k in range(n-m+1):
   inner=add(inner,scale(mul(power(a,k),power(b,n-m-k)),comb(m+k,m)*comb(n-k,m)))
  out=add(out,mul(power(c,m),inner))
 return out
def quad_rec(a,b,c,N):
 trace=add(add(a,b),c);det=mul(a,b);res=[one,trace]
 for n in range(N-1):res.append(add(mul(trace,res[-1]),neg(mul(det,res[-2]))))
 return res[:N+1]
def main():
 start=time.monotonic();N=12
 perturb=mul(u,add(add(scale(add(add(power(v,2),v),one),3),scale(mul(u,add(v,one)),3)),power(u,2)))
 qa=quad_rec(v,power(v,2),mul(u,v),N);qb=quad_rec(one,power(v,3),perturb,N)
 checks=0
 for n in range(N+1):
  assert qa[n]==quad_sum(v,power(v,2),mul(u,v),n)
  assert qb[n]==quad_sum(one,power(v,3),perturb,n)
  checks+=2
 K=seriesmul(qa,qb)[:N+1]
 old=json.loads((O/'three-experiments.json').read_text());source_checks=0
 triples=[0,0,0];zeros=[0,0,0];kernel_fail={}
 for r in [False,True]:
  numer=[{(i,j):c for i,j,c in p} for p in old['series'][str(r)]['numerator']]
  res=seriesmul(numer,K)
  for q in range(1,N+1):
   a,bb,p=frame([False]*(q-1)+[True,r]);assert res[q]==p;source_checks+=1
   d=a+bb-1
   for i in range(d+3):
    for j in range(d+3):
     for ax,pts in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):
      vals=[p.get(x,0) for x in pts];triples[ax]+=1;zeros[ax]+=int(0 in vals)
      assert vals[0]*vals[2]<=vals[1]**2,(q,r,ax,pts,vals)
 for n in range(N+1):
  for i in range(3*n+3):
   for j in range(3*n+3):
    for ax,pts in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):
     vals=[K[n].get(x,0) for x in pts]
     if vals[0]*vals[2]>vals[1]**2:
      kernel_fail.setdefault(str(ax),dict(n=n,points=pts,values=vals))
 out=dict(status='finite exact experiments, not proof',N=N,quadratic_formula_checks=checks,source_kernel_formula_checks=source_checks,global_triples=triples,zero_triples=zeros,kernel_first_failures=kernel_fail,seconds=time.monotonic()-start)
 (O/'kernel-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
