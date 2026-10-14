"""Machine-authored independent checks of the mixed-run count formula."""
from pathlib import Path
from math import comb
from fractions import Fraction as Q
from count_layers_68a4 import count
import json
O=Path('evidence/markov-68a44d34')
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def formula(p,q,s,d):
 if s==0:return int(d==0)
 k=d-s;l=d-s-1
 return (C(k,s-1) if 0<=k<q else 0)+(C(l,s-1) if 0<=l<p else 0)+(C(p,s-1) if d==p+s else 0)+(sum(C(i+j,s-2) for i in range(p+1) for j in range(q) if i+j+s+1==d) if s>=2 else 0)
def main():
 tests=0
 for p in range(13):
  for q in range(13):
   f=count((1,)*p+(0,)+(1,)*q,limit=8)
   for s in range(9):
    for d in range(p+q+s+3):
     assert formula(p,q,s,d)==f.get((s,d),0),(p,q,s,d)
     tests+=1
 witnesses=[]
 for p in range(1,101):
  d=p+6;v=[formula(p,p+1,s,d) for s in [4,5,6]]
  witnesses.append(dict(p=p,a=2*p+1,b=2*p+3,d=d,values=v,gap=v[1]**2-v[0]*v[2]))
 raw=[comb(68,s) for s in [4,5,6]]
 rec=dict(status='finite exact checks only',formula_checks=tests,witnesses=witnesses,source67_69_raw_boundary=raw,raw_gap=raw[1]**2-raw[0]*raw[2])
 (O/'count-formula.json').write_text(json.dumps(rec,indent=2)+'\n')
 print(json.dumps(dict(checks=tests,first_failure=next(w for w in witnesses if w['gap']<0),raw=raw,raw_gap=rec['raw_gap'])))
if __name__=='__main__':main()
