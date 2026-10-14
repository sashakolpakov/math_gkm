"""Machine-authored exact finite source-matrix experiment; not a proof."""
import json,pathlib,sys,time
sys.path.insert(0,str(pathlib.Path('evidence/markov').resolve()))
from scan import add,mul,generate
one={(0,0):1}; u={(1,0):1}; v={(0,1):1}; s=add(add(u,v),one)
A=(v,one,mul(u,v),add(u,one))
B=(mul(v,s),add(u,v),mul(mul(u,v),add(s,one)),mul(u,s))
def mm(a,b):
 return tuple(add(mul(a[2*i],b[j]),mul(a[2*i+1],b[2+j])) for i in range(2) for j in range(2))
def fail(p):
 im=max(i for i,j in p); jm=max(j for i,j in p)
 for di,dj in [(1,0),(0,1),(1,-1)]:
  for i in range(im+1):
   for j in range(jm+1):
    c=[p.get((i+k*di,j+k*dj),0) for k in range(3)]
    if c[1]**2<c[0]*c[2]:return dict(direction=[di,dj],start=[i,j],coefficients=c)
start=time.monotonic(); count=0; failures=[]; bridge=[]; weight_fail=[]
for path,(a,b,p) in generate(20):
 lo,hi=A,B
 for r in path:
  mid=mm(lo,hi)
  if r=='L':hi=mid
  else:lo=mid
 mat=mm(lo,hi); count+=1
 if mat[1]!=p:bridge.append(path)
 for idx,entry in enumerate(mat):
  f=fail(entry)
  if f and len(failures)<20:failures.append(dict(path=path,a=a,b=b,entry=idx,**f))
 for m,n in [(0,1),(1,0),(1,1),(b,a),(b,a+1),(b+1,a),(2,7),(7,2)]:
  actual=min(m*i+n*j for i,j in p)
  if actual!=min(a*m,b*n):weight_fail.append([a,b,m,n,actual])
out=dict(status='finite exact experiment only; matrix entry failures do not refute the raw upper-right target',
 bound=20,fractions=count,source_matrix_mismatches=bridge,
 weighted_minimum_failures=weight_fail,other_entry_lc_failures=failures,seconds=time.monotonic()-start)
pathlib.Path('evidence/markov-18ae9bbc/raw-invariants.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
