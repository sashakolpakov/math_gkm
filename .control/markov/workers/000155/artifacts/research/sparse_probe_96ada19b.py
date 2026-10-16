"""Machine-authored exact finite experiments; no universal inequality claim."""
from pathlib import Path
from math import comb
import json,time
from three_probe_9e205206 import frame,add,neg,mul,power,one,u,v,s,scale
O=Path('/Users/sasha/math_gkm/evidence/markov-96ada19b')
def fr(n,i,j):
 if min(i,j)<0:return 0
 if i==0:return int(j==n)
 return comb(n-j-1,i-1)*comb(i+j,j) if i+j<=n else 0
def sop(f,i,j):return f(i-1,j)+f(i,j-1)+f(i,j)
def force(q,r,i,j):
 if min(i,j)<0:return 0
 n=3*q+(1 if r else 2)
 f=lambda a,b:fr(n+2,a,b)-2*fr(n+1,a,b)+fr(n,a,b)
 g=lambda a,b:(sop(lambda c,d:fr(q,c,d),a,b)+fr(q+1,a,b) if r else fr(q,a,b-1)+sop(lambda c,d:fr(q+1,c,d),a,b))
 return sop(lambda a,b:sop(f,a,b),i,j)+4*g(i-1,j-q-1)
def solve(q,r,I,J):
 a={}
 for i in range(I+1):
  for j in range(J+1):
   get=lambda h,k:a.get((h,k),0)
   a[i,j]=force(q,r,i,j)-2*get(i-1,j)+2*get(i,j-1)-get(i-2,j)-2*get(i-1,j-1)-get(i,j-2)
 return a
def ker(i,j):return (-1)**i*comb(2*i+2*j+2,2*i+1)//2 if min(i,j)>=0 else 0
def main():
 t=time.monotonic();out={'status':'finite exact experiments only','source_coefficients':0,'raw_triples':[0,0,0],'zero_triples':[0,0,0],'kernel_checks':0,'inverse_checks':0,'failures':[],'forcing_negative_first':None,'lower_column_checks':0}
 for q in range(1,25):
  for r in [False,True]:
   a,b,p=frame([False]*(q-1)+[True,r]);d=a+b-1
   vals=solve(q,r,d+2,d+2)
   for (i,j),z in vals.items():
    out['source_coefficients']+=1
    if z!=p.get((i,j),0):out['failures'].append(['raw',q,r,i,j,z,p.get((i,j),0)])
    h=force(q,r,i,j)
    if h<0 and out['forcing_negative_first'] is None:out['forcing_negative_first']=[q,r,i,j,h]
    for ax,pts in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):
     if all(x<=d+2 and y<=d+2 for x,y in pts):
      z0,z1,z2=[vals[x] for x in pts];out['raw_triples'][ax]+=1;out['zero_triples'][ax]+=int(0 in [z0,z1,z2])
      if z0*z2>z1*z1:out['failures'].append(['lc',q,r,ax,pts,[z0,z1,z2]])
   for j in range(q):
    c=0 if r else 1
    choose=lambda n,k:comb(n,k) if 0<=k<=n else 0
    z=(3*q+c)*(choose(j+6,6)+2*choose(j+5,6)+choose(j+4,6))-13*choose(j+6,7)-18*choose(j+5,7)-5*choose(j+4,7)
    out['lower_column_checks']+=1
    assert z==p.get((4,j),0),(q,r,j,z,p.get((4,j),0))
   if q<=4:
    for i in range(10):
     for j in range(12):
      z=sum(ker(a,b)*force(q,r,i-a,j-b) for a in range(i+1) for b in range(j+1))
      out['inverse_checks']+=1
      assert z==p.get((i,j),0)
 for i in range(60):
  for j in range(60):
   z=ker(i,j)+2*ker(i-1,j)-2*ker(i,j-1)+ker(i-2,j)+2*ker(i-1,j-1)+ker(i,j-2)
   out['kernel_checks']+=1
   assert z==int(i==0 and j==0)
 out['seconds']=time.monotonic()-t
 (O/'sparse-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
