"""Machine-authored next-slice probe; finite evidence, no theorem premise."""
from experiment_8833 import source,path_for,backward,polyguard,R,O
from math import gcd
import json,time
def main():
 t=time.monotonic();checks=rawchecks=0;families=0;examples=[];fail=[]
 for b in range(2,61):
  for a in range(1,b):
   if gcd(a,b)>1:continue
   w=[(k+1)*a//b-k*a//b for k in range(1,b)]
   p=backward(w,4);families+=1
   if b<=30:
    aa,bb,raw=source(path_for(a,b));assert (aa,bb)==(a,b)
    for j in range(a+5):
     assert p.get(j,0)==raw.get((a+4-j,j),0),(a,b,j);rawchecks+=1
   for j in range(a+3):
    i=a+2-j
    if all(polyguard(a,b,*z) for z in [(i,j+2),(i+1,j+1),(i+2,j)]):
     vals=[p.get(j,0),p.get(j+1,0),p.get(j+2,0)];gap=vals[1]**2-vals[0]*vals[2]
     checks+=1
     if gap<0:fail.append([a,b,i,j,vals])
     # Entirely inside the new core diagonal guard, excluding Fibonacci and Pell.
     if b>=11 and a>=3 and a+2<=b and len(examples)<12:
      examples.append(dict(a=a,b=b,path=path_for(a,b),slice=a+4,points=[[i+2,j],[i+1,j+1],[i,j+2]],raw=vals,gap=gap))
 rec=dict(status='Finite next-slice evidence only. No universal fourth-lower-slice formula or inequality proved.',denominator_bound=60,families=families,valid_triples=checks,independent_raw_positions=rawchecks,failures=fail,first_core_examples=examples,seconds=time.monotonic()-t)
 (O/'fourth-lower-probe.json').write_text(json.dumps(rec,indent=2)+'\n')
 print(json.dumps({k:v for k,v in rec.items() if k!='first_core_examples'}))
if __name__=='__main__':main()
