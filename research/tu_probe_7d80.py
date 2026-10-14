"""Machine-authored audit of a possible unimodular-fiber representation.
Tests a stronger all-lattice-direction property; failure is NOT root refutation.
"""
from ambient_transfer_probe_5c90 import transfer
import math,json,pathlib,time
t=time.monotonic();tests=0;bad=None
for bb in range(2,17):
 for aa in range(1,bb):
  if math.gcd(aa,bb)!=1:continue
  w=tuple(aa*k//bb<aa*(k+1)//bb for k in range(bb))[1:-1]
  F=transfer(w);A={(s+aa-j,j):c for (s,j),c in F.items()}
  for (i,j),l in sorted(A.items()):
   for di in range(5):
    for dj in range(-4,5):
     if (di==0 and dj<=0) or math.gcd(di,abs(dj))!=1:continue
     i1,j1=i+di,j+dj;i2,j2=i+2*di,j+2*dj
     if min(i1,j1,i2,j2)<0:continue
     def inside(x,y):return bb*x+aa*y>=aa*bb and x+y<=aa+bb-1
     if not all(inside(x,y) for x,y in [(i,j),(i1,j1),(i2,j2)]):continue
     m=A.get((i1,j1),0);r=A.get((i2,j2),0);tests+=1
     if m*m<l*r:
      bad=dict(a=aa,b=bb,start=[i,j],direction=[di,dj],raw=[l,m,r]);break
    if bad:break
   if bad:break
  if bad:break
 if bad:break
rec=dict(status='Finite exact route audit, NOT a Conjecture63 refutation',tests=tests,first_failure=bad,seconds=time.monotonic()-t,meaning='A failure outside the three pinned directions obstructs an affine coefficient-preserving unimodular-fiber representation to which the cited all-direction theorem applies.')
pathlib.Path('evidence/markov-7d80a785/tu-route-probe.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec))
