"""Machine-authored a646848d. Exact diagnostics and next-row experiment.
Finite computation only, no theorem or source bridge imported from the output.
"""
from pathlib import Path
from fractions import Fraction as F
from math import comb
import json,time
from three_probe_9e205206 import frame
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-a646848d'
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def L(j,t,m):return C(t+m+3,m)*(C(t+j+3,t+m+3)+4*C(t+j+4,t+m+5))
def conv(a,b,k):return sum(v*b[k-i] for i,v in enumerate(a) if 0<=k-i<len(b))
def lower(d,j,i):
 if i<3:return 0
 t=i-3
 return C(d+j,t)*C(t+j+3,j)+4*sum((j-s)*C(d+s,t)*C(t+s+3,s) for s in range(j))
start=time.monotonic()
out={'status':'finite exact computation only','scalar_checks':0,'quantitative_border_checks':0,'failures':[],'rejected_shortcut_examples':[]}
for j in range(7,41):
 for t in range(4,j-2):
  a,b,c=[[F(L(j,t+r,m)) for m in range(j+1)] for r in range(3)]
  N=F(C(t+j+4,j)**2-C(t+j+3,j)*C(t+j+5,j));M=b[0]**2
  u=F(8*(j-t-2),t+1);kap=F(j*(t+j+5),t+5)
  gaps=[N-2*u*c[0]-u*u,N*b[1]-u*kap*M];out['scalar_checks']+=2
  if min(gaps)<0:out['failures'].append(['scalar',j,t,list(map(str,gaps))])
  for h in range(t+1):
   m=t+2-h
   G=sum(b[n]*b[m-n] for n in range(1,m))-sum(a[n]*c[m-n] for n in range(m-1))
   out['quantitative_border_checks']+=1
   if M*G<N*b[1]*b[m-1]:out['failures'].append(['border',j,t,h])
for d,t,j,c in [(5,4,7,4),(5,4,8,8),(20,4,23,8),(80,4,83,8)]:
 q=lambda s:[F((4*(j-k) if k<j else 1)*C(s+k+3,k)) for k in range(j+1)]
 a=[q(t+r) for r in range(3)]
 for r in range(3):a[r][0]+=F(c*max(d-t-r,0),t+r+1)
 g=[conv(a[1],a[1],k)-conv(a[0],a[2],k) for k in range(2*j+1)]
 out['rejected_shortcut_examples'].append({'d':d,'t':t,'j':j,'c':c,'negative_Q_indices':[k for k,v in enumerate(g) if v<0],'constant_gap':str(g[0])})
out['seconds']=time.monotonic()-start
(O/'margin-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out),flush=True)
start=time.monotonic()
nxt={'status':'finite next-row experiment; source identity not proved in Lean','q_values':[1,2,3,4,5,6,8,12,20,32],
 'source_coefficients':0,'source_zeros':0,'source_triples':0,'formula_checks':0,'scalar_checks':0,'failures':[],'mixed_negative_examples':[]}
for q in nxt['q_values']:
 for r in [False,True]:
  a,n,p=frame([False]*(q-1)+[True,r]);assert (a,n)==(3,3*q+(1 if r else 2))
  j=q+2;d=q-(4 if r else 3);c0=36 if r else 24;c1=8*q-8 if r else 4*q
  vals=[p.get((i,j),0) for i in range(n+7)]
  nxt['source_coefficients']+=len(vals);nxt['source_zeros']+=vals.count(0)
  for i in range(len(vals)-2):
   nxt['source_triples']+=1
   if vals[i]*vals[i+2]>vals[i+1]**2:nxt['failures'].append(['raw_lc',q,r,i])
  if d<0:continue
  lo=[lower(d,j,i) for i in range(n+7)]
  extra=[c0*C(d,i-2)+c1*C(d,i-3) for i in range(n+7)]
  for i,v in enumerate(vals):
   nxt['formula_checks']+=1
   if v!=lo[i]+extra[i]:nxt['failures'].append(['formula',q,r,i,v,lo[i]+extra[i]])
  for i in range(len(vals)-2):
   gap=2*lo[i+1]*extra[i+1]-lo[i]*extra[i+2]-extra[i]*lo[i+2]
   if gap<0 and len(nxt['mixed_negative_examples'])<8:nxt['mixed_negative_examples'].append({'q':q,'r':r,'i':i,'lower':lo[i:i+3],'correction':extra[i:i+3],'mixed_gap':gap,'raw':vals[i:i+3]})
  for t in range(4,d+1):
   u=F(c0*(d-t),t+1)+c1
   N=F(C(t+j+4,j)**2-C(t+j+3,j)*C(t+j+5,j));M=F(L(j,t+1,0)**2)
   kap=F(j*(t+j+5),t+5)
   for name,gap in [('full',N-2*u*L(j,t+2,0)-u*u),('border',N*L(j,t+1,1)-u*kap*M)]:
    nxt['scalar_checks']+=1
    if gap<0:nxt['failures'].append(['scalar',q,r,t,name,str(gap)])
 nxt['completed_q']=q
 (O/'next-row-progress.json').write_text(json.dumps(nxt,indent=2)+'\n')
nxt['seconds']=time.monotonic()-start
(O/'next-row-experiment.json').write_text(json.dumps(nxt,indent=2)+'\n');print(json.dumps(nxt),flush=True)
