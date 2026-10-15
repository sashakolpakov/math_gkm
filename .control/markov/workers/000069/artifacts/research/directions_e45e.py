"""Machine-authored e45ef6ac. All directions on adjacent-run words.
Labels are synthetic unless exact mechanical-word equality is verified.
"""
from run_order_e45e import transfer
from pathlib import Path
from itertools import product
from math import gcd
import json,time
O=Path('evidence/markov-e45ef6ac')
def main():
 start=time.monotonic();records=[];counts=[0,0,0];failures={}
 for L in range(9):
  for n in range(4):
   for v in product((0,1),repeat=L):
    w=(1,)*n+(0,)+sum(((1,)*(n+r)+(0,) for r in v),())+(1,)*(n+1)
    a,b=sum(w),len(w)+1;F=transfer(w,len(w))
    def inside(i,j):return i>=0 and j>=0 and b*i+a*j>=a*b and i+j<=a+b-1
    def val(i,j):return F.get((i+j-a,j),0)
    for direction,(di,dj) in enumerate([(1,0),(0,1),(1,-1)]):
     if str(direction) in failures:continue
     for i in range(a+b):
      for j in range(a+b-i):
       pts=[(i+t*di,j+t*dj) for t in range(3)]
       if not all(inside(*pt) for pt in pts):continue
       vals=[val(*pt) for pt in pts];counts[direction]+=1
       if vals[1]**2<vals[0]*vals[2]:
        mechanical=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,)
        failures[str(direction)]=dict(n=n,interior=v,word=w,synthetic_a=a,synthetic_b=b,coprime=gcd(a,b)==1,is_mechanical=w==mechanical,mechanical_word=mechanical,points=pts,values=vals,gap=vals[1]**2-vals[0]*vals[2]);break
      if str(direction) in failures:break
    records.append(dict(n=n,interior=v,a=a,b=b))
    rec=dict(status='finite exact computation; synthetic labels do not establish source membership',inputs=records,checks=counts,failures=failures,seconds=time.monotonic()-start)
    (O/'directions.json').write_text(json.dumps(rec,indent=2)+'\n')
    if len(failures)==3 or time.monotonic()-start>90:
     print(json.dumps({k:v for k,v in rec.items() if k!='inputs'}));return
 print(json.dumps({k:v for k,v in rec.items() if k!='inputs'}))
if __name__=='__main__':main()
