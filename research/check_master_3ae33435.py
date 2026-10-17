"""Machine-authored exact finite experiment; not a universal proof."""
from pathlib import Path
from math import comb
import json,time,hashlib
from gf_identity_13e37040 import u,v,t
from three_probe_9e205206 import frame,add,mul,neg
O=Path('evidence/markov-3ae33435');start=time.monotonic()
def expand(num,den,N):
 def unpack(p):
  out=[{} for _ in range(max((k for i,j,k in p),default=0)+1)]
  for (i,j,k),c in p.items():out[k][i,j]=c
  return out
 num,den=unpack(num),unpack(den);assert den[0]=={(0,0):1}
 out=[]
 for n in range(N+1):
  a=num[n].copy() if n<len(num) else {}
  for k in range(1,min(n,len(den)-1)+1):a=add(a,neg(mul(den[k],out[n-k])))
  out.append(a)
 return out
def D(c,j,k):
 if k<0:return 0
 return sum((1 if s==0 else 4*s)*comb(j-s+c+3,c+3)*comb(k-s+c,c) for s in range(min(j,k)+1))
master=expand(u**3*t*(1+v*t**2)**2,(1-v*t**2)**2*(1-v*t)**3*((1-t)*(1-v*t)-u*t),62)
counts={'master_coefficients':0,'zeros':0,'source_coefficients':0,'triples':[0,0,0]};bad=[]
for n,p in enumerate(master):
 for i in range(3,n+7):
  for j in range(n+7-i):
   a=p.get((i,j),0);expected=D(i-3,j,n+2-i-j)
   counts['master_coefficients']+=1;counts['zeros']+=int(a==0)
   if a!=expected:bad.append(['master',n,i,j,a,expected])
for q in [1,2,3,7,11,17,20]:
 for r in [False,True]:
  a,b,p=frame([False]*(q-1)+[True,r]);assert a==3
  for i in range(3,b+5):
   for j in range(b+5-i):
    k=b-q-i-j;J=j-q-1
    E=0 if min(k,J)<0 else 4*sum((3*s+(2 if r else 1))*comb(J-s+i-1,i-1)*comb(k-s+i-2,i-2) for s in range(min(k,J)+1))
    counts['source_coefficients']+=1
    if p.get((i,j),0)!=D(i-3,j,b+2-i-j)+E:bad.append(['source',q,r,i,j])
  inside=lambda i,j:3*b<=b*i+3*j and i+j<=b+2
  for i in range(b+3):
   for j in range(b+3-i):
    for direction,pts in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):
     if all(inside(*z) for z in pts):
      counts['triples'][direction]+=1;x,y,z=[p.get(pt,0) for pt in pts]
      if x*z>y*y:bad.append(['LC',q,r,pts,[x,y,z]])
out={'counts':counts,'failures':bad,'master_index_bound':62,'source_q':[1,2,3,7,11,17,20],
 'seconds':time.monotonic()-start,'status':'Finite exact experiments only; no root closure.',
 'script_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
(O/'master-experiment.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
