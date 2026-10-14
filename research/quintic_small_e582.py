"""Machine-authored exact exploration of sharper statistic bounds."""
from quintic_bounds_e582 import P,vals
import pathlib,json
def bounds(n,m):
 s=2*m;t=n-3*m-2;h=n-4*m-3
 a,bl,_,dl,e,f=vals(n,m,s,t,h,0,0,0)
 bu=vals(n,m,0,n-m,n-m,0,2,2)[1]
 cl=vals(n,m,s,t,0,2*(n-m),2,0)[2]
 cu=vals(n,m,0,n-m,0,0,0,2)[2]
 du=vals(n,m,0,0,0,0,0,0)[3]
 return dict(bl=bl,cl=cl,dl=dl,e=e,f=f,gap1=bl**2-a*cu,
  gap2=cl**2-bu*du,gap3=dl**2-cu*e,gap4=e**2-du*f)
x=P({(1,0):1});out=[]
for m in range(1,9):
 for N in range(max(m,6),70):
  ps=bounds(x+N,P(m))
  if all(c>=0 for p in ps.values() for c in p.v.values()):
   out.append(dict(m=m,threshold=N));break
 else:out.append(dict(m=m,none=True))
pathlib.Path('evidence/markov-e5822cfc/quintic-small-bounds.json').write_text(json.dumps(out,indent=2)+'\n')
print(out)
