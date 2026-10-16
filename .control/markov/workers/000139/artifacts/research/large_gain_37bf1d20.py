"""Machine-authored finite actual-source checks in larger horizontal/vertical regions."""
from experiment_37bf1d20 import raw,region,sharp,O,probe,divbin
from experiment_interior_f1e4fe3b import polygon,hguard,vguard
from math import gcd
import json,time
start=time.monotonic();out={'status':'finite exact computation only','cases':[],'failures':[]}
for axis,a,b,r in [(0,50,251,5),(0,101,401,6),(1,321,641,4),(1,501,751,5)]:
 assert gcd(a,b)==1
 p=raw(a,b,1 if axis==0 else 0,r);d=a+b-1
 n=(b if axis==0 else a)-2*r-1
 lo=a-a*r//b if axis==0 else b-b*r//a;hi=a+r if axis==0 else b+r
 row=[p.get((k,r) if axis==0 else (r,k),0) for k in range(d-r+1)]
 seed=divbin(row,n);assert all(c>=0 for c in seed)
 assert all(c==0 for k,c in enumerate(seed) if k<lo or k>hi)
 data={'axis':axis,'a':a,'b':b,'r':r,'n':n,'lo':lo,'hi':hi,'new_vs_residual':0,'sharp_triples':0,'examples':[]}
 for k in range(d-r-1):
  if not sharp(n,k,lo,hi):continue
  i,j=(k,r) if axis==0 else (r,k)
  pts=[(i+t,j) if axis==0 else (i,j+t) for t in range(3)]
  assert all(polygon(a,b,*pt) for pt in pts)
  vals,F,m=probe(seed,n,k);assert vals==[p.get(pt,0) for pt in pts]
  assert F>=0
  data['sharp_triples']+=1
  old=region(n,k,lo,hi) or region(n,k,lo,hi,True)
  old=old or (hguard(a,b,i,j) if axis==0 else vguard(a,b,i,j,(b+a-1)//a))
  residual=a>=2 and i+j+4<=d and (j>=5 if axis==0 else i>=4 and j>=3)
  if residual and not old:
   data['new_vs_residual']+=1
   if len(data['examples'])<2:data['examples'].append({'points':pts,'values':vals,'moment_gap':F})
 out['cases'].append(data)
out['seconds']=time.monotonic()-start
(O/'large-gain.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({**out,'cases':[{k:v for k,v in d.items() if k!='examples'} for d in out['cases']]}))
