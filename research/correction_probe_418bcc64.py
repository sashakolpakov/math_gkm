"""Machine-authored 418bcc64. Exact exploratory coefficient gaps, not proofs."""
from pathlib import Path
from math import comb
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-418bcc64')
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def term(j,t,m):return C(t+m+3,m)*(C(t+j+3,t+m+3)+4*C(t+j+4,t+m+5))
def poly(j,t,c):
 if t==0:return [c]
 return [term(j,t-1,t-1-r) for r in range(t)]+[c]
def mul(a,b):
 out=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for k,y in enumerate(b):out[i+k]+=x*y
 return out
def gap(a,b,c):return [x-y for x,y in zip(mul(b,b),mul(a,c))]
def main():
 start=time.monotonic();out={'status':'finite exact experiments only','checks':0,'unweighted_clipped_failures':[],'weighted_failures':[],'weighted_sum_failures':[],'small_j_failures':[]}
 for j in range(3,41):
  for d,c in [(j-3,8),(j-2,4)]:
   for t in range(d+j+2):
    ps=[poly(j,t+k,c) for k in range(3)]
    clipped=[[v if r<=d else 0 for r,v in enumerate(p)] for p in ps]
    wp=[[C(d,r)*v for r,v in enumerate(p)] for p in ps]
    gs=gap(*wp);gc=gap(*clipped)
    for k,g in enumerate(gs):
     out['checks']+=1
     if g<0 and len(out['weighted_failures'])<20:out['weighted_failures'].append([j,d,c,t,k,g])
    if min(gc)<0 and len(out['unweighted_clipped_failures'])<10:out['unweighted_clipped_failures'].append([j,d,c,t,gc.index(min(gc)),min(gc)])
    if sum(gs)<0:out['weighted_sum_failures'].append([j,d,c,t,sum(gs)])
 for j in range(3):
  for d in range(10):
   for c in [4,8]:
    for t in range(d+j+2):
     vals=[sum(C(d,r)*v for r,v in enumerate(poly(j,t+k,c))) for k in range(3)]
     if vals[1]**2<vals[0]*vals[2]:out['small_j_failures'].append([d,j,c,t,vals])
 out['seconds']=time.monotonic()-start
 (O/'correction-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
