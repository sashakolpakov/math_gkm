"""Exact two-state path orbit experiment; machine-authored 88f3b553.
No finite computation here establishes the source conjecture.
"""
import json,itertools,math,pathlib,time
out=pathlib.Path('evidence/markov-88f3b553')
def word(a,b):return [a*k//b<a*(k+1)//b for k in range(b)]
def core(a,b):
 w=[x for r in word(a,b) for x in ([False,True] if r else [False])]
 return w[1:-1]
def paths(w):
 # states include the two common exterior vertices, encoded 2.
 p=[([2,0],[(0,1)]),([2,1],[(0,0)])]
 for c in w:
  new=[]
  for st,es in p:
   x=st[-1]
   edges=([(0,(0,1)),(1,(0,0))]+([(0,(0,0))] if c else [])) if x==0 else ([(0,(1,1)),(1,(1,0))]+([] if c else [(1,(0,0))]))
   for y,e in edges:new.append((st+[y],es+[e]))
  p=new
 return [(st+[2],es+[(st[-1],0)]) for st,es in p]
def charge(es):return tuple(map(sum,zip(*es)))
def components(p,q):
 sp,ep=p;sq,eq=q;last=0;ds=[];segs=[]
 for k in range(1,len(sp)):
  if sp[k]==sq[k]:
   ap=charge(ep[last:k]);aq=charge(eq[last:k]);d=tuple(x-y for x,y in zip(ap,aq))
   if sp[last:k+1]!=sq[last:k+1] or ep[last:k]!=eq[last:k]:ds.append(d);segs.append([last,k])
   last=k
 return ds,segs
def subset(ds,t):
 s={(0,0)}
 for x,y in ds:s|={(a+x,b+y) for a,b in s}
 return t in s
def main():
 start=time.monotonic();checked=0;fail=[];totals=[]
 for b in range(2,11):
  for a in range(1,b):
   if math.gcd(a,b)>1:continue
   w=core(a,b); ps=paths(w);buckets={}
   if len(ps)>6000:continue
   for p in ps:buckets.setdefault(charge(p[1]),[]).append(p)
   for (i,j),ls in buckets.items():
    for di,dj in [(1,0),(0,1),(1,-1)]:
     rs=buckets.get((i+2*di,j+2*dj),[])
     for p in rs:
      for q in ls:
       checked+=1;ds,segs=components(p,q)
       if not subset(ds,(di,dj)):
        fail.append(dict(a=a,b=b,core=w,direction=[di,dj],low=[i,j],high=[i+2*di,j+2*dj],p=p,q=q,component_deltas=ds,segments=segs,raw_triple=[len(ls),len(buckets.get((i+di,j+dj),[])),len(rs)]))
        break
      if fail:break
     if fail:break
    if fail:break
   totals.append([a,b,len(ps)])
   if fail:break
  if fail:break
 result=dict(status='exact finite path-pair orbit experiment, not a root counterexample',checked_pairs=checked,sources=totals,failures=fail,seconds=time.monotonic()-start)
 (out/'orbit-probe.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result))
if __name__=='__main__':main()
