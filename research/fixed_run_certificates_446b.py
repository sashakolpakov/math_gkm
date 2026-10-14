"""Machine-authored symbolic fixed-run exploration, with exact integer algebra."""
from certificates_446b import P,fmt
from second_envelope_bf38 import jets
from pathlib import Path
import json
def add(*ps):
 out={}
 for p in ps:
  for j,v in p.items():out[j]=out.get(j,P())+v
 return {j:v for j,v in out.items() if v}
def scale(p,s):return {j:v*s for j,v in p.items() if v*s}
def mul(p,q):
 out={}
 for j,v in p.items():
  for k,w in q.items():out[j+k]=out.get(j+k,P())+v*w
 return {j:v for j,v in out.items() if v}
def scalar(p):return {j:P({(0,0):v}) for (_,j),v in p.items()}
def subst(p,c,r):
 z=P()
 for (i,j),v in p.items():z=z+v*c**i*r**j
 return z
c=P({(1,0):1});r=P({(0,1):1});u=c;v=r
rec=[]
for n in [0,1,2,3,4]:
 h,k,b=map(scalar,jets(n));hh,kk,bb=map(scalar,jets(n+1));d=add(bb,scale(b,-1));Y={1:P({(0,0):1})};Q={0:P({(0,0):1}),1:P({(0,0):1})}
 p=add(scale(k,2*(c-r)),scale(kk,2*r),scale(mul(h,h),(c-r)*(c-r-1)),scale(mul(h,hh),2*(c-r)*r),scale(mul(hh,hh),r*(r-1)),scale(mul(add(Y,{0:P({(0,0):-1})}),add(scale(b,c),scale(d,r))),2),scale(mul(Y,add(scale(mul(b,b),c),scale(mul(b,d),2*r))),2),scale(mul(Q,add(scale(h,c-r),scale(hh,r),scale(Q,-1))),-2))
 # final coefficient is 8q, represented separately
 p[2*n+3]=P()
 gaps=[]
 for j in range(2*n+2):
  if j==2*n+1:
   C=2*u+v+3;R=u+v+2
   gp=subst(p.get(j+1,P()),C,R)**2-subst(p.get(j,P()),C,R)*8*(v+1)
   region='q>0: c=2u+v+3,r=u+v+2,q=v+1'
  else:
   gp=subst(p.get(j+1,P()),u+v+2,u+1)**2-subst(p.get(j,P()),u+v+2,u+1)*subst(p.get(j+2,P()),u+v+2,u+1)
   region='c=u+v+2,r=u+1'
  gaps.append(dict(j=j,region=region,nonnegative=all(t>=0 for t in gp.values()),terms=[[list(k),v] for k,v in sorted(gp.items())],expression=fmt(gp)))
 rec.append(dict(n=n,coefficients={str(j):fmt(t,['c','r']) for j,t in p.items()},gaps=gaps))
Path('evidence/markov-446bbcdc/fixed-run-certificates.json').write_text(json.dumps(rec,indent=2)+'\n')
print(json.dumps([dict(n=x['n'],coefficients=x['coefficients'],gaps=[dict(j=g['j'],nonnegative=g['nonnegative']) for g in x['gaps']]) for x in rec]))
