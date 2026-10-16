"""Machine-authored 2b34268b: proposed upper formula; experiments are not proofs."""
from probe_2b34268b import C,f
from functools import cache
from pathlib import Path
import json,time
@cache
def S(N,d,i,h):
 if i<2 or not 0<=h<=i:return 0
 return C(2*d+h-1,h)*C(2*i-2-h,i-h)*(C(N+i-h+1,2*i-1-h)+C(N+i-h,2*i-1-h))
@cache
def B(N,d,i):
 return 2*(C(N+1,i-1)+C(N,i-1))*C(d-1+i,i) if i>=1 else 0
def raw(q,j,i):
 return sum(f(q+1,h,t)*f(q+1,i-h,j-t)+f(q,h,t)*f(q,i-h,j-1-t) for h in range(i+1) for t in range(j+1))
def main():
 start=time.monotonic();out={'status':'finite experiment, not proof','identities':0,'formula_failures':[], 'variants':{}}
 for q in range(1,24):
  for j in range(q+1,2*q):
   N,d=2*q-j,j-q
   for i in range(2*q+5-j):
    a=raw(q,j,i);b=B(N,d,i)+sum(S(N,d,i,h) for h in range(i+1))
    out['identities']+=1
    if a!=b and len(out['formula_failures'])<10:out['formula_failures'].append([q,j,i,a,b])
 for kind in ['h','k','merge_k0','boundary_mix']:
  for shift in [0,1,2]:
   count=0;fails=[]
   def T(N,d,i,h):
    if kind=='h':return S(N,d,i,h)
    if kind=='k':return S(N,d,i,i-h)
    if kind=='merge_k0':return S(N,d,i,i-h)+(B(N,d,i) if h==0 else 0)
    if kind=='boundary_mix':return B(N,d,i) if h==0 else sum(S(N,d,i,t) for t in range(i+1)) if h==1 else 0
   for N in range(1,10):
    for d in range(1,10):
     for i in range(N+2):
      for h in range(i+3):
       for k in range(i+3):
        lhs=T(N,d,i,h)*T(N,d,i+2,k)
        rhs=T(N,d,i+1,min(h+shift,k))*T(N,d,i+1,max(h+shift,k)-shift)
        count+=1
        if lhs>rhs and len(fails)<5:fails.append([N,d,i,h,k,lhs,rhs])
   out['variants'][kind+str(shift)]={'checks':count,'failures':fails}
 out['seconds']=time.monotonic()-start
 Path('evidence/markov-2b34268b/upper-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
