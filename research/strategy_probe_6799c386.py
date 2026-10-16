"""Machine-authored reproducible checks of failed strategies; not root refutations."""
import sys,json
from pathlib import Path
sys.path.insert(0,'research')
from pair_probe_6799c386 import f,conv,val
from column_probe_ec6f4b83 import column
from experiment_interior_f1e4fe3b import raw
out={'status':'finite strategy checks only','internal_synchronization':[], 'regroup':[]}
q=6;i=8;parts={}
for l in [1,3,4,5,7]:
 a=conv([f(q+1,l,j) for j in range(q+2)],[f(q+1,i-l,j) for j in range(q+2)])
 b=[0]+conv([f(q,l,j) for j in range(q+1)],[f(q,i-l,j) for j in range(q+1)])
 parts[l]=[val(a,j)+val(b,j) for j in range(2*q+3)]
for l,a in parts.items():
 for m,b in parts.items():
  for j in range(2*q+1):
   lhs=a[j]*b[j+2]+b[j]*a[j+2];rhs=2*a[j+1]*b[j+1]
   if lhs>rhs:out['internal_synchronization'].append({'q':q,'i':i,'l':l,'m':m,'j':j,
    'first':a[j:j+3],'second':b[j:j+3],'lhs':lhs,'rhs':rhs})
count=0
for q in range(1,16):
 p=raw(2,2*q+1)
 for i in range(1,2*q+3):
  total,ps=column(q,i)
  for r in range(i):
   a,b=ps.get('A'+str(r),{}),ps.get('B'+str(r-1),{})
   g=[a.get(j,0)+b.get(j,0) for j in range(2*q+3)]
   for j in range(2*q+1):
    count+=1
    if g[j]*g[j+2]>g[j+1]**2 and len(out['regroup'])<12:
     out['regroup'].append({'q':q,'i':i,'r':r,'j':j,'group':g[j:j+3],
      'actual_source':[p.get((i,j+h),0) for h in range(3)]})
out['regroup_checks']=count
Path('evidence/markov-6799c386/strategy-recheck.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
