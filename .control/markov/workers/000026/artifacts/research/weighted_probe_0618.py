"""Exact evaluation of site-deformed source core polynomials; not source witnesses."""
import pathlib,json,random,math,time
from gas_probe_0618 import U,V,ONE,add,mul,failures
from refined_probe_0618 import source_core
def scale(p,c):return {k:v*c for k,v in p.items()}
def weighted(w,ts):
 x=y=ONE
 for c,t in reversed(list(zip(w,ts))):
  h=add(mul(V,x),mul(U,y))
  x,y=(add(h,scale(x,t)),h) if c else (h,add(h,scale(y,t)))
 return add(mul(V,x),mul(U,y))
def main():
 rng=random.Random(618);t=time.monotonic();first={};checks=0
 for b in range(3,16):
  for a in range(1,b):
   if math.gcd(a,b)>1:continue
   w=source_core(a,b)
   for mode in ['free','palindrome','letter']:
    for rep in range(100):
     ts=[rng.choice([1,2,10,100]) for _ in w]
     if mode=='palindrome':ts=[ts[min(k,len(w)-1-k)] for k in range(len(w))]
     if mode=='letter':ts=[ts[int(c)] for c in w]
     checks+=1
     for d,f in failures(weighted(w,ts)).items():
      key=mode+':'+d
      if key not in first:first[key]=dict(a=a,b=b,core=''.join('C' if c else 'A' for c in w),weights=ts,**f)
 result=dict(status='deformed polynomials, not pinned source counterexamples',checks=checks,first_failures=first,seconds=time.monotonic()-t)
 pathlib.Path('evidence/markov-061840e8/weighted-source-cores.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
if __name__=='__main__':main()
