"""Machine-authored exact checks of the new cut and weighting identities.
All observations are finite experiments, never universal proof evidence.
"""
from pathlib import Path
from math import comb
from three_probe_9e205206 import frame
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-fee405c8')
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def L(j,t,m):return C(t+m+3,m)*(C(t+j+3,t+m+3)+4*C(t+j+4,t+m+5)) if m>=0 else 0
def A(j,t,h):return [L(j,t,t-r) if r>=h else 0 for r in range(t+1)]
def conv(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for k,y in enumerate(b):c[i+k]+=x*y
 return c
def main():
 start=time.monotonic();out={'status':'finite exact experiments only','boundary_coefficients':0,'all_cut_coefficients':0,'weighted_gap_coefficients':0,'source_coefficients':0,'source_zeros':0,'source_triples':0,'source_zero_triples':0,'failures':[]}
 for j in range(21):
  for t in range(31):
   aa=[A(j,t+v,0) for v in range(3)]
   for h in range(t+3):
    qs=[A(j,t+v,h) for v in range(3)];g=[x-y for x,y in zip(conv(qs[1],qs[1]),conv(qs[0],qs[2]))]
    out['all_cut_coefficients']+=len(g)
    if any(x<0 for x in g):out['failures'].append(['cut',j,t,h])
    if h==t:
     expected=[0]*(2*t)+[L(j,t+1,1)**2-L(j,t,0)*L(j,t+2,2),2*L(j,t+1,1)*L(j,t+1,0)-L(j,t,0)*L(j,t+2,1),L(j,t+1,0)**2-L(j,t,0)*L(j,t+2,0)]
     out['boundary_coefficients']+=len(g)
     if g!=expected:out['failures'].append(['identity',j,t])
   for d in [0,j,2*j+3,40]:
    wa=[[C(d,k)*x for k,x in enumerate(a)] for a in aa]
    g=[x-y for x,y in zip(conv(wa[1],wa[1]),conv(wa[0],wa[2]))]
    out['weighted_gap_coefficients']+=len(g)
    if any(x<0 for x in g):out['failures'].append(['weighted',j,t,d])
 for q in range(1,26):
  for r in [False,True]:
   a,n,p=frame([False]*(q-1)+[True,r]);assert a==3
   for j in range(q+1):
    d=n-2*j-1
    for t in range(n+3):
     values=[sum(C(d,k)*L(j,t+v,t+v-k) for k in range(t+v+1)) for v in range(3)]
     raw=[p.get((t+3+v,j),0) for v in range(3)]
     out['source_coefficients']+=3;out['source_zeros']+=sum(x==0 for x in raw)
     out['source_triples']+=1;out['source_zero_triples']+=any(x==0 for x in raw)
     if values!=raw:out['failures'].append(['source',q,r,j,t])
     if raw[0]*raw[2]>raw[1]**2:out['failures'].append(['raw_lc',q,r,j,t])
 out['seconds']=time.monotonic()-start
 (O/'transport-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
