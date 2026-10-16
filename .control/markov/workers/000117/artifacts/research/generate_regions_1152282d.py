"""Machine-authored exact piecewise quintic coefficient identities."""
from pathlib import Path
from fractions import Fraction
import json
import horizontal_third_13d40bd7 as sp
sp.N=7
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-1152282d'
a,b,c,d,e,q,j=[sp.var(i) for i in range(7)]
names=['a','b','c','d','e','q','j']
table=json.loads((R/'evidence/markov-ead8a96f/third-sparse-candidate.json').read_text())['table']
blocks={}
for k,cs in table:
 p=sp.P({tuple(k[:5]+[z,0]):Fraction(v) for z,v in enumerate(cs) if Fraction(v)})
 blocks[k[5],k[6]]=blocks.get((k[5],k[6]),sp.poly(0))+p
keys=sorted(blocks)
def lean(p):
 out=[]
 for k,v in sorted(p.items()):
  assert v.denominator==1
  fs=([str(abs(v))] if abs(v)!=1 or not any(k) else [])+[n+(f'^{h}' if h>1 else '') for n,h in zip(names,k) if h]
  out.append(('-' if v<0 else '+')+'*'.join(fs))
 return ''.join(out).removeprefix('+') or '0'
def fall(d):
 p=sp.poly(1)
 for h in range(1,6):p=p*(d+h)
 return p
regions=[('first1',sp.poly(1),0,1,'j=1'),('first2',sp.poly(2),0,2,'j=2'),
 ('low',j,0,None,'3 ≤ j ∧ j ≤ q+1'),
 ('bridge12',q+2,1,2,'j=q+2'),('bridge13',q+3,1,3,'j=q+3'),
 ('mid1',j,1,None,'q+4 ≤ j ∧ j ≤ 2*q+2'),
 ('bridge23',2*q+3,2,3,'j=2*q+3'),('bridge24',2*q+4,2,4,'j=2*q+4'),
 ('mid2',j,2,None,'2*q+5 ≤ j ∧ j ≤ 3*q+2')]+[(f'tail{k}',3*q+k,3,k,f'j=3*q+{k}') for k in range(3,7)]+[('past',j,3,None,'3*q+7 ≤ j')]
def main():
 s='''import MarkovThirdValuesM115
/-! Machine-authored 1152282d. All coefficient chambers, including exterior zero. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 32768
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false
'''
 defs=','.join(f'vJ{i}c{k}M115' for i,k in keys)
 saved=[]
 for tag,jj,band,cut,cond in regions:
  p=sum((coef*fall(jj-i*q-k) for (i,k),coef in blocks.items() if i<band or i==band and (cut is None or k<=cut)),sp.poly(0))
  if tag=='past':assert not p
  s+=f'\ndef v3{tag}M115 (a b c d e q j : ℤ) : ℤ :=\n {lean(p)}\n'
  s+=f'\ntheorem vE_{tag}M115 (a b c d e q j : ℤ) (hq : 3 ≤ q) (hj : {cond}) :\n vEM115 a b c d e q j=v3{tag}M115 a b c d e q j := by\n unfold vEM115\n'
  for i,k in keys:
   kind='poly' if i<band or i==band and (cut is None or k<=cut) else 'zero'
   s+=f' rw [vFall_{kind}M115 (j-{i}*q) {k} (by omega)]\n'
  s+=f' simp only [{defs},v3{tag}M115]\n'
  if '∧' not in cond and tag!='past':s+=' rw [hj]\n'
  s+=' ring\n'
  saved.append([tag,[[list(k),str(v)] for k,v in p.items()]])
 s+='''
theorem vE_zeroM115 (a b c d e q j : ℤ) (hq : 3 ≤ q) (hj : j ≤ 0) :
 vEM115 a b c d e q j=0 := by
 unfold vEM115
'''
 for i,k in keys:s+=f' rw [vFall_zeroM115 (j-{i}*q) {k} (by omega)]\n'
 s+=' ring\nend\nend MathGKM.Markov\n'
 (R/'research/MarkovThirdRegionsM115.lean').write_text(s)
 (O/'third-region-polynomials.json').write_text(json.dumps(saved)+'\n')
 print('Generated region identities',[(tag,len(p)) for tag,p in saved])
if __name__=='__main__':main()
