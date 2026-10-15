"""Machine-authored exact finite checks, not universal proofs."""
from pathlib import Path
import json,time
from math import gcd
from probe_adb2 import candidate,jets,moment2,add,sub,mul,scale,source,path_for,backward
from itertools import product
O=Path('evidence/markov-8bbb934e')
def corrected(n,c,r):
 q=max(2*r-c,0);t=min(c-r,max(3*r-c,0));u=max(3*r-2*c,0)
 base=candidate(n,c,r,q,t,u)
 J={(p,z):jets(n,p,z) for p,z in product((0,1),repeat=2)}
 D=moment2({k:m['d'] for k,m in J.items()},c,r,q);F=sub(D,[1,1]);b=c*(n+1)+r
 mon=[0]*b+[1]
 # secondCompressed already includes the length-two quadratic correction.
 third=add(base,scale(mul(F,mon),6)) if c==2 else base
 if c==2:result=sub(third,scale(mul(D,mon),12))
 elif c==3:result=add(third,scale(mon,6))
 else:result=third
 return result,sub(result,third)
def main():
 start=time.monotonic();records=[];rawpositions=0;backpositions=0;triples=0
 pairs=set()
 for n in range(19):
  for c in [2,3]:
   for r in range(1,c):pairs.add((c*n+r,c*(n+1)+r))
 for b in range(2,61):
  for a in range(1,b):
   if gcd(a,b)==1 and 2*a>=b and 3*a<=2*b:pairs.add((a,b))
 for a,b in sorted(pairs,key=lambda ab:(ab[1],ab[0])):
  c=b-a;n=a//c;r=a-n*c
  if r==0:continue
  C,correction=corrected(n,c,r)
  aa,bb,raw=source(path_for(a,b));assert (aa,bb)==(a,b)
  w=tuple((k+1)*a//b-k*a//b for k in range(1,b));Q=backward(w,3)
  for j in range(max(a+5,len(C)+3)):
   v=C[j] if j<len(C) else 0
   assert 6*Q.get(j,0)==v,(a,b,j,'backward')
   backpositions+=1
   i=a+3-j
   if i>=0:
    assert 6*raw.get((i,j),0)==v,(a,b,i,j,'raw')
    rawpositions+=1
  gs=[]
  for j in range(a+2):
   i=a+1-j;pts=[(i,j+2),(i+1,j+1),(i+2,j)]
   if all(a*b<=b*x+a*y and x+y<=a+b-1 for x,y in pts):
    vals=[raw.get(p,0) for p in pts];gap=vals[1]**2-vals[0]*vals[2]
    assert gap>=0,(a,b,pts,vals)
    gs.append(gap);triples+=1
  records.append(dict(a=a,b=b,n=n,c=c,r=r,coefficient_list=C,correction=correction,valid_gaps=gs))
 summary=dict(status='finite exact computation only, not proof',sources=len(records),raw_positions=rawpositions,
   backward_positions=backpositions,polygon_triples=triples,small_cycle_run_bound=18,run_one_denominator_bound=60,
   seconds=time.monotonic()-start,records=records)
 (O/'experiments.json').write_text(json.dumps(summary,indent=2)+'\n')
 print(json.dumps({k:v for k,v in summary.items() if k!='records'}))
if __name__=='__main__':main()
