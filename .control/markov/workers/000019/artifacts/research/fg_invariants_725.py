"""Exact probes of support-proof states; no universal inference."""
import json,pathlib,time,itertools
from balanced_f80 import add,mul,u,v,one
out=pathlib.Path('evidence/markov-7252232b');out.mkdir(exist_ok=True)
def step(r,f,g):
 h=add(mul(v,f),mul(u,g))
 return (add(h,f),h) if r else (h,add(h,g))
def sync(p,q):
 for i,j in set(p)|set(q):
  a=[p.get((i+t,j),0) for t in range(3)];b=[q.get((i+t,j),0) for t in range(3)]
  if a[0]*b[2]+b[0]*a[2]>2*a[1]*b[1]: return dict(i=i,j=j,p=a,q=b)
def main():
 start=time.monotonic();first={};count=0
 for n in range(10):
  for word in itertools.product([False,True],repeat=n):
   expanded=[s for r in word for s in ([False,True] if r else [False])]+[False]
   f=g=one
   for r in reversed(expanded):f,g=step(r,f,g)
   h=add(mul(v,f),mul(u,g));count+=1
   for key,p,q in [('fg',f,g),('Vf_Ug',mul(v,f),mul(u,g)),('hf',h,f),('hg',h,g)]:
    if key not in first:
     bad=sync(p,q)
     if bad:first[key]=dict(core=''.join('B' if r else 'A' for r in word),**bad)
 res=dict(status='finite experiment only',count=count,first_failures=first,seconds=time.monotonic()-start)
 (out/'fg-invariants.json').write_text(json.dumps(res,indent=2)+'\n');print(json.dumps(res))
if __name__=='__main__':main()
