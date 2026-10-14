"""Machine-authored sparse marked transfer, fixed small cut counts."""
from pathlib import Path
from random import Random
import json,time
O=Path('evidence/markov-9c20fccd')
def add(*ps):
 q={}
 for p in ps:
  for ij,c in p.items():q[ij]=q.get(ij,0)+c
 return q
def shift(p,s=0,d=0,j=0,limit=5):
 return {(a+s,b+d,k+j):v for (a,b,k),v in p.items() if a+s<=limit}
def smooth(p):return add(p,shift(p,j=1))
def limited(w):
 W={(0,0,0):1};H={(0,1,0):1,(0,1,1):1};Z={(0,1,0):1}
 for r in w:
  if r:
   C=shift(smooth(H),s=1,d=1)
   W,H,Z=add(W,C),add(shift(H,d=1,j=1),shift(smooth(Z),d=1),shift(smooth(C),d=1)),add(shift(Z,d=1),shift(C,d=1))
  else:
   C=shift(H,s=1)
   W,H,Z=add(W,C),add(W,shift(smooth(C),d=1)),add(W,shift(C,d=1))
 return W
def main():
 t=time.monotonic();rng=Random(920);records=[];tests=0;first=None
 words=[]
 for a,b in [(2,20),(5,20),(10,25),(20,20),(30,15),(40,10)]:
  words.extend([(0,)*a+(1,)*b+(0,)*a,(1,)*a+(0,)*b+(1,)*a,((0,)*a+(1,)*b)*2,(0,1)*a+(1,)*b])
 for n in [30,40,50]:
  for p in [.1,.25,.5,.75,.9]:
   for _ in range(4):words.append(tuple(int(rng.random()<p) for _ in range(n)))
 for w in words:
  F=limited(w);G={}
  for (s,d,j),v in F.items():G.setdefault((s,d),{})[j]=v
  for (s,d),p in G.items():
   for j in range(1,d):
    tests+=1;gap=p.get(j,0)**2-p.get(j-1,0)*p.get(j+1,0)
    if gap<0:
     first=dict(word=w,s=s,d=d,j=j,coefficients=[p.get(k,0) for k in range(d+1)],gap=gap);break
   if first:break
  records.append(dict(word=w,entries=len(F)))
  if len(records)%5==0:print(json.dumps(dict(words=len(records),tests=tests,seconds=time.monotonic()-t)),flush=True)
  if first or time.monotonic()-t>110:break
 rec=dict(status='finite exact stress, cut counts <=5; not universal',seed=920,inputs=records,tests=tests,first_failure=first,seconds=time.monotonic()-t)
 (O/'degree-limited.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec),flush=True)
if __name__=='__main__':main()
