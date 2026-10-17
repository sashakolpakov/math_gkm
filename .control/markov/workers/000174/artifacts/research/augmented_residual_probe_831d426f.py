"""Machine-authored 831d426f. Probe an exact augmented residual, not a proof."""
from pathlib import Path
from math import comb
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-831d426f')
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def plus(a,b):return [(a[i] if i<len(a) else 0)+(b[i] if i<len(b) else 0) for i in range(max(len(a),len(b)))]
def times(a,c):return [x*c for x in a]
def gaps(v):return [(i,v[i:i+3]) for i in range(len(v)-2) if v[i]*v[i+2]>v[i+1]**2]
t=time.monotonic();out={'status':'finite auxiliary residual experiment only',
 'd_values':list(range(25))+[50,100],'k_bound':40,'rows':0,'adjacent_checks':0,
 'augmented_failures':[],'Q_failures':[],'H_failures':[],'mixed_failures':0,'mixed_examples':[]}
for d in out['d_values']:
 prefix=[];double=[];hs=[]
 for j in range(d+3*out['k_bound']+4):
  J=[C(j+3,m+3)*C(d+j+m+3,m) for m in range(j+1)]
  hs.append(plus(J,times(double,4)))
  prefix=plus(prefix,J);double=plus(double,prefix)
 prefix=[];double=[]
 for k in range(out['k_bound']+1):
  F=[C(k+1,m+1)*C(d+k+m+1,m) for m in range(k+1)]
  newprefix=plus(prefix,F);newdouble=plus(double,newprefix)
  for r in [False,True]:
   a=2 if r else 1;b=3-a
   q=d+2*k+(2 if r else 1);j=q+k+1
   Q=times(plus(times(newdouble,a),times(double,b)),4)
   H=hs[j];R=plus(Q,[0]+H)
   out['rows']+=1;out['adjacent_checks']+=len(R)-2
   for typ,v in [('augmented',R),('Q',Q),('H',H)]:
    bad=gaps(v)
    if bad and len(out[typ+'_failures'])<10:out[typ+'_failures'].append([d,k,r,bad[0]])
   for m in range(len(R)-2):
    v=lambda p,i:p[i] if i<len(p) else 0
    mixed=2*v(Q,m+1)*v([0]+H,m+1)-v(Q,m)*v([0]+H,m+2)-v(Q,m+2)*v([0]+H,m)
    if mixed<0:
     out['mixed_failures']+=1
     if len(out['mixed_examples'])<5:out['mixed_examples'].append([d,k,r,m,mixed])
  prefix=newprefix;double=newdouble
out['seconds']=time.monotonic()-t
(O/'augmented-residual-probe.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
