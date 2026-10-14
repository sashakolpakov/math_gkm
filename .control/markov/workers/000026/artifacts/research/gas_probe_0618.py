"""Exact finite directional tests of arbitrary gas cores. Not a proof."""
import pathlib,json,time,itertools,sys
from balanced_f80 import add,mul
U={(1,0):1};V={(0,1):1};ONE={(0,0):1}
def poly(w):
 x=y=ONE
 for r in reversed(w):
  h=add(mul(V,x),mul(U,y))
  x,y=(add(h,x),h) if r else (h,add(h,y))
 return add(mul(V,x),mul(U,y))
def failures(p):
 out={}
 for di,dj in [(1,0),(0,1),(1,-1)]:
  for i,j in p:
   if j+2*dj<0:continue
   cs=[p.get((i+k*di,j+k*dj),0) for k in range(3)]
   if cs[1]**2<cs[0]*cs[2]:out[str((di,dj))]=dict(start=[i,j],coefficients=cs);break
 return out
def main():
 o=pathlib.Path('evidence/markov-061840e8');t=time.monotonic();first={};counts={};total=0
 for n in range(int(sys.argv[1])+1):
  counts[n]={str(d):0 for d in [(1,0),(0,1),(1,-1)]}
  for w in itertools.product([False,True],repeat=n):
   total+=1
   for d,f in failures(poly(w)).items():
    counts[n][d]+=1
    if d not in first:first[d]=dict(word=''.join('C' if x else 'A' for x in w),**f)
  result=dict(status='finite exact experiment only',cores=total,counts=counts,first_failures=first,seconds=time.monotonic()-t)
  (o/'gas-directions.json').write_text(json.dumps(result,indent=2)+'\n')
  print(json.dumps(dict(n=n,first=first,seconds=time.monotonic()-t)),flush=True)
if __name__=='__main__':main()
