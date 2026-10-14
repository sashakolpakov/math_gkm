"""Machine-authored exact experiment for a proposed product LC invariant."""
import sys,pathlib,json,time
sys.path.insert(0,str(pathlib.Path('evidence/markov').resolve()))
from scan import add,mul
one={(0,0):1};u={(1,0):1};v={(0,1):1};s=add(add(u,v),one)
f=[one,add(u,v)]
for b in range(2,32):f.append(add(mul(s,f[-1]),mul(v,f[-2]),-1))
def fails(p):
 ans={}
 for di,dj in [(1,0),(0,1),(1,-1)]:
  for i,j in p:
   if j+2*dj<0:continue
   cs=[p.get((i+t*di,j+t*dj),0) for t in range(3)]
   if cs[1]**2<cs[0]*cs[2]:
    ans[str((di,dj))]=dict(start=[i,j],coefficients=cs);break
 return ans
start=time.monotonic();bad=[];checked=0;near=[]
for m in range(1,17):
 for n in range(m,17):
  for with_s in [False,True]:
   p=mul(f[m],f[n])
   if with_s:p=mul(s,p)
   ff=fails(p);checked+=1
   if ff:bad.append(dict(m=m,n=n,with_s=with_s,failures=ff))
for q in range(1,31):
 p=mul(mul(s,f[q]),f[q+1]); ff=fails(p)
 raw=add(p,{(1,q):1},-1)
 near.append(dict(q=q,product_failures=ff,raw_failures=fails(raw),removed_coefficient=p.get((1,q))))
result=dict(status='finite evidence only; product closure unproved',checked_products=checked,
 product_failures=bad,consecutive_cases=near,seconds=time.monotonic()-start)
pathlib.Path('evidence/markov-6ade2697/fibonacci-products.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(dict(checked=checked,failure_count=len(bad),first_failures=bad[:3],
 consecutive_failures=[x for x in near if x['product_failures'] or x['raw_failures']],seconds=result['seconds'])))
