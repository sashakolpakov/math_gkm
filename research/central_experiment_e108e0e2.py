"""Machine-authored finite exact source experiments. No universal proof inference."""
from pathlib import Path
from math import comb
from three_probe_9e205206 import frame
import json,time,hashlib
O=Path('evidence/markov-e108e0e2'); t=time.monotonic()
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def H(D,k,a,b):return sum(C(a+l,a)*C(D+a,b-l)*C(k,a+l+2) for l in range(b+1))
def top(h,T,c):return sum(C(c+l,c)*C(h+2*c+4,c+3-l)*(C(T,c+l)+4*C(T+1,c+l+2)) for l in range(c+4))
def corr(e,k,c,r):
 if r:return 4*(H(e+c+2,k,c,c+1)+2*H(e+c+3,k,c+1,c+2)+H(e+c+2,k,c+1,c+2)+H(e+c+2,k,c,c+2)+H(e+c+3,k,c,c+2))
 return 4*(2*H(e+c+3,k,c+1,c+2)+H(e+c+3,k,c,c+1)+H(e+c+4,k,c+1,c+2)+H(e+c+3,k,c,c+2))
cache={};fail=[];checks=zeros=gaps=bounds=weak=triples=0
for r in [False,True]:
 for h in range(6):
  for k in range(18):
   q=2*k+h+int(r)
   if q<1:continue
   if (q,r) not in cache:cache[q,r]=frame([False]*(q-1)+[True,r])
   a,b,p=cache[q,r];T=q+k;j=b-q-k-1
   vals=[];temps=[];cors=[]
   for c in range(T+4):
    A=top(h,T,c);B=corr(h+int(r),k,c,r);v=A+B;actual=p.get((c+3,j),0)
    checks+=1;zeros+=int(actual==0);vals.append(v);temps.append(A);cors.append(B)
    if actual!=v:fail.append(['formula',q,r,h,k,c,actual,v])
    bounds+=1
    if B<0 or 3**(c+2)*B>24*A:fail.append(['bound',h,k,c,r,A,B])
   for c in range(len(vals)-2):
    gaps+=1
    if vals[c+1]**2<vals[c]*vals[c+2]:fail.append(['gap',h,k,c,r])
    if c>=10 and c+3<=T:
     weak+=1
     if (8*(c+4)+1)*temps[c]*temps[c+2]>8*(c+4)*temps[c+1]**2:fail.append(['margin',h,k,c,r])
for (q,r),(a,b,p) in cache.items():
 inside=lambda i,j:i>=0 and j>=0 and a*b<=b*i+a*j and i+j<=a+b-1
 for i in range(a+b):
  for j in range(a+b-i):
   for dx,dy in [(1,0),(0,1),(1,-1)]:
    coords=[(i+l*dx,j+l*dy) for l in range(3)]
    if all(inside(x,y) for x,y in coords):
     vs=[p.get(xy,0) for xy in coords];triples+=1
     if vs[1]**2<vs[0]*vs[2]:fail.append(['source_gap',q,r,coords,vs])
out=dict(formula_checks=checks,zeros=zeros,raw_gaps=gaps,relative_bounds=bounds,weak_margins=weak,source_families=len(cache),all_direction_polygon_triples=triples,failures=fail,seconds=time.monotonic()-t,status='Finite exact experiment only; no root closure or universal sign theorem.')
(O/'central-experiment.json').write_text(json.dumps(out,indent=2));print(json.dumps(out))
