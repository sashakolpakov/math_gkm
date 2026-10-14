"""Machine-authored exact last-cut renewal, retaining each mask degree."""
from pathlib import Path
from math import gcd
from itertools import product,combinations
import json,time,sys
from cuts_fe01 import kernel,mul,value,cutterm
from group_cuts_07a7 import add
O=Path('evidence/markov-07a7e5b7')
def grouped(w):
 # last[k][s][d] stores coefficients of all s-cut masks ending at k,
 # grouped by their individual (not aggregate) degree d.
 last=[]
 for k,r in enumerate(w):
  current={}
  for h in range(-1,k):
   K=kernel(w[h+1:k]);K=mul(K,[1,1]) if r else K;e=len(K)-1
   prev={(0,0):[1]} if h==-1 else last[h]
   for (s,d),p in prev.items():
    key=(s+1,d+e);current[key]=add(current.get(key,[]),mul(p,K))
  last.append(current)
 result={(0,0):[1]}
 for current in last:
  for key,p in current.items():result[key]=add(result.get(key,[]),p)
 return result
def main():
 t=time.monotonic();fails={};tests={};words=0;identity=0
 mode=sys.argv[1] if len(sys.argv)>1 else 'source';bound=int(sys.argv[2]) if len(sys.argv)>2 else 25
 def check(name,p,ctx):
  for j in range(1,len(p)):
   tests[name]=tests.get(name,0)+1
   if value(p,j)**2<value(p,j-1)*value(p,j+1):fails.setdefault(name,dict(**ctx,j=j,p=p,gap=value(p,j)**2-value(p,j-1)*value(p,j+1)))
 inputs=((a,b,tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,)) for b in range(2,bound+1) for a in range(1,b) if gcd(a,b)==1) if mode=='source' else ((sum(w),len(w),w) for n in range(bound+1) for w in product([0,1],repeat=n))
 for a,b,w in inputs:
  G=grouped(w);words+=1
  if len(w)<=8:
   direct={}
   for s in range(len(w)+1):
    for S in combinations(range(len(w)),s):
     p=cutterm(w,S);key=(s,len(p)-1);direct[key]=add(direct.get(key,[]),p);identity+=1
   assert G==direct
  for s in range(len(w)+1):
   gg={d:p for (ss,d),p in G.items() if ss==s};ctx=dict(a=a,b=b,word=w,s=s)
   for d,p in gg.items():check('group',p,dict(**ctx,degree=d))
   for reverse in [False,True]:
    acc=[]
    for d in sorted(gg,reverse=reverse):
     acc=add(acc,gg[d]);check('suffix' if reverse else 'prefix',acc,dict(**ctx,degree=d))
  if words%25==0:print(json.dumps(dict(mode=mode,words=words,tests=tests,failures=list(fails),seconds=time.monotonic()-t)),flush=True)
  if time.monotonic()-t>100:break
 rec=dict(status='finite exact grouped-degree test only',mode=mode,bound=bound,words=words,mask_identity_tests=identity,tests=tests,failures=fails,seconds=time.monotonic()-t)
 (O/f'degree-groups-{mode}-{bound}.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec),flush=True)
if __name__=='__main__':main()
