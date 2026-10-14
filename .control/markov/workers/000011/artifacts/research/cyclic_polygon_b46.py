"""Machine-authored cyclic-word scan with explicit canonical polygon guard."""
import pathlib,json,sys,time
from balanced_f80 import A,B,I,mm
from scan import polygon
from math import gcd
start=time.monotonic();bound=int(sys.argv[1]);count=0;first=None
for b in range(2,bound+1):
 for a in range(1,b):
  if gcd(a,b)!=1:continue
  w=''.join('B' if ((k+1)*a)//b>(k*a)//b else 'A' for k in range(b))
  for shift in range(b):
   z=w[shift:]+w[:shift]
   if z[0]!='A' or z[-1]!='B':continue
   m=I
   for c in z:m=mm(m,B if c=='B' else A)
   p=m[1];count+=1
   for di,dj in [(1,0),(0,1),(1,-1)]:
    for i,j in p:
     pts=[(i+k*di,j+k*dj) for k in range(3)]
     if not all(polygon(a,b,*pt) for pt in pts):continue
     cs=[p.get(pt,0) for pt in pts]
     if cs[1]**2<cs[0]*cs[2]:
      first=dict(word=z,a=a,b=b,rotation=shift,direction=[di,dj],points=pts,coefficients=cs);break
    if first:break
   if first:break
  if first:break
 if first:break
res=dict(bound=bound,count=count,first=first,seconds=time.monotonic()-start,status='finite non-source experiment only; guarded by canonical label polygon')
pathlib.Path(f'evidence/markov-b46c0efc/cyclic-polygon-{bound}.json').write_text(json.dumps(res,indent=2));print(json.dumps(res))
