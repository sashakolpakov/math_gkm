"""Machine-authored exact Sturm experiments. Finite evidence, not Lean proof."""
import math,json,pathlib,time
from fractions import Fraction as F
from gas_probe_0618 import poly
def trim(p):
 p=list(p)
 while p and not p[-1]:p.pop()
 return p
def primitive(p):
 p=trim(p)
 if not p:return p
 d=math.lcm(*(x.denominator for x in p));a=[int(x*d) for x in p];g=math.gcd(*a)
 return [F(x//g) for x in a]
def rem(p,q):
 p=list(p)
 while len(p)>=len(q):
  c=p[-1]/q[-1];k=len(p)-len(q)
  for j,x in enumerate(q):p[k+j]-=c*x
  p=trim(p)
 return p
def sturm(p):
 p=trim(p)
 while len(p)>1 and p[0]==0:p=p[1:]
 seq=[primitive(list(map(F,p))),primitive([F(i*p[i]) for i in range(1,len(p))])]
 if not seq[-1]:return dict(real=True,degree=len(p)-1)
 while True:
  z=primitive([-x for x in rem(seq[-2],seq[-1])])
  if not z:break
  seq.append(z)
 def changes(negative):
  ss=[(1 if z[-1]>0 else -1)*(-1 if negative and len(z)%2==0 else 1) for z in seq]
  return sum(a!=b for a,b in zip(ss,ss[1:]))
 count=changes(True)-changes(False);distinct=len(seq[0])-len(seq[-1])
 return dict(real=count==distinct,degree=len(p)-1,distinct=distinct,real_roots=count)
def main():
 t=time.monotonic();checks=0;fail={}
 for n in range(21):
  p=poly([False,True]*n+[False]);d=2*n+2
  for axis in [0,1]:
   for fixed in range(d+1):
    row=[p.get((k,fixed) if axis==0 else (fixed,k),0) for k in range(d+1)]
    if not any(row):continue
    s=sturm(row);checks+=1
    if not s['real'] and str(axis) not in fail:fail[str(axis)]=dict(n=n,a=n+1,b=n+2,fixed=fixed,coefficients=row,**s)
  out=dict(status='exact finite Sturm experiment only',n_max=n,checks=checks,first_failures=fail,seconds=time.monotonic()-t)
  pathlib.Path('evidence/markov-9a720f77/pell-roots.json').write_text(json.dumps(out,indent=2)+'\n')
  print(json.dumps(out),flush=True)
if __name__=='__main__':main()
