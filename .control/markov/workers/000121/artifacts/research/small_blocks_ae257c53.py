"""Machine-authored exact small-source block division and finite source checks."""
from pathlib import Path
from fractions import Fraction
from math import gcd,comb
import json,time,hashlib
from third_seed_ead8a96f import source3,path_for
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-ae257c53'
table=json.loads((R/'evidence/markov-ead8a96f/third-sparse-candidate.json').read_text())['table']
def blocks(a,r):
 cs=[a,a-r,max(a-2*r,0),min(r,max(2*a-3*r,0)),max(a-3*r,0)]
 out=[{} for _ in range(4)]
 for k,vs in table:
  for j,v in enumerate(vs):
   z=Fraction(v)
   for c,h in zip(cs,k[:5]):z*=c**h
   key=(j,k[6]);d=out[k[5]];d[key]=d.get(key,0)+z
 return [{k:v for k,v in d.items() if v} for d in out]
def divplus(d):
 out={}
 for i in range(4):
  deg=max([j for k,j in d if k==i],default=0)
  prev=Fraction(0)
  for j in range(deg):
   z=d.get((i,j),0)-prev
   if z:out[i,j]=z
   prev=z
  assert d.get((i,deg),0)==prev,(i,deg,d)
 return out
def lean(d):
 terms=[]
 for (i,j),v in sorted(d.items()):
  assert v.denominator==1
  factors=[str(abs(int(v)))]
  if i:factors.append('q' if i==1 else f'q^{i}')
  if j:factors.append('x' if j==1 else f'x^{j}')
  term='*'.join(factors)
  terms.append(('+' if v>0 else '-')+term)
 s=''.join(terms).lstrip('+');return s or '0'
def main():
 mods=[];data=[];records=[];ids=adj=zeros=0
 for a in range(4,7):
  for r in range(1,a):
   if gcd(a,r)!=1:continue
   bs=blocks(a,r)
   for _ in range(7-a):bs=[divplus(d) for d in bs]
   tag=f'{a}{r}';mod=f'MarkovThirdSmallBlocks{tag}MAE2';mods.append(mod)
   counts=[a,a-r,max(a-2*r,0),min(r,max(2*a-3*r,0)),max(a-3*r,0)]
   s='import MarkovThirdSparseM115\n/-! Machine-authored ae257c53. Exact small-source quotient blocks; no LC claim. -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 6000000\n'
   for k,d in enumerate(bs):
    nm=f'sThird{tag}J{k}MAE2'
    s+=f'def {nm} {{R : Type*}} [CommRing R] (q x : R) : R :=\n {lean(d)}\n'
    args=' '.join(str(c) for c in counts)
    s+=f'theorem sThird{tag}block{k}MAE2 {{R : Type*}} [CommRing R] (q x : R) :\n (1+x)^{7-a}*{nm} q x=vJ{k}M115 {args} q x := by\n simp only [{nm},vJ{k}M115]\n ring\n'
   s+='end\nend MathGKM.Markov\n'
   (R/f'research/{mod}.lean').write_text(s)
   data.append(dict(a=a,r=r,blocks=[[[i,j,str(v)] for (i,j),v in sorted(d.items())] for d in bs]))
   for q in [2,3,4,5,8,17,41,97]:
    b=a*q+r;aa,bb,p=source3(path_for(a,b));assert (aa,bb)==(a,b)
    raw=[p.get((3,j),0) for j in range(a+b+5)]
    num={}
    for band,d in enumerate(bs):
     for (i,j),v in d.items():num[band*q+j]=num.get(band*q+j,0)+v*q**i
    off=b-3*q-3
    assert off>=0
    pred=[sum(v*comb(k-off-j+5,5) for j,v in num.items() if j<=k-off) for k in range(len(raw))]
    assert pred==[6*v for v in raw],(a,r,q)
    ids+=len(raw);zeros+=raw.count(0)
    for j in range(len(raw)-2):
     assert raw[j]*raw[j+2]<=raw[j+1]**2,(a,r,q,j)
     adj+=1
    records.append(dict(a=a,b=b,q=q,raw_sha256=hashlib.sha256(str(raw).encode()).hexdigest()))
 out=dict(status='Exact symbolic division and finite source checks; no universal quotient LC proof',families=data,modules=mods,records=records,coefficient_comparisons=ids,adjacent_checks=adj,zeros=zeros,failures=[])
 (O/'small-blocks.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(dict(modules=mods,fractions=len(records),coefficient_comparisons=ids,adjacent_checks=adj,zeros=zeros)))
if __name__=='__main__':main()
