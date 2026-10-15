"""Machine-authored exact crossing formulas and positivity certificates."""
from pathlib import Path
from math import comb
import json
from uniform_shape_8bbb import Q,var,subst,horner
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-07f1d410'
data=json.loads((R/'evidence/markov-bdee9a64/rational-normalization.json').read_text())
p=Q({tuple(k):v for k,v in json.loads((R/'evidence/markov-8bbb934e/uniform-shape.json').read_text())['coefficient_terms']})
from fractions import Fraction
tails=[Q() for _ in range(8)]
for k,v in data['numerator']:
 if k[1]==1:tails[k[7]-2]=tails[k[7]-2]+Q({(k[0],k[2],k[3],0):int(Fraction(v))})
head='''namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option maxRecDepth 16384
'''
src='import MarkovSecondCoefficients07F1\nimport MarkovFirstCoefficients07F1\n'+head
for d in range(6):
 expr=f'thirdShapeBDEE n c r (n+{d})'
 for l in range(d-1):expr+=f'+{15*comb(d-2-l+5,5)}*tailCoeff{l}07F1 n c r'
 src+=f'def crossCoeff{d}07F1 (n c r : ℤ) : ℤ :=\n {expr}\n'
for d in range(6):
 src+=f'''theorem cross_coeff_{d}07F1 (n c r : ℕ) (hn : 4 ≤ n) :
 crossCoeff{d}07F1 n c r=15*(thirdRunPolyADB2 n c r).coeff (n+{d}) := by
'''
 if d<=1:
  src+=f' simpa [crossCoeff{d}07F1] using third_run_interior_coeffFDDA n c r (n+{d}) (by omega) (by omega)\n'
 elif d>=4:
  src+=f''' have he : crossCoeff{d}07F1 n c r=secondShape07F1 n c r (n+{d}) := by
  unfold crossCoeff{d}07F1 secondShape07F1 thirdShapeBDEE {' '.join(f'tailCoeff{l}07F1' for l in range(d-1))}
  ring
 rw [he]
 exact second_run_coeff07F1 n c r (n+{d}) (by omega) (by omega)
'''
 else:
  src+=f''' have he := extract_two_bands07F1 n c r (n+{d}) (by omega) (by omega)
 have hl := extract_lowFDDA (n:ℤ) c r (n+{d}) (by omega)
 have hk : n+{d}-(n+2)={d-2} := by omega
 rw [hk] at he
 have ht : PowerSeries.coeff {d-2} (inverseSixFDDA*(tailPoly07F1 n c r:PowerSeries ℤ))=
  '''+'+'.join(f'{comb(d-2-l+5,5)}*tailCoeff{l}07F1 n c r' for l in range(d-1))+''' := by
  simp only [tailPoly07F1,Polynomial.coe_add,mul_add,map_add,extract_monomial07F1]
  norm_num [Nat.choose]
  ring
 rw [ht] at he
 unfold crossCoeff'''+str(d)+'''07F1
 push_cast at hl
 omega
'''
src+='end\nend MathGKM.Markov\n'
(R/'research/MarkovCrossCoefficients07F1.lean').write_text(src)
t,u,v,_=map(var,range(4));nn=t+4;cc=u+v+2;rr=u+1
vals=[]
for d in range(6):
 a=subst(p,[nn,cc,rr,nn+d])
 for l in range(d-1):a=a+15*comb(d-2-l+5,5)*subst(tails[l],[nn,cc,rr,Q()])
 vals.append(a)
records=[]
for d in range(1,5):
 gap=vals[d]**2-vals[d-1]*vals[d+1]
 neg=[(k,x) for k,x in gap.items() if x<0]
 records.append(dict(center_offset=d,terms=len(gap),negative_terms=neg))
 assert not neg
 expr=horner(gap,['t','u','v','unused'])
 src='import MarkovCrossCoefficients07F1\n'+head+f'''theorem cross_gap_{d}07F1 (n c r : ℤ)
 (hn : 4 ≤ n) (hr : 1 ≤ r) (hc : r+1 ≤ c) :
 crossCoeff{d-1}07F1 n c r*crossCoeff{d+1}07F1 n c r ≤ (crossCoeff{d}07F1 n c r)^2 := by
 let t := n-4
 let u := r-1
 let v := c-r-1
 have ht : 0 ≤ t := by dsimp [t]; omega
 have hu : 0 ≤ u := by dsimp [u]; omega
 have hv : 0 ≤ v := by dsimp [v]; omega
 have he : (crossCoeff{d}07F1 n c r)^2-crossCoeff{d-1}07F1 n c r*crossCoeff{d+1}07F1 n c r={expr} := by
  dsimp [crossCoeff{d-1}07F1,crossCoeff{d}07F1,crossCoeff{d+1}07F1,thirdShapeBDEE,{','.join(f'tailCoeff{l}07F1' for l in range(d))},t,u,v]
  ring
 have hp : 0 ≤ {expr} := by positivity
 omega
#print axioms cross_gap_{d}07F1
end
end MathGKM.Markov
'''
 (R/f'research/MarkovCrossGap{d}07F1.lean').write_text(src)
(O/'crossing-generation.json').write_text(json.dumps(records,indent=2)+'\n')
print(json.dumps(records))
