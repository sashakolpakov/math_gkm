"""Machine-authored finite check of the proposed all-column positive expansion."""
import pathlib,sys,math,json,time
sys.path.insert(0,str(pathlib.Path('evidence/markov').resolve()))
from scan import add,mul
v={(0,1):1};u={(1,0):1};one={(0,0):1};s=add(add(u,v),one)
shift=lambda p,a,b,c:{(i+a,j+b):c*x for (i,j),x in p.items()}
f=[one,add(u,v)]
for n in range(2,18):f.append(add(mul(s,f[-1]),mul(v,f[-2]),-1))
base={(1,0):1,(0,1):2,(0,0):2};powers=[one]
for k in range(16):powers.append(mul(powers[-1],base))
def invcoeff(power,n):
 return int(n==0) if power==0 else math.comb(power+n-1,power-1)
fail=[];checks=0;start=time.monotonic()
for q in range(16):
 ans={(0,2*q+1):1,(0,2*q+2):1}
 for k in range(q+1):
  for e in [0,1]:
   rem=q-k-e
   if rem<0:continue
   for b in range(rem+1):
    a=rem-b
    c=invcoeff(k+1,a)*invcoeff(k+2,b)
    ans=add(ans,shift(powers[k],k+2,2*b+e,c))
    for z in range(rem-b+1):
     a=rem-b-z
     c=2*invcoeff(k,a)*invcoeff(k+2,b)
     ans=add(ans,shift(powers[k],k+1,2*b+z+e+1,c))
 expect=add(mul(f[q+1],f[q+1]),mul(v,mul(f[q],f[q])))
 for ij in set(ans)|set(expect):
  checks+=1
  if ans.get(ij,0)!=expect.get(ij,0):fail.append([q,list(ij),ans.get(ij,0),expect.get(ij,0)])
res=dict(status='finite exact check, not Lean coefficient expansion theorem',q_bound=15,
 coefficient_checks=checks,failures=fail,seconds=time.monotonic()-start)
pathlib.Path('evidence/markov-3af43e69/positive-expansion.json').write_text(json.dumps(res,indent=2)+'\n')
print(json.dumps(res))
