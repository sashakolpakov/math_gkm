"""Machine-authored exact test of synchronized row convolution strategies."""
import sys,pathlib,json,time
from fractions import Fraction as Q
sys.path.insert(0,str(pathlib.Path('evidence/markov').resolve()))
from scan import add,mul
out=pathlib.Path('evidence/markov-3556cd95')
u={(1,0):1};v={(0,1):1};s={(0,0):1,(1,0):1,(0,1):1}
f=[{(0,0):1},add(u,v)]
for n in range(2,22):f.append(add(mul(s,f[-1]),mul(v,f[-2]),-1))
def trim(a):
 while a and not a[-1]:a.pop()
 return a
def deriv(a):return trim([a[i]*i for i in range(1,len(a))])
def rem(a,b):
 a=a[:]
 while len(a)>=len(b):
  c=a[-1]/b[-1];d=len(a)-len(b)
  for i,x in enumerate(b):a[i+d]-=c*x
  trim(a)
 return a
def distinct_real(a):
 a=trim([Q(x) for x in a]);seq=[a,deriv(a)]
 if not seq[-1]:return 0
 while seq[-1]:
  r=rem(seq[-2],seq[-1])
  if not r:break
  seq.append([-x for x in r])
 def variations(sign):
  ss=[(1 if p[-1]>0 else -1)*(sign if (len(p)-1)%2 else 1) for p in seq]
  return sum(x!=y for x,y in zip(ss,ss[1:]))
 return variations(-1)-variations(1),len(a)-len(seq[-1])
def conv(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):c[i+j]+=x*y
 return c
def syncbad(a,b):
 get=lambda x,i:x[i] if 0<=i<len(x) else 0
 for k in range(max(len(a),len(b))):
  if get(a,k-1)*get(b,k+1)+get(b,k-1)*get(a,k+1)>2*get(a,k)*get(b,k):return k
 return None
start=time.monotonic();fail=[];realbad=[];checked=0
for q in range(1,16):
 p=add(mul(f[q+1],f[q+1]),mul(v,mul(f[q],f[q])))
 d=2*q+2
 for r in range(d+1):
  a=[p.get((i,d-r-i),0) for i in range(d-r+1)]
  rr=distinct_real(a)
  if rr and rr[0]!=rr[1]:realbad.append(dict(q=q,r=r,row=a,distinct_real=rr))
 # Product coefficient slices as sums of convolutions.
 for direction in ['horizontal','vertical','diagonal']:
  getrow=lambda n,r:([f[n].get((i,r),0) for i in range(n+1)] if direction=='horizontal' else
    [f[n].get((r,i),0) for i in range(n+1)] if direction=='vertical' else
    [f[n].get((i,n-r-i),0) if n-r>=i else 0 for i in range(n+1)])
  for r in range(2*q+2):
   terms=[conv(getrow(q,t),getrow(q+1,r-t)) for t in range(r+1)]
   terms=[a for a in terms if any(a)]
   for t in range(len(terms)):
    for z in range(t+1,len(terms)):
     checked+=1;k=syncbad(terms[t],terms[z])
     if k is not None and not any(x['direction']==direction for x in fail):
      fail.append(dict(direction=direction,q=q,slice=r,terms=[t,z],index=k,
       a=terms[t],b=terms[z]))
result=dict(status='finite exact evidence, not proof',q_bound=15,pair_checks=checked,
 synchronization_failures=fail,diagonal_realroot_failures=realbad,seconds=time.monotonic()-start)
(out/'slice-strategies.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result))
