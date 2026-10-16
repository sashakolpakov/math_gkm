"""Machine-authored finite probe of a proposed all-index moment adapter.
This script proves no universal identity or source gap sign.
"""
from experiment_ac3d4ab9 import sources,divbin,region,O
from math import comb
import json,time
start=time.monotonic()
out={'status':'finite exact experiment of an unformalized adapter','bound':24,'sources':0,'rows':0,'triples':0,'zero_triples':0,'outside_overlap':0,'outside_both_criteria':0,'identities':0,'failures':[],'examples':[]}
for path,(a,b,p) in sources(24):
 out['sources']+=1
 for axis in range(3):
  d=a+b-1
  limit=((b if axis==0 else a if axis==1 else d)-1)//2 if axis<2 else d//2
  for r in range(limit+1):
   if axis==0:
    n=b-2*r-1;row=[p.get((k,r),0) for k in range(d-r+1)]
    lo=a-a*r//b;hi=a+r
   elif axis==1:
    n=a-2*r-1;row=[p.get((r,k),0) for k in range(d-r+1)]
    lo=b-b*r//a;hi=b+r
   else:
    n=d-2*r;row=[p.get((k,d-r-k),0) for k in range(d-r+1)]
    lo=0;hi=r
   seed=divbin(row,n);assert all(c>=0 for c in seed)
   H=n+2;D=(n+1)*(n+2);out['rows']+=1
   # k=-2,-1 also verify proper zero extension at the left endpoint.
   for k in range(-2,len(row)+1):
    q=[c*comb(H,k+2-t) if 0<=k+2-t<=H else 0 for t,c in enumerate(seed)]
    W=sum(q);U=sum(c*(k+2-t) for t,c in enumerate(q));V=sum(c*(k+2-t)**2 for t,c in enumerate(q))
    L=V-U;M=H*U-V;R=H*(H-1)*W-(2*H-1)*U+V
    vals=[row[k+t] if 0<=k+t<len(row) else 0 for t in range(3)]
    assert [L,M,R]==[D*c for c in vals],(a,b,axis,r,k,vals,L,M,R)
    gap=U*(H*W-U)-H*(W*V-U*U)
    assert (n+1)*gap==D*D*(vals[1]**2-vals[0]*vals[2])
    if gap<0:out['failures'].append([a,b,axis,r,k,vals])
    out['identities']+=4;out['triples']+=1;out['zero_triples']+=int(0 in vals)
    out['outside_overlap']+=int(not(hi<=k and k+2<=n+lo))
    out['outside_both_criteria']+=int(not(region(n,k,lo,hi) or region(n,k,lo,hi,True)))
    if len(out['examples'])<5 and W and k<hi and 0 not in vals:
     out['examples'].append({'a':a,'b':b,'axis':axis,'row_or_depth':r,'k':k,'values':vals,'moments':[W,U,V],'moment_gap':gap})
out['seconds']=time.monotonic()-start
(O/'moment-experiments.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:v for k,v in out.items() if k!='examples'}))
