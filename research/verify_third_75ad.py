"""Machine-authored finite exact checks, with an independent literal recurrence."""
from pathlib import Path
from math import gcd
from itertools import combinations
from third_cert_75ad import coefficients
from third_lower_75ad import stats,raw3
from run_order_e45e import transfer
import json,time
O=Path('evidence/markov-75ad68f9')
def add(p,q):
 d=dict(p)
 for k,v in q.items():d[k]=d.get(k,0)+v
 return {k:v for k,v in d.items() if v}
def shift(p,k,c=1):return {j+k:c*v for j,v in p.items()}
def backward(w,S):
 alpha=[{} for _ in range(S+1)];beta=[{0:1}]+[{} for _ in range(S)]
 for r in reversed(w):
  aa=[];bb=[]
  for s in range(S+1):
   h=add(shift(alpha[s-1],1),beta[s-1]) if s else {}
   if r:h=add(h,shift(h,1))
   aa.append(add(shift(alpha[s],1) if r else {},h))
   bb.append(add(add(beta[s],shift(alpha[s],1,2) if r else {}),h))
  alpha,beta=aa,bb
 return add(shift(alpha[S],1),beta[S])
def mul(p,q):
 d={}
 for (i,j),a in p.items():
  for (k,l),b in q.items():d[i+k,j+l]=d.get((i+k,j+l),0)+a*b
 return d
def source(path):
 S={(0,0):1,(1,0):1,(0,1):1};lo=(0,1,{(0,0):1});m=(1,2,{(2,0):1,(1,1):2,(0,2):1,(1,0):1});hi=(1,1,{(1,0):1,(0,1):1})
 for r in path:
  x,z=(hi,lo) if r else (lo,hi)
  p=add(mul(mul(S,x[2]),m[2]),{k:-v for k,v in mul({(x[0],x[1]):1},z[2]).items()})
  new=(m[0]+x[0],m[1]+x[1],p)
  if r:lo,m=m,new
  else:hi,m=m,new
 return m
def path_for(a,b):
 lo=(0,1);hi=(1,1);m=(1,2);p=[]
 while m!=(a,b):
  r=a*m[1]>b*m[0];p.append(r)
  if r:lo,m=m,(m[0]+hi[0],m[1]+hi[1])
  else:hi,m=m,(lo[0]+m[0],lo[1]+m[1])
 return p
def main():
 start=time.monotonic();checks=0;rawchecks=0;inputs=[];fail=[]
 for b in range(5,101):
  for a in range(1,(b+1)//2):
   if gcd(a,b)>1 or b-a<4:continue
   c=b-a;r=a;q=max(2*r-c,0);t=min(c-r,max(3*r-c,0));u=max(3*r-2*c,0)
   w=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,)
   D=backward(w,3);C=coefficients(c,r,q,t,u)
   for j in range(a+b):
    checks+=1;expected=C[j] if j<6 else 0
    if 6*D.get(j,0)!=expected:fail.append([a,b,j,D.get(j,0),expected])
   if b<=30:
    aa,bb,P=source(path_for(a,b));assert (aa,bb)==(a,b)
    for j in range(a+4):
     i=a+3-j;assert 6*P.get((i,j),0)==(C[j] if j<6 else 0);rawchecks+=1
   inputs.append([a,b])
 z=(0,1)*29+(0,1,1,1)+(0,1)*29
 w=tuple(x for r in z for x in ((0,1) if r else (0,)))[1:]
 D=backward(w,3);FF=transfer(w,3);assert all(D.get(j,0)==FF.get((3,j),0) for j in range(10))
 v=[D.get(j,0) for j in [3,4,5]];a=sum(w);b=len(w)+1
 points=[[a+3-j,j] for j in [3,4,5]];guards=[a*b<=b*i+a*j and i+j<=a+b-1 for i,j in points]
 aa,bb,P=source(path_for(a,b));actual=[P.get(tuple(pt),0) for pt in points]
 witness=dict(word=w,interior=z[1:-1],n=0,synthetic_labels=[a,b],cuts=3,j=3,values=v,gap=v[1]**2-v[0]*v[2],points=points,polygon_guards=guards,actual_source_values=actual,actual_source_gap=actual[1]**2-actual[0]*actual[2],source_exclusion='Word core is not palindromic; endpoint j=5 lies outside the canonical source polygon. No root refutation.')
 rec=dict(status='exact finite experiments only',inputs=inputs,formula_positions=checks,independent_raw_positions=rawchecks,failures=fail,adjacent_run_witness=witness,seconds=time.monotonic()-start)
 (O/'third-verification.json').write_text(json.dumps(rec,indent=2));print(json.dumps({k:v for k,v in rec.items() if k!='inputs' and k!='adjacent_run_witness'}));print(json.dumps({k:v for k,v in witness.items() if k not in ['word','interior']}))
if __name__=='__main__':main()
