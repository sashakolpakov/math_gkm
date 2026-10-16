"""Machine-authored positive all-row column representation experiment; not a proof."""
from pathlib import Path
from math import comb
import json,time,sys
sys.path.insert(0,'research')
from experiment_interior_f1e4fe3b import raw
O=Path('evidence/markov-ec6f4b83')
def rising(r,a):return int(a==0) if r==0 else comb(r+a-1,a)
def column(q,i):
 if i==0:return {2*q+1:1,2*q+2:1},{}
 ans={};parts={}
 def put(part,j,c):
  if c:part[j]=part.get(j,0)+c
 for kind,offset in [('A',1),('B',2)]:
  for r in range(max(0,i-offset)+1):
   k=i-offset-r
   if k<0 or k>r:continue
   e=r-k;part={};fac=2**(e+(kind=='A'))*comb(r,k)
   for delta in [0,1]:
    n=q-r-delta
    for b in range(n+1):
     for c in (range(n-b+1) if kind=='A' else [0]):
      a=n-b-c
      z=fac*rising(r+(kind=='B'),a)*comb(r+1+b,b)
      for l in range(e+1):put(part,(kind=='A')+delta+2*b+c+l,z*comb(e,l))
   parts[f'{kind}{r}']=part
   for j,c in part.items():put(ans,j,c)
 return ans,parts
def main():
 t=time.monotonic();out={'status':'candidate generating-function identity, finite verification only',
 'columns':0,'coefficients':0,'zero_coefficients':0,'failures':[],'summand_lc_obstructions':[]}
 for q in list(range(1,21))+[30,50,80]:
  p=raw(2,2*q+1)
  for i in range(2*q+5 if q<=20 else 9):
   ans,parts=column(q,i);out['columns']+=1
   for j in range(2*q+5):
    x,y=ans.get(j,0),p.get((i,j),0)
    out['coefficients']+=1;out['zero_coefficients']+=int(y==0)
    if x!=y:out['failures'].append([q,i,j,x,y])
   for name,part in parts.items():
    for j in range(2*q+2):
     a,b,c=[part.get(j+h,0) for h in range(3)]
     if a*c>b*b and len(out['summand_lc_obstructions'])<8:
      out['summand_lc_obstructions'].append({'q':q,'i':i,'part':name,'j':j,'values':[a,b,c],
       'raw_values':[p.get((i,j+h),0) for h in range(3)]})
 out['seconds']=time.monotonic()-t
 (O/'column-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
