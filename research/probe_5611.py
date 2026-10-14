"""Machine-authored exact horizontal type-refinement experiments, request 56112359.
Finite observations only. No root resolution.
"""
import itertools,json,pathlib,time,sys
from type_refinement_a3c5 import refined,conv
from aggregate_a3c5 import core,poly
OUT=pathlib.Path('evidence/markov-56112359')
OUT.mkdir(exist_ok=True)
def check(w):
 p=refined(w);rows={}
 for (i,j,k),c in p.items():rows.setdefault((i,j),{})[k]=c
 count=0
 for i,j in rows:
  if (i+2,j) not in rows:continue
  a,b,c=[rows.get((i+h,j),{}) for h in range(3)]
  l=conv(b,b);r=conv(a,c);g={k:l[k]-r[k] for k in l.keys()|r.keys()};count+=1
  if any(x<0 for x in g.values()):return dict(word=list(map(int,w)),position=[i,j],coefficients=[a,b,c],gap=g,raw_gap=sum(g.values())),count
 return None,count
def main():
 start=time.monotonic();mode=sys.argv[1];ct=triples=0;result={}
 if mode=='words':
  for n in range(1,18):
   for w in itertools.product([False,True],repeat=n):
    if w[0] or w[-1] or any(x and y for x,y in zip(w,w[1:])):continue
    bad,num=check(w);ct+=1;triples+=num
    if bad:result=bad;break
   print(n,ct,triples, bool(result),flush=True)
   if result:break
 elif mode=='pell':
  for a in range(2,91):
   bad,num=check(core(a,a+1));ct+=1;triples+=num
   if bad:result=dict(a=a,b=a+1,**bad);break
   if a%5==0:print(a,ct,triples,flush=True)
 rec=dict(mode=mode,objects=ct,triples=triples,first_failure=result,seconds=time.monotonic()-start,status='finite experiment only')
 (OUT/(mode+'.json')).write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec),flush=True)
if __name__=='__main__':main()
