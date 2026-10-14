"""Machine-authored exact site-refinement experiment, not a root proof."""
import itertools,pathlib,json,time,math
from collections import defaultdict
def source_core(a,b):
 w=[a*(k+1)//b>a*k//b for k in range(b)]
 expanded=[d for c in w for d in ([False,True] if c else [False])]
 return expanded[1:-1]
def shift(p,di,dj,mask=0):return {(i+di,j+dj,m|mask):c for (i,j,m),c in p.items()}
def add(*ps):
 d=defaultdict(int)
 for p in ps:
  for k,c in p.items():d[k]+=c
 return dict(d)
def refined(w):
 x=y={(0,0,0):1}
 for k,c in reversed(list(enumerate(w))):
  h=add(shift(x,0,1),shift(y,1,0))
  x,y=(add(h,shift(x,0,0,1<<k)),h) if c else (h,add(h,shift(y,0,0,1<<k)))
 return add(shift(x,0,1),shift(y,1,0))
def product(p,q):
 d=defaultdict(int)
 for m,c in p.items():
  for n,e in q.items():d[(m|n,m&n)]+=c*e
 return d
def main():
 t=time.monotonic();out=[];count=0;first={}
 for b in range(2,12):
  for a in range(1,b):
   if math.gcd(a,b)>1:continue
   w=source_core(a,b)
   if len(w)>14:continue
   p=refined(w);slices=defaultdict(dict)
   for (i,j,m),c in p.items():slices[i,j][m]=c
   count+=1
   for di,dj in [(1,0),(0,1),(1,-1)]:
    for i,j in slices:
     if (i+2*di,j+2*dj) not in slices:continue
     mid=product(slices[i+di,j+dj],slices[i+di,j+dj]);ends=product(slices[i,j],slices[i+2*di,j+2*dj])
     for mask,n in ends.items():
      if mid[mask]<n:
       rec=dict(a=a,b=b,core=''.join('C' if x else 'A' for x in w),direction=[di,dj],start=[i,j],union=mask[0],intersection=mask[1],center_pairs=mid[mask],endpoint_pairs=n,raw=[sum(slices[i+k*di,j+k*dj].values()) for k in range(3)])
       if str((di,dj)) not in first:first[str((di,dj))]=rec
       if len(out)<20:out.append(rec)
       break
 result=dict(status='finite exact computation; refined failures do not refute raw target',sources=count,first=first,examples=out,seconds=time.monotonic()-t)
 pathlib.Path('evidence/markov-061840e8/refined-pairs.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
if __name__=='__main__':main()
