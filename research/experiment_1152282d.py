"""Machine-authored exact finite checks. No experiment is a universal proof."""
from pathlib import Path
from math import comb,gcd
from fractions import Fraction
import json,time,hashlib
from third_seed_ead8a96f import source3,path_for
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-1152282d'
table=json.loads((R/'evidence/markov-ead8a96f/third-sparse-candidate.json').read_text())['table']
def numerator(a,r,q):
 counts=[a,a-r,max(a-2*r,0),min(r,max(2*a-3*r,0)),max(a-3*r,0)]
 out=[0]*(3*q+13)
 for k,cs in table:
  v=sum(Fraction(c)*q**j for j,c in enumerate(cs))
  for z,h in zip(counts,k[:5]):v*=z**h
  assert v.denominator==1
  out[k[5]*q+k[6]]+=int(v)
 return out
def main():
 start=time.monotonic();records=[];ids=adj=cross=poly=zeros=0
 for q in [1,2,3,4,5,6,9,16,25,40]:
  for a in range(7,21):
   for r in range(1,a):
    if gcd(a,r)!=1:continue
    b=a*q+r;num=numerator(a,r,q)
    seed=[sum(v*comb(j-k+5,5) for k,v in enumerate(num) if k<=j) for j in range(3*q+13)]
    assert all(v==0 for v in seed[3*q+7:])
    assert min(seed)>=0
    sup=[j for j,c in enumerate(seed) if c]
    assert sup==list(range(min(sup),max(sup)+1))
    for j in range(len(seed)-2):
     assert seed[j]*seed[j+2]<=seed[j+1]**2
     adj+=1
    for i in range(len(seed)-1):
     for j in range(i,len(seed)-1):
      assert seed[i]*seed[j+1]<=seed[i+1]*seed[j]
      cross+=1
    aa,bb,p=source3(path_for(a,b));assert (aa,bb)==(a,b)
    raw=[p.get((3,j),0) for j in range(a+b+5)]
    pred=[0]*len(raw);off=b-3*q-3
    for k,c0 in enumerate(seed):
     for h in range(a-6):
      if off+k+h<len(pred):pred[off+k+h]+=c0*comb(a-7,h)
    assert pred==[6*c0 for c0 in raw],(a,b)
    ids+=len(raw);zeros+=raw.count(0)
    for j in range(len(raw)-2):
     if a*b<=3*b+a*j and 5+j<=a+b-1:
      assert raw[j]*raw[j+2]<=raw[j+1]**2
      poly+=1
    records.append([a,b,hashlib.sha256(str(raw).encode()).hexdigest()])
  print(q,len(records),ids,flush=True)
 out=dict(status='Exact finite experiment only; formal universal results have separate receipts',q_values=[1,2,3,4,5,6,9,16,25,40],a_range=[7,20],fractions=len(records),raw_coefficient_comparisons=ids,seed_adjacent_checks=adj,seed_cross_checks=cross,polygon_valid_raw_checks=poly,raw_zeros=zeros,failures=[],records=records,seconds=time.monotonic()-start)
 (O/'experiments.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k!='records'}))
if __name__=='__main__':main()
