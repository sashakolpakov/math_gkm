"""Machine-authored independent literal source recurrence versus marked transfer."""
from pathlib import Path
from math import gcd
import json,time
from aligned_probe_6d2c import transfer
def mul(p,q):
 r={}
 for (i,j),a in p.items():
  for (k,l),b in q.items():r[i+k,j+l]=r.get((i+k,j+l),0)+a*b
 return r
def sub(p,q):
 r=dict(p)
 for k,c in q.items():r[k]=r.get(k,0)-c
 return {k:c for k,c in r.items() if c}
def raw(a,b):
 S={(0,0):1,(1,0):1,(0,1):1};lo=(0,1,{(0,0):1});mid=(1,2,{(2,0):1,(1,1):2,(0,2):1,(1,0):1});hi=(1,1,{(1,0):1,(0,1):1});path=[]
 while (mid[0],mid[1])!=(a,b):
  right=a*mid[1]>b*mid[0];path.append(right)
  if right:
   nxt=(mid[0]+hi[0],mid[1]+hi[1],sub(mul(mul(S,hi[2]),mid[2]),mul({(hi[0],hi[1]):1},lo[2])));lo,mid=mid,nxt
  else:
   nxt=(lo[0]+mid[0],lo[1]+mid[1],sub(mul(mul(S,lo[2]),mid[2]),mul({(lo[0],lo[1]):1},hi[2])));hi,mid=mid,nxt
 return path,mid[2]
def main():
 start=time.monotonic();inputs=[];fail=[];coefficients=0
 for b in range(3,29):
  for a in range(1,b):
   if gcd(a,b)!=1:continue
   path,P=raw(a,b);w=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,);F=transfer(w,b-1);Q={}
   for (s,d,j),v in F.items():Q[a+s-j,j]=Q.get((a+s-j,j),0)+v
   keys=set(P)|set(Q);coefficients+=len(keys);diff=[(k,P.get(k,0),Q.get(k,0)) for k in keys if P.get(k,0)!=Q.get(k,0)]
   if diff:fail.append(dict(a=a,b=b,differences=diff))
   inputs.append(dict(a=a,b=b,path=path,coefficients=len(keys)))
 rec=dict(status='finite exact independent recurrence check; not proof',inputs=inputs,coefficients=coefficients,failures=fail,seconds=time.monotonic()-start)
 Path('evidence/markov-6d2c5a67/transfer-validation.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(dict(sources=len(inputs),coefficients=coefficients,failures=fail,seconds=rec['seconds'])))
if __name__=='__main__':main()
