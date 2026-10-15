"""Machine-authored e45ef6ac. Palindromic adjacent-run extension stress test."""
from run_order_e45e import transfer
from itertools import product
from math import gcd
from pathlib import Path
import json,time
O=Path('evidence/markov-e45ef6ac')
def main():
 start=time.monotonic();inputs=[];checks=[0,0,0];fail={}
 for L in range(1,8):
  for half in product((0,1),repeat=L):
   for middle in [(),(0,),(1,)]:
    v=half+middle+half[::-1]
    for n in range(3):
     w=(1,)*n+(0,)+sum(((1,)*(n+r)+(0,) for r in v),())+(1,)*(n+1)
     a,b=sum(w),len(w)+1
     if gcd(a,b)!=1:continue
     assert w[:-1]==w[-2::-1]
     mech=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,)
     if w==mech:continue
     F=transfer(w,len(w))
     for dr,(di,dj) in enumerate([(1,0),(0,1),(1,-1)]):
      if str(dr) in fail:continue
      for i in range(a+b):
       for j in range(a+b-i):
        pts=[(i+t*di,j+t*dj) for t in range(3)]
        if not all(u>=0 and z>=0 and b*u+a*z>=a*b and u+z<=a+b-1 for u,z in pts):continue
        vals=[F.get((u+z-a,z),0) for u,z in pts];checks[dr]+=1
        if vals[1]**2<vals[0]*vals[2]:
         fail[str(dr)]=dict(n=n,interior=v,word=w,a=a,b=b,mechanical_word=mech,points=pts,values=vals,gap=vals[1]**2-vals[0]*vals[2]);break
       if str(dr) in fail:break
     inputs.append(dict(n=n,interior=v,a=a,b=b))
     rec=dict(status='finite exact computation on coprime-label palindromic non-source words',inputs=inputs,checks=checks,failures=fail,seconds=time.monotonic()-start)
     (O/'palindrome.json').write_text(json.dumps(rec,indent=2)+'\n')
     if len(fail)==3 or time.monotonic()-start>90:
      print(json.dumps({k:v for k,v in rec.items() if k!='inputs'}));return
 print(json.dumps({k:v for k,v in rec.items() if k!='inputs'}))
if __name__=='__main__':main()
