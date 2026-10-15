"""Machine-authored exact delayed-band extraction, generated ring identities."""
from pathlib import Path
from fractions import Fraction
import json
from uniform_shape_8bbb import Q,var,subst,horner
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-07f1d410'
data=json.loads((R/'evidence/markov-bdee9a64/rational-normalization.json').read_text())
second=Q({tuple(k):v for k,v in json.loads((O/'second-band-probe.json').read_text())['second_terms']})
tails=[Q() for _ in range(8)]
for k,v in data['numerator']:
 if k[1]==1:
  assert not any(k[4:7])
  tails[k[7]-2]=tails[k[7]-2]+Q({(k[0],k[2],k[3],0):int(Fraction(v))})
head='''namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false
'''
src='import MarkovInteriorSourceFDDA\n/-! Machine-authored 07f1d410. Exact second-band coefficient shape. -/\n'+head
src+='def secondShape07F1 (n c r j : ℤ) : ℤ :=\n '+horner(second,['n','c','r','j'])+'\n'
for l,p in enumerate(tails):src+=f'def tailCoeff{l}07F1 (n c r : ℤ) : ℤ :=\n '+horner(p,['n','c','r','unused'])+'\n'
tailpoly='+'.join(f'C (tailCoeff{l}07F1 n c r)*X^{l}' for l in range(8))
src+='def tailPoly07F1 (n c r : ℤ) : ℤ[X] :=\n '+tailpoly+'\n'
src+='''theorem tail_poly07F1 (n c r q t u : ℤ) :
 normalTail1FDDA (n:ℤ[X]) c r q t u X=tailPoly07F1 n c r := by
 unfold normalTail1FDDA tailPoly07F1 '''+' '.join(f'tailCoeff{l}07F1' for l in range(8))+'''
 simp only [map_add,map_sub,map_mul,map_pow,map_neg,map_ofNat,map_one,Polynomial.C_eq_intCast]
 ring
'''
summ='+'.join(f'tailCoeff{l}07F1 n c r*fallingFiveBDEE (j-n+3-{l})' for l in range(8))
src+=f'''theorem second_shape_falling07F1 (n c r j : ℤ) :
 8*secondShape07F1 n c r j=8*thirdShapeBDEE n c r j+{summ} := by
 unfold secondShape07F1 thirdShapeBDEE fallingFiveBDEE {' '.join(f'tailCoeff{l}07F1' for l in range(8))}
 ring
end
end MathGKM.Markov
'''
(R/'research/MarkovSecondShape07F1.lean').write_text(src)
src='import MarkovSecondShape07F1\n'+head
src+='''def secondR07F1 (n c r : ℕ) : ℤ[X] :=
 let q : ℤ[X] := (2*r-c:ℕ)
 let t : ℤ[X] := (min (c-r) (3*r-c):ℕ)
 let u : ℤ[X] := (3*r-2*c:ℕ)
 normalTail2FDDA (n:ℤ[X]) c r q t u X+
 X^(n+1)*normalTail3FDDA (n:ℤ[X]) c r q t u X+
 (if c=2 then 6*(1-X)^6*firstRunPolyADB2 n c r else 0)

theorem second_denominator07F1 (n c r : ℕ) :
 (1-X)^6*thirdRunPolyADB2 n c r=
 (lowNumeratorPolyFDDA n c r+X^(n+2)*tailPoly07F1 n c r)+X^(2*n+3)*secondR07F1 n c r := by
 rw [source_denominatorFDDA]
 unfold delayedRFDDA secondR07F1
 rw [tail_poly07F1]
 split_ifs <;> simp only [pow_add,pow_mul,pow_succ] <;> ring

theorem extract_two_bands07F1 (n c r j : ℕ) (hn : j<2*n+3) (hj : n+2≤j) :
 (thirdRunPolyADB2 n c r).coeff j=
 PowerSeries.coeff j (inverseSixFDDA*(lowNumeratorPolyFDDA n c r:PowerSeries ℤ))+
 PowerSeries.coeff (j-(n+2)) (inverseSixFDDA*(tailPoly07F1 n c r:PowerSeries ℤ)) := by
 rw [extract_delayedFDDA _ _ _ (2*n+3) j (second_denominator07F1 n c r) hn]
 simp only [Polynomial.coe_add,Polynomial.coe_mul,Polynomial.coe_pow,Polynomial.coe_X,mul_add,map_add]
 rw [show inverseSixFDDA*(PowerSeries.X^(n+2)*(tailPoly07F1 n c r:PowerSeries ℤ))=
   PowerSeries.X^(n+2)*(inverseSixFDDA*(tailPoly07F1 n c r:PowerSeries ℤ)) by ring]
 rw [PowerSeries.coeff_X_pow_mul',if_pos hj]

theorem extract_tail07F1 (n c r : ℤ) (k : ℕ) (hk : 2≤k) :
 120*PowerSeries.coeff k (inverseSixFDDA*(tailPoly07F1 n c r:PowerSeries ℤ))=
 '''+'+'.join(f'tailCoeff{l}07F1 n c r*fallingFiveBDEE ((k:ℤ)+5-{l})' for l in range(8))+''' := by
 simp only [tailPoly07F1,Polynomial.coe_add,mul_add,map_add]
'''
for l in range(8):src+=f' rw [extract_monomialFDDA _ {l} k (by omega)]\n'
for l in range(8):src+=f' rw [fallingFive_shiftBDEE k {l} (by omega)]\n'
src+=' ring\n'
src+='''theorem second_run_coeff07F1 (n c r j : ℕ) (hj : n+4≤j) (hn : j≤2*n+2) :
 secondShape07F1 n c r j=15*(thirdRunPolyADB2 n c r).coeff j := by
 have hl := extract_lowFDDA (n:ℤ) c r j (by omega)
 have ht := extract_tail07F1 (n:ℤ) c r (j-(n+2)) (by omega)
 have he := extract_two_bands07F1 n c r j (by omega) (by omega)
 have hf := second_shape_falling07F1 (n:ℤ) c r j
 have hk : ((j-(n+2):ℕ):ℤ)=(j:ℤ)-n-2 := by omega
 rw [hk] at ht
 have heq : (j:ℤ)-n-2+5=(j:ℤ)-n+3 := by ring
 rw [heq] at ht
 omega

#print axioms second_run_coeff07F1
end
end MathGKM.Markov
'''
(R/'research/MarkovSecondCoefficients07F1.lean').write_text(src)
print('Generated exact second shape and coefficient bridge.')
