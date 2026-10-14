"""Machine-authored source-pair product decomposition LC experiment."""
import json,pathlib,time,sys
from balanced_f80 import A,B,mm,mul,failure
from scan import generate
def slices(p,d):
 out={}
 for (i,j),v in p.items():
  row,k=(j,i) if d==0 else ((i,j) if d==1 else (i+j,i))
  out.setdefault(row,{})[k]=v
 return out
def conv(p,q):
 out={}
 for i,x in p.items():
  for j,y in q.items():out[i+j]=out.get(i+j,0)+x*y
 return out
def sync(f,g):
 for k in sorted(set(f)|set(g)):
  lhs=2*f.get(k,0)*g.get(k,0)
  rhs=f.get(k-1,0)*g.get(k+1,0)+f.get(k+1,0)*g.get(k-1,0)
  if lhs<rhs:return dict(k=k,lhs=lhs,rhs=rhs,f=[f.get(k+t,0) for t in [-1,0,1]],g=[g.get(k+t,0) for t in [-1,0,1]])
def main():
 start=time.monotonic(); first={}; counts=0; failcount={};bound=int(sys.argv[1])
 for path,(a,b,p) in generate(bound):
  lo,hi=A,B
  for c in path:
   m=mm(lo,hi)
   if c=='L':hi=m
   else:lo=m
  for d in range(3):
   rows={}
   for summand,(x,y) in enumerate([(lo[0],hi[1]),(lo[1],hi[3])]):
    xs,ys=slices(x,d),slices(y,d)
    for r,f in xs.items():
     for s,g in ys.items():rows.setdefault(r+s,[]).append(((summand,r,s),conv(f,g)))
   for r,terms in rows.items():
    for k,(tag,f) in enumerate(terms):
     for tag2,g in terms[k:]:
      counts+=1; h=sync(f,g)
      if h:
       failcount[d]=failcount.get(d,0)+1
       if d not in first:first[d]=dict(a=a,b=b,path=path,direction=d,row=r,tags=[tag,tag2],**h)
 result=dict(bound=bound,pairs=counts,failcounts=failcount,first=first,seconds=time.monotonic()-start,status='finite experiment; failure of sufficient pairwise synchronization does not refute LC')
 pathlib.Path(f'evidence/markov-f80fb8bc/synchronization-{bound}.json').write_text(json.dumps(result,indent=2));print(json.dumps(result))
if __name__=='__main__':main()
