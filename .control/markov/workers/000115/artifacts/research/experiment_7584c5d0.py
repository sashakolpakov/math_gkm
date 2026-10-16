"""Machine-authored finite comparisons of sparse formulas and literal sources.
This is experimental evidence, not a universal proof.
"""
from explore_seed_7584c5d0 import *
from experiment_allrun_de6168c6 import jets,seed
from vertical_second_9e104e0c import source2
from experiment_8833 import path_for
from math import gcd,comb
import time,hashlib
def ev(p,aa,rr,ss,qq,jj):return int(p.ev([aa,rr,ss,qq,jj,0]))
def form(aa,rr,qq,jj):
 ss=max(2*rr-aa,0)
 if jj<=0 or jj>2*qq+4:return 0
 if jj==1:return 48*ss
 if jj<=qq+1:return ev(L,aa,rr,ss,qq,jj)
 if jj==qq+2:return ev(C,aa,rr,ss,qq,jj)
 if jj<=2*qq+1:return ev(M,aa,rr,ss,qq,jj)
 return ev(T[jj-(2*qq+2)],aa,rr,ss,qq,jj)
def main():
 start=time.monotonic();A,B,F=jets(31);cases=coefs=gaps=zeros=0;records=[]
 for qq in range(2,31):
  for aa in range(2,31):
   for rr in range(1,aa):
    N=seed(qq-1,aa,rr,A,B,F)
    cs=[form(aa,rr,qq,j) for j in range(2*qq+8)]
    assert all(cs[j]==6*(N[j] if j<len(N) else 0) for j in range(len(cs))),(qq,aa,rr)
    assert all(c>=0 for c in cs)
    assert all(cs[j]*cs[j+2]<=cs[j+1]**2 for j in range(len(cs)-2)),(qq,aa,rr)
    support=[j for j,c in enumerate(cs) if c>0]
    assert support==list(range(min(support),max(support)+1))
    cases+=1;coefs+=len(cs);gaps+=len(cs)-2;zeros+=sum(c==0 for c in cs)
  if qq%5==0:print('q',qq,flush=True)
 source_cases=raw_coefs=raw_triples=raw_zeros=0
 for qq in range(1,13):
  for aa in range(5,18):
   for rr in range(1,aa):
    if gcd(aa,rr)!=1:continue
    bb=aa*qq+rr; a0,b0,p=source2(path_for(aa,bb));assert (a0,b0)==(aa,bb)
    N=seed(qq-1,aa,rr,A,B,F);off=bb-2*qq-2
    predicted=[0]*(aa+bb+5)
    for k,c in enumerate(N):
     for z in range(aa-4):
      if off+k+z<len(predicted):predicted[off+k+z]+=c*comb(aa-5,z)
    raw=[p.get((2,j),0) for j in range(len(predicted))]
    assert predicted==[2*c for c in raw],(aa,bb)
    for j in range(len(raw)-2):
     if aa*bb<=2*bb+aa*j and j+4<=aa+bb-1:
      assert raw[j]*raw[j+2]<=raw[j+1]**2,(aa,bb,j)
      raw_triples+=1
    raw_coefs+=len(raw);raw_zeros+=sum(c==0 for c in raw);source_cases+=1
    records.append([aa,bb,hashlib.sha256(str(raw).encode()).hexdigest()])
 out=dict(status='Finite exact computation only; not root closure',seed_cases=cases,seed_coefficient_comparisons=coefs,seed_adjacent_inequalities=gaps,seed_zeros=zeros,source_cases=source_cases,raw_coefficient_comparisons=raw_coefs,polygon_valid_inequalities=raw_triples,raw_zeros=raw_zeros,failures=[],records=records,seconds=time.monotonic()-start)
 (O/'experiments.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k!='records'}))
if __name__=='__main__':main()
