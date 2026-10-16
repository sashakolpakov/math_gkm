"""Machine-authored exact rational polynomial computations, not kernel proofs."""
from fractions import Fraction as F
from math import factorial,comb
from pathlib import Path
import json
O=Path('evidence/markov-0d346fa7')
def add(*ps):
 z={}
 for p in ps:
  for k,v in p.items():z[k]=z.get(k,F(0))+v
 return {k:v for k,v in z.items() if v}
def scale(p,c):return {k:v*c for k,v in p.items() if v*c}
def mul(p,q):
 z={}
 for (a,b),v in p.items():
  for (c,d),w in q.items():z[(a+c,b+d)]=z.get((a+c,b+d),F(0))+v*w
 return {k:v for k,v in z.items() if v}
one={(0,0):F(1)};X={(1,0):F(1)};Y={(0,1):F(1)}
def const(c):return scale(one,F(c))
def choose(p,k):
 z=one
 for h in range(k):z=mul(z,add(p,const(-h)))
 return scale(z,F(1,factorial(k)))
def L(j,d,i):
 return add(*(scale(mul(choose(scale(d,2),h),add(choose(add(j,const(i+1)),2*i-1-h),choose(add(j,const(i)),2*i-1-h))),comb(2*i-2-h,i)) for h in range(i-1)))
def U(n,d,i):
 return add(*(scale(mul(choose(add(scale(d,2),const(h-1)),h),add(choose(add(n,const(i-h+1)),2*i-1-h),choose(add(n,const(i-h)),2*i-1-h))),comb(2*i-2-h,i-h)) for h in range(i+1) if i-h>=0 and 2*i-2-h>=i-h))
def gap(a,b,c):return add(mul(b,b),scale(mul(a,c),-1))
def dump(name,p):
 (O/(name+'.json')).write_text(json.dumps([[a,b,str(v)] for (a,b),v in sorted(p.items())],indent=2)+'\n')
 return {'name':name,'terms':len(p),'negative':[[*k,str(v)] for k,v in p.items() if v<0]}
def main():
 out=[]
 for i in [3,4,5,6]:
  for s in range(4):
   j=add(X,const(s));d=add(Y,const(2))
   p=gap(L(j,d,i),L(add(j,one),add(d,const(-1)),i),L(add(j,const(2)),Y,i))
   out.append(dump(f'poly-lower-i{i}-s{s}',p))
  n=add(X,const(i-2));d=add(Y,one)
  p=gap(U(add(n,const(2)),d,i),U(add(n,one),add(d,one),i),U(n,add(d,const(2)),i))
  out.append(dump(f'poly-upper-i{i}',p))
  q=add(X,const(i))
  out.append(dump(f'poly-cross1-i{i}',gap(L(add(q,const(-1)),one,i),L(q,{},i),U(add(q,const(-1)),one,i))))
  out.append(dump(f'poly-cross2-i{i}',gap(L(q,{},i),U(add(q,const(-1)),one,i),U(add(q,const(-2)),const(2),i))))
 (O/'poly-probe.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps([{**v,'negative_count':len(v['negative']),'negative':v['negative'][:3]} for v in out]))
if __name__=='__main__':main()
