"""Machine-authored exact aggregation probes on actual mechanical words."""
from pathlib import Path
from itertools import combinations
from math import gcd
import json,time
from cuts_fe01 import cutterm,value
O=Path('evidence/markov-07a7e5b7')
def add(p,q): return [value(p,j)+value(q,j) for j in range(max(len(p),len(q)))]
def gap(p,q,j): return 2*value(p,j)*value(q,j)-value(p,j-1)*value(q,j+1)-value(q,j-1)*value(p,j+1)
def main():
 t=time.monotonic();fails={};tests={};sources=terms=0
 def check(name,p,context):
  for j in range(1,len(p)):
   tests[name]=tests.get(name,0)+1
   if value(p,j)**2<value(p,j-1)*value(p,j+1):
    fails.setdefault(name,dict(**context,j=j,p=p,gap=value(p,j)**2-value(p,j-1)*value(p,j+1)))
 for b in range(2,15):
  for a in range(1,b):
   if gcd(a,b)!=1:continue
   sources+=1;w=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,);n=len(w)
   for s in range(1,n+1):
    tt=[(S,cutterm(w,S)) for S in combinations(range(n),s)];terms+=len(tt)
    ctx=dict(a=a,b=b,s=s,word=w)
    for key in ['degree','first','last']:
     groups={}
     for S,p in tt:
      k=len(p)-1 if key=='degree' else S[0] if key=='first' else S[-1]
      groups[k]=add(groups.get(k,[]),p)
     for k,p in groups.items():check(key,p,dict(**ctx,group=k))
     for reverse in [False,True]:
      acc=[]
      for k in sorted(groups,reverse=reverse):
       acc=add(acc,groups[k]);check(key+('_suffix' if reverse else '_prefix'),acc,dict(**ctx,group=k))
     for k,p in groups.items():
      for l,q in groups.items():
       if k>=l:continue
       name=key+'_mixed'
       if name in fails:continue
       for j in range(1,max(len(p),len(q))):
        tests[name]=tests.get(name,0)+1;g=gap(p,q,j)
        if g<0:fails[name]=dict(**ctx,groups=[k,l],j=j,p=p,q=q,gap=g);break
 rec=dict(status='finite exact source aggregation experiment only',sources=sources,terms=terms,tests=tests,failures=fails,seconds=time.monotonic()-t)
 (O/'group-cuts.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec))
if __name__=='__main__':main()
