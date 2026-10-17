"""Machine-authored exact source checks. Finite experiments, not proofs."""
from math import comb
from pathlib import Path
import json,time,hashlib
from three_probe_9e205206 import frame
start=time.monotonic()
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def L(d,j,t):
 return sum(C(d,t-m)*C(t+m+3,m)*(C(j+t+3,t+m+3)+4*C(j+t+4,t+m+5)) for m in range(t+1))
def A(e,a,b,J,H):
 return sum(C(a+l,a)*C(H,b-l)*(e*C(J+a+1,a+l+1)+3*C(J+a+1,a+l+2)) for l in range(b+1))
def S(H,T,t):
 return sum(C(t+l,t)*C(H,t+3-l)*(C(T,t+l)+4*C(T+1,t+l+2)) for l in range(t+4))
def low(c,x,h,t,r):
 e=2 if r else 1;j=3*x+h+c+(7 if r else 6)
 return L(c+h+2*t,j+2-t,c+t)+4*A(e,c+t+2,c+t+1,x+2-t,c+h+2*t)
def upper(c,x,h,t,r):
 e=2 if r else 1;k=3*x+h+c+(7 if r else 6)
 return S(c+h+4,k+c+t,c+t)+4*A(e,c+t+1,c+t+2,x,c+h+4)
def crossing(n,t,s,r):
 e=2 if r else 1;j=n+((4 if r else 3) if s else (2 if r else 1))
 ex=(4*A(e,2,1,1,n) if t==0 else 4*A(e,3,2,0,n+2) if t==1 else 0) if s else (4*e*(n+1) if t==0 else 0)
 return L(n+(0 if s else 1)+2*t,j+2-t,t)+ex
out=dict(status='Finite exact recurrence experiments only, not a proof.',q_max=35,
 diagonal_checks=0,polygon_checks=0,zero_triples=0,coefficient_checks=0,
 generalized_coefficient_checks=0,failures=[],regions={})
for q in range(1,36):
 for r in (False,True):
  a,b,p=frame([False]*(q-1)+[True,r]);assert a==3 and b==3*q+(1 if r else 2)
  for j in range(b+7):
   pts=[(3,j+2),(4,j+1),(5,j)];v=[p.get(z,0) for z in pts]
   out['diagonal_checks']+=1;out['zero_triples']+=int(0 in v)
   if all(3*b<=b*i+3*k and i+k<=b+2 for i,k in pts):out['polygon_checks']+=1
   if v[0]*v[2]>v[1]**2:out['failures'].append(['raw',q,r,j,v])
   K=b-q-j-5;J=j-q-1
   if K>=0 and j+2>q:
    if j==q-1: vals=[crossing(K,t,False,r) for t in range(3)];region='cross1'
    elif j==q: vals=[crossing(K,t,True,r) for t in range(3)];region='cross2'
    elif J<K:vals=[low(0,J,K-J-1,t,r) for t in range(3)];region='low'
    else:vals=[upper(0,K,J-K,t,r) for t in range(3)];region='upper'
    out['coefficient_checks']+=3;out['regions'][region]=out['regions'].get(region,0)+1
    if vals!=v:out['failures'].append(['mass',q,r,j,vals,v])
  for c in range(1,9):
   for j in range(q+1,2*q+3):
    J=j-q-1;K=b-q-(c+3)-j-2
    if K<0:continue
    vals=[low(c,J,K-J-1,t,r) if J<K else upper(c,K,J-K,t,r) for t in range(3)]
    v=[p.get((c+t+3,j+2-t),0) for t in range(3)]
    out['generalized_coefficient_checks']+=3
    if vals!=v:out['failures'].append(['general',c,q,r,j,vals,v])
out['seconds']=time.monotonic()-start
out['script_sha256']=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
Path('evidence/markov-bebe7940/source-experiment.json').write_text(json.dumps(out,indent=2))
print(json.dumps(out))
