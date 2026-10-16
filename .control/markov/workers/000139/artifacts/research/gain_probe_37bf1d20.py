"""Machine-authored finite measurement of exact residual-region gain."""
from experiment_37bf1d20 import sources,divbin,region,sharp,O
from experiment_interior_f1e4fe3b import polygon,hguard,vguard
import json,time
t0=time.monotonic()
out={'status':'finite exact residual-region checks only','bound':32,'sources':0,'old_residual':0,'newly_proved_region':0,'by_direction':[0,0,0],'examples':[],'failures':[]}
for path,(a,b,p) in sources(32):
 out['sources']+=1;d=a+b-1
 for axis in range(3):
  for r in range((b-1)//2+1 if axis==0 else (a-1)//2+1 if axis==1 else d//2+1):
   if axis==0:n=b-2*r-1;lo=a-a*r//b;hi=a+r
   elif axis==1:n=a-2*r-1;lo=b-b*r//a;hi=b+r
   else:n=d-2*r;lo=0;hi=r
   for k in range(d-r+1):
    if axis==0:
     i,j=k,r;pts=[(i+t,j) for t in range(3)]
     old=a>=2 and j>=5 and i+j+4<=d and not hguard(a,b,i,j)
    elif axis==1:
     i,j=r,k;pts=[(i,j+t) for t in range(3)]
     old=a>=2 and i>=4 and j>=3 and i+j+4<=d and not vguard(a,b,i,j,(b+a-1)//a)
    else:
     i,j=k,d-r-k-2;pts=[(i,j+2),(i+1,j+1),(i+2,j)]
     old=a>=2 and i+j+8<=d and a+5<=i+j+2 and a+2<=b and not(i>=r+r*r and j>=r+r*r)
    if not(old and all(polygon(a,b,*pt) for pt in pts)):continue
    if region(n,k,lo,hi) or region(n,k,lo,hi,True):continue
    out['old_residual']+=1
    if not sharp(n,k,lo,hi):continue
    vals=[p.get(pt,0) for pt in pts]
    assert vals[0]*vals[2]<=vals[1]**2
    out['newly_proved_region']+=1;out['by_direction'][axis]+=1
    if len(out['examples'])<12:out['examples'].append({'path':path,'a':a,'b':b,'axis':axis,'i':i,'j':j,'row_or_depth':r,'values':vals})
out['seconds']=time.monotonic()-t0
(O/'residual-gain.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:v for k,v in out.items() if k!='examples'}))
