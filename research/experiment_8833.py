"""Machine-authored exact finite checks, separate from Lean proof evidence."""
from pathlib import Path
from math import gcd
import json,time
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-8833a0fb'
def add(p,q):
 d=dict(p)
 for k,v in q.items():d[k]=d.get(k,0)+v
 return {k:v for k,v in d.items() if v}
def mul(p,q):
 d={}
 for (i,j),a in p.items():
  for (k,l),b in q.items():d[i+k,j+l]=d.get((i+k,j+l),0)+a*b
 return d
def source(path):
 S={(0,0):1,(1,0):1,(0,1):1};lo=(0,1,{(0,0):1});m=(1,2,{(2,0):1,(1,1):2,(0,2):1,(1,0):1});hi=(1,1,{(1,0):1,(0,1):1})
 for bit in path:
  x,z=(hi,lo) if bit else (lo,hi)
  p=add(mul(mul(S,x[2]),m[2]),{k:-v for k,v in mul({(x[0],x[1]):1},z[2]).items()})
  new=(m[0]+x[0],m[1]+x[1],p)
  if bit:lo,m=m,new
  else:hi,m=m,new
 return m
def path_for(a,b):
 lo=(0,1);hi=(1,1);m=(1,2);p=[]
 while m!=(a,b):
  bit=a*m[1]>b*m[0];p.append(bit)
  if bit:lo,m=m,(m[0]+hi[0],m[1]+hi[1])
  else:hi,m=m,(lo[0]+m[0],lo[1]+m[1])
 return p
def shift(p,k,c=1):return {j+k:c*v for j,v in p.items()}
def backward(w,S):
 alpha=[{} for _ in range(S+1)];beta=[{0:1}]+[{} for _ in range(S)]
 for bit in reversed(w):
  aa=[];bb=[]
  for s in range(S+1):
   h=add(shift(alpha[s-1],1),beta[s-1]) if s else {}
   if bit:h=add(h,shift(h,1))
   aa.append(add(shift(alpha[s],1) if bit else {},h))
   bb.append(add(add(beta[s],shift(alpha[s],1,2) if bit else {}),h))
  alpha,beta=aa,bb
 return add(shift(alpha[S],1),beta[S])
def polyguard(a,b,i,j):return i>=0 and j>=0 and a*b<=b*i+a*j and i+j<=a+b-1
def main():
 start=time.monotonic();raw_positions=triples=tail_positions=back_positions=0;fail=[];inputs=[]
 for c,r in [(2,1),(3,1),(3,2)]:
  for n in range(4,81):
   a=c*n+r;b=c*(n+1)+r
   w=[(k+1)*a//b-k*a//b for k in range(1,b)]
   p=backward(w,3);inputs.append([n,c,r,a,b])
   if c==2:
    expected=[440*n-532,120*n-92,22*n-8,2*n]
    for k,v in enumerate(expected,1):
     assert p.get(2*n+k,0)==v,(n,c,r,k,v,p.get(2*n+k,0));tail_positions+=1
   else:
    vals=[72,12,1] if r==1 else [292,72,12,1]
    for k,v in enumerate(vals):
     assert p.get(3*n+2+k,0)==v,(n,c,r,k,v,p.get(3*n+2+k,0));tail_positions+=1
   for j in range(a+4):
    if j+2<=a+3:
     i=a+3-j-2
     if all(polyguard(a,b,*z) for z in [(i,j+2),(i+1,j+1),(i+2,j)]):
      assert p.get(j+1,0)**2>=p.get(j,0)*p.get(j+2,0),(n,c,r,j);triples+=1
    back_positions+=1
   if n<=10:
    aa,bb,raw=source(path_for(a,b));assert (aa,bb)==(a,b)
    for j in range(a+4):
     assert raw.get((a+3-j,j),0)==p.get(j,0),(a,b,j);raw_positions+=1
 for b in range(2,41):
  for a in range(1,b):
   if gcd(a,b)>1:continue
   aa,bb,raw=source(path_for(a,b));assert (aa,bb)==(a,b)
   for j in range(a+2):
    i=a+1-j
    if all(polyguard(a,b,*z) for z in [(i,j+2),(i+1,j+1),(i+2,j)]):
     assert raw.get((i+1,j+1),0)**2>=raw.get((i,j+2),0)*raw.get((i+2,j),0),(a,b,i,j)
     triples+=1
 rec=dict(status='Exact finite evidence only; not a universal proof',small_cycle_inputs=inputs,tail_positions=tail_positions,backward_positions=back_positions,literal_raw_positions=raw_positions,valid_triples=triples,all_fraction_denominator_bound=40,failures=fail,seconds=time.monotonic()-start)
 (O/'experiments.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps({k:v for k,v in rec.items() if k!='small_cycle_inputs'}))
if __name__=='__main__':main()
