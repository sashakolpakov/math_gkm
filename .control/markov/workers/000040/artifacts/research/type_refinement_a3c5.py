"""Machine-authored type-aggregated pair comparison, exact finite experiment."""
import json,math,time,pathlib
from collections import defaultdict
from aggregate_a3c5 import core,poly
def plus(*ps):
 d=defaultdict(int)
 for p in ps:
  for k,c in p.items():d[k]+=c
 return dict(d)
def sh(p,a,b,c):return {(i+a,j+b,k+c):v for (i,j,k),v in p.items()}
def refined(w):
 f=g={(0,0,0):1}
 for r in reversed(w):
  h=plus(sh(f,0,1,0),sh(g,1,0,0))
  f,g=(plus(h,sh(f,0,0,1)),h) if r else (h,plus(h,g))
 return plus(sh(f,0,1,0),sh(g,1,0,0))
def conv(a,b):
 d=defaultdict(int)
 for i,x in a.items():
  for j,y in b.items():d[i+j]+=x*y
 return d
def main():
 start=time.monotonic();first={};count=0;bydir=[0,0,0];samples=[]
 for b in range(2,32):
  for a in range(1,b):
   if math.gcd(a,b)!=1:continue
   w=core(a,b);p=refined(w);rows={}
   for (i,j,k),v in p.items():rows.setdefault((i,j),{})[k]=v
   assert {ij:sum(cs.values()) for ij,cs in rows.items()}==poly(w)
   for i,j in rows:
    for di,(x,y) in enumerate([(1,0),(0,1),(1,-1)]):
     low=rows[i,j];mid=rows.get((i+x,j+y),{});high=rows.get((i+2*x,j+2*y),{})
     if not high:continue
     l=conv(mid,mid);r=conv(low,high);gap={k:l[k]-r[k] for k in l.keys()|r.keys()};count+=1
     bad={k:v for k,v in gap.items() if v<0}
     if bad:
      bydir[di]+=1
      first.setdefault(str(di),dict(a=a,b=b,low=[i,j],direction=[x,y],coefficients=[low,mid,high],gap=gap,negative=bad,raw_gap=sum(gap.values())))
   samples.append([a,b])
   if len(first)==3:break
  if len(first)==3:break
 res=dict(status='exact finite coefficientwise type-refined experiment; no universal theorem',sources=samples,triples=count,first_failures=first,failures_by_direction=bydir,seconds=time.monotonic()-start)
 pathlib.Path('evidence/markov-a3c53fa7/type-refinement.json').write_text(json.dumps(res,indent=2)+'\n');print(json.dumps(res))
if __name__=='__main__':main()
