"""Machine-authored exact Q/reversal/source checks. Finite experiments only."""
from pathlib import Path
from math import comb
from kernel_probe_7e2e958e import K,C
from three_probe_9e205206 import frame
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-7e2e958e')
def w(n):return 0 if n<0 else 1 if n==0 else 4*n
def Q(j,t):return [w(j-s)*C(t+s+3,s) for s in range(j+1)]
def lift(j,t,m):return C(t+m+3,m)*(C(t+j+3,t+m+3)+4*C(t+j+4,t+m+5))
def conv(a,b):
 z=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):z[i+j]+=x*y
 return z
def main():
 start=time.monotonic();o={'status':'finite exact computations only','Q_gap_coefficients':0,'Q_comp_lift_comparisons':0,'E_gap_coefficients':0,'source_comparisons':0,'source_zeros':0,'failures':[]}
 for j in range(31):
  for t in range(40):
   qs=[Q(j,t+i) for i in range(3)]
   for a,b in zip(conv(qs[1],qs[1]),conv(qs[0],qs[2])):
    o['Q_gap_coefficients']+=1
    if a<b:o['failures'].append(['Q',j,t,a,b])
   es=[]
   for v in range(t,t+3):
    es.append([lift(j,v,j-k) for k in range(j+1)])
    for m in range(j+3):
     a=sum(w(j-s)*C(v+s+3,s)*C(s,m) for s in range(j+1));b=lift(j,v,m)
     o['Q_comp_lift_comparisons']+=1
     if a!=b:o['failures'].append(['bridge',j,v,m,a,b])
   for a,b in zip(conv(es[1],es[1]),conv(es[0],es[2])):
    o['E_gap_coefficients']+=1
    if a<b:o['failures'].append(['E',j,t,a,b])
 for q in range(1,19):
  for r in [False,True]:
   a,n,p=frame([False]*(q-1)+[True,r]);assert a==3
   for j in range(q+1):
    d=n-2*j-1
    for t in range(n+2):
     v=p.get((t+3,j),0);b=sum(C(d,t-m)*lift(j,t,m) for m in range(min(t,j)+1))
     o['source_comparisons']+=1;o['source_zeros']+=v==0
     if v!=b:o['failures'].append(['source',q,r,j,t,v,b])
 # The source-range midpoint obstruction is separated from actual source LC.
 d,s,u,t=24,21,24,29;j=24;n=73
 a,nn,p=frame([False]*23+[True,True]);assert(a,nn)==(3,n)
 triple=[p.get((t+2+i,j),0) for i in range(3)]
 o['midpoint_source_range']={'d':d,'j':j,'s':s,'u':u,'t':t,'left':K(d,s,t-1)*K(d,u,t+1),'middle':K(d,22,t)*K(d,23,t),'source_label':[3,n],'source_points':[[t+2+i,j] for i in range(3)],'source_triple':triple,'source_gap':triple[1]**2-triple[0]*triple[2],'polygon_valid':all(3*n<=n*(t+2+i)+3*j and t+2+i+j<=n+2 for i in range(3))}
 o['seconds']=time.monotonic()-start;(O/'auxiliary-experiments.json').write_text(json.dumps(o,indent=2)+'\n');print(json.dumps(o))
if __name__=='__main__':main()
