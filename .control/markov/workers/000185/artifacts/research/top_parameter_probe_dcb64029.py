"""Machine-authored finite exact probes, not proofs."""
from pathlib import Path
from math import comb
from fractions import Fraction as F
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-dcb64029')
def K(d,i,s):return comb(s,i)*comb(d+s+i+8,i+3) if s>=i else 0
def M(d,T,i):return K(d,i,T)+4*sum((T-s)*K(d,i,s) for s in range(T))
def run():
 start=time.monotonic();out={'status':'finite exact experiment only','parameter_monotonicity':[],'reverse_ulc':[],'counts':{}}
 c=0;badup=[];baddown=[];badnorm=[];bn=[]
 for T in range(2,51):
  for i in range(T-1):
   for d in sorted(set([0,1,2,T-2,T,2*T,10*T])):
    a,b,c0=[M(d,T,j) for j in [i,i+1,i+2]]
    aa,bb,cc=[M(d+1,T,j) for j in [i,i+1,i+2]]
    delta=aa*cc*b*b-a*c0*bb*bb
    if delta>0 and len(badup)<10:badup.append([d,T,i])
    if delta<0 and len(baddown)<10:baddown.append([d,T,i])
    # Newton strength in the column, degree T: a*c/b^2 <= (i+1)/(i+2)*(T-i-1)/(T-i)
    if a*c0*(i+2)*(T-i)>b*b*(i+1)*(T-i-1) and len(badnorm)<10:badnorm.append([d,T,i])
    # strong factor independent of T
    if a*c0*(i+2)>b*b*(i+1) and len(bn)<10:bn.append([d,T,i])
    c+=1
 out.update(cases=c,ratio_increases=badup,ratio_decreases=baddown,newton_failures=badnorm,factorial_lc_failures=bn,seconds=time.monotonic()-start)
 (O/'top-parameter-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':run()
