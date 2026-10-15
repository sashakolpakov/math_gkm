"""Machine-authored exact crossing formulas and positive ring certificates."""
from pathlib import Path
from math import comb
from uniform_shape_8bbb import Q,var,subst,horner
import json
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-53d5229e'; d=json.loads((O/'cross-probe.json').read_text())
head='namespace MathGKM.Markov\nnoncomputable section\nopen Polynomial\nset_option maxHeartbeats 12000000\nset_option maxRecDepth 16384\nset_option linter.unusedVariables false\n'
src='import MarkovTailCoefficients53D\nimport MarkovFirstCoefficients07F1\n'+head
for off in range(1,7):
 expr=f'secondShape07F1 n c r (2*n+{off})'
 if off>=3:expr+='+'+'+'.join(f'{15*comb(off-3-l+5,5)}*thirdTailCoeff{l}53D n c r q' for l in range(off-2))
 src+=f'def crossTail{off}53D (n c r q : ℤ) : ℤ :=\n {expr}\n'
# General identity for the first two rational numerator bands, with no upper bound.
src+='''theorem second_series53D (n c r j : ℕ) (hj : n+4 ≤ j) :
 secondShape07F1 n c r j=
 15*(PowerSeries.coeff j (inverseSixFDDA*(lowNumeratorPolyFDDA n c r:PowerSeries ℤ))+
 PowerSeries.coeff (j-(n+2)) (inverseSixFDDA*(tailPoly07F1 n c r:PowerSeries ℤ))) := by
 have hl := extract_lowFDDA (n:ℤ) c r j (by omega)
 have ht := extract_tail07F1 (n:ℤ) c r (j-(n+2)) (by omega)
 have hf := second_shape_falling07F1 (n:ℤ) c r j
 have hk : ((j-(n+2):ℕ):ℤ)=(j:ℤ)-n-2 := by omega
 rw [hk] at ht
 have heq : (j:ℤ)-n-2+5=(j:ℤ)-n+3 := by ring
 rw [heq] at ht
 omega
'''
for off in range(1,7):
 src+=f'''theorem cross_tail_coeff{off}53D (n c r : ℕ) (hn : 5 ≤ n) (hc : c ≠ 2) :
 crossTail{off}53D n c r (2*r-c:ℕ)=15*(thirdRunPolyADB2 n c r).coeff (2*n+{off}) := by
'''
 if off<3:
  src+=f' simpa only [crossTail{off}53D,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat] using second_run_coeff07F1 n c r (2*n+{off}) (by omega) (by omega)\n'
 else:
  k=off-3; expr='+'.join(f'{comb(k-l+5,5)}*thirdTailCoeff{l}53D n c r (2*r-c:ℕ)' for l in range(k+1))
  src+=f''' have he := extract_three_bands53D n c r (2*n+{off}) hc (by omega) (by omega)
 have hs := second_series53D n c r (2*n+{off}) (by omega)
 have hk : 2*n+{off}-(2*n+3)={k} := by omega
 rw [hk] at he
 have ht : PowerSeries.coeff {k} (inverseSixFDDA*(thirdTailPoly53D n c r (2*r-c:ℕ):PowerSeries ℤ))={expr} := by
  simp only [thirdTailPoly53D,Polynomial.coe_add,mul_add,map_add,extract_monomial07F1]
  norm_num [Nat.choose] <;> ring
 rw [ht] at he
 unfold crossTail{off}53D
 push_cast at hs
 omega
'''
src+='end\nend MathGKM.Markov\n';(R/'research/MarkovCrossTail53D.lean').write_text(src)
t,u,v,w=map(var,range(4))
for name,cc,rr,ch in [('LowLarge',2*u+v+4,u+2,'low'),('LowOne',v+4,1,'low'),('HighLarge',u+2*v+4,u+v+2,'high'),('HighOne',u+4,u+3,'high')]:
 ce=horner(cc,['t','u','v','unused']); re=horner(rr if isinstance(rr,Q) else Q({(0,0,0,0):rr}),['t','u','v','unused']);qe='0' if ch=='low' else f'(2*{re}-{ce})'
 src='import MarkovCrossTail53D\n'+head
 for off in range(1,5):
  gap=Q({tuple(k):v for k,v in d['gaps'][name+str(off)]});assert all(v>=0 for v in gap.values());expr=horner(gap,['t','u','v','unused'])
  vals=[f'crossTail{k}53D (t+5) {ce} {re} {qe}' for k in [off,off+1,off+2]]
  src+=f'''theorem cross_tail_gap_{name}{off}53D (t u v : ℤ) (ht : 0 ≤ t) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 {vals[0]}*{vals[2]} ≤ ({vals[1]})^2 := by
 have he : ({vals[1]})^2-{vals[0]}*{vals[2]}={expr} := by
  unfold crossTail{off}53D crossTail{off+1}53D crossTail{off+2}53D secondShape07F1
  simp only [thirdTailCoeff053D,thirdTailCoeff153D,thirdTailCoeff253D,thirdTailCoeff353D]
  ring
 have hp : 0 ≤ {expr} := by positivity
 omega
'''
 src+='end\nend MathGKM.Markov\n';(R/'research'/f'MarkovCrossTail{name}53D.lean').write_text(src)
print('Generated six exact crossing coefficients and sixteen chamber gap proofs.')
