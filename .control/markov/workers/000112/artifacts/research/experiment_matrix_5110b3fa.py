"""Machine-authored all-order matrix/source comparison; exact finite evidence only."""
from experiment_8833 import add,mul,source,path_for
from math import comb,gcd
from pathlib import Path
import time,json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-5110b3fa'
one={(0,0):1};X={(1,0):1};Y={(0,1):1};H=add(one,X);H2=mul(H,H);Y2=mul(Y,Y)
A=(Y,Y,mul(X,Y),add(one,mul(X,Y)))
B=(add(Y,mul(H2,Y2)),add(mul(add(X,{(0,0):2}),Y),mul(H2,Y2)),
   add(mul(mul(X,add(X,{(0,0):2})),Y),mul(mul(X,H2),Y2)),
   add(add(X,mul(mul(X,add({(1,0):2},{(0,0):3})),Y)),mul(mul(X,H2),Y2)))
def mm(m,n):return tuple(add(mul(m[i],n[j]),mul(m[i+1],n[j+2])) for i in [0,2] for j in [0,1])
def neg(p):return {k:-v for k,v in p.items()}
def hp(n):return {(i,0):comb(n,i) for i in range(n+1)}
start=time.monotonic();cases=positions=rows=0;fails=[]
for b in range(2,25):
 for a in range(1,b):
  if gcd(a,b)>1:continue
  word=[(k+1)*a//b-k*a//b for k in range(b)]
  m=(one,{}, {},one)
  for bit in word:m=mm(m,B if bit else A)
  dif=add(add(m[1],m[3]),neg(add(m[0],m[2])))
  assert all(v>=0 for v in dif.values()),(a,b)
  p=source(path_for(a,b))[2]
  psub={}
  for (i,j),v in p.items():
   for k in range(2*j+1):psub[i+k,j]=psub.get((i+k,j),0)+v*comb(2*j,k)
  rhs=mul(hp(b-1),dif)
  assert psub==rhs,(a,b,'identity')
  trace=add(m[0],m[3]);prev={}
  for j in range(a+b+2):
   cur=add({(i,0):v for (i,k),v in trace.items() if k==j},neg(mul(H,prev)))
   expected={(i,0):v for (i,k),v in dif.items() if k==j}
   assert cur==expected,(a,b,j,'recursion');prev=cur;rows+=1
  cases+=1;positions+=len(psub)
out=dict(status='Exact finite checks, not proof',fractions=cases,source_coefficients=positions,residual_rows=rows,failures=fails,domain='All reduced 1<=a<b<=24, full polynomial identity and zero-extended residual recursion',seconds=time.monotonic()-start)
(O/'matrix-source-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
