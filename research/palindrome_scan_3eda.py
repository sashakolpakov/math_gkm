"""Machine-authored exact experiments; palindromes need not be sources."""
import pathlib,json,itertools,time,sys
from balanced_f80 import add,mul,failure
u={(1,0):1};v={(0,1):1};one={(0,0):1}
def poly(w):
 x=y=one
 for c in w[:len(w)//2]:
  h=add(mul(v,x),mul(u,y))
  x,y=(add(h,x),h) if c else (h,add(h,y))
 if len(w)%2==0:return add(mul(v,mul(x,x)),mul(u,mul(y,y)))
 h=add(mul(v,x),mul(u,y));g=x if w[len(w)//2] else y
 return add(mul(h,h),mul(v if w[len(w)//2] else u,mul(g,g)))
def main():
 t=time.monotonic();o=pathlib.Path('evidence/markov-3edac4bf');nmax=int(sys.argv[1]);counts={};bad=[];bad_nocc=[]
 for n in range(nmax+1):
  count=0
  for half in itertools.product([False,True],repeat=(n+1)//2):
   w=half+(half[:-1] if n%2 else half)[::-1]
   f=failure(poly(w));count+=1
   if f:
    rec=dict(word=''.join('C' if x else 'A' for x in w),**f)
    if len(bad)<10:bad.append(rec)
    if w and not w[0] and all(not(w[i] and w[i+1]) for i in range(n-1)) and len(bad_nocc)<10:bad_nocc.append(rec)
  counts[n]=count
  result=dict(status='exact finite experiment, not proof',counts=counts,failures=bad,no_CC_A_ends_failures=bad_nocc,seconds=time.monotonic()-t)
  (o/'palindrome-scan.json').write_text(json.dumps(result,indent=2)+'\n')
  print(json.dumps(dict(n=n,count=count,failures=len(bad),restricted_failures=len(bad_nocc))),flush=True)
  if bad_nocc:break
 print(json.dumps(result))
if __name__=='__main__':main()
