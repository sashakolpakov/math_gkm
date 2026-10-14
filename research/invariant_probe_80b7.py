"""Exact finite tests of candidate horizontal sum invariants; not a proof."""
import itertools,json,pathlib,collections,time
from aggregate_a3c5 import add,shift
O=pathlib.Path('evidence/markov-80b7912a')
def pair(w,t):
 f=g={(0,0):1}
 for r in reversed(w):
  h=add(shift(f,0,1),shift(g,1,0))
  f,g=(add(h,{ij:t*c for ij,c in f.items()}),h) if r else (h,add(h,g))
 return f,g
def mixed(f,g):
 for j in range(max([q for i,q in f]+[q for i,q in g])+1):
  for i in range(max([q for q,jj in f]+[q for q,jj in g])):
   a,b,c=[f.get((i+k,j),0) for k in range(3)]
   d,e,h=[g.get((i+k,j),0) for k in range(3)]
   gap=2*b*e-a*h-c*d
   if gap<0:return dict(i=i,j=j,first=[a,b,c],second=[d,e,h],gap=gap)
def main():
 result={};count=0
 for n in range(1,15):
  for w in itertools.product([False,True],repeat=n):
   if w[0] or w[-1] or any(x and y for x,y in zip(w,w[1:])):continue
   for t in [0,1,2,10]:
    f,g=pair(w,t);h=add(shift(f,0,1),shift(g,1,0));q=add(shift(h,1,0),shift(h,0,1))
    tests={'h':(shift(f,0,1),shift(g,1,0)), 'A_g':(h,g),'AC_q':(q,shift(f,0,1)),'AC_g':(add(q,{ij:t*c for ij,c in shift(f,0,1).items()}),h)}
    for label,(a,b) in tests.items():
     if label in result:continue
     bad=mixed(a,b)
     if bad:result[label]=dict(word=list(map(int,w)),t=t,**bad)
    count+=1
   if len(result)==4:break
  if len(result)==4:break
 rec=dict(cases=count,failures=result,status='candidate mixed-gap conditions, finite exact experiments only')
 (O/'invariants.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec,indent=2))
if __name__=='__main__':main()
