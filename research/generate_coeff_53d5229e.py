"""Machine-authored third-band exact coefficient adapter generation."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm')
head='namespace MathGKM.Markov\nnoncomputable section\nopen Polynomial\nset_option maxHeartbeats 5000000\nset_option maxRecDepth 16384\n'
src='import MarkovTailShape53D\n/-! Machine-authored 53d5229e. Formal coefficient extraction; no experimental premises. -/\n'+head
src+='''def thirdR53D (n c r : ℕ) : ℤ[X] :=
 normalTail3FDDA (n:ℤ[X]) c r (2*r-c:ℕ)
 (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) X

theorem third_denominator53D (n c r : ℕ) (hc : c ≠ 2) :
 (1-X)^6*thirdRunPolyADB2 n c r=
 (lowNumeratorPolyFDDA n c r+X^(n+2)*tailPoly07F1 n c r+
 X^(2*n+3)*thirdTailPoly53D n c r (2*r-c:ℕ))+X^(3*n+4)*thirdR53D n c r := by
 rw [second_denominator07F1]
 unfold secondR07F1 thirdR53D
 dsimp only
 rw [if_neg hc]
 have ht := third_tail_poly53D (n:ℤ) (c:ℤ) (r:ℤ) (2*r-c:ℕ)
   (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ)
 simp only [Int.cast_natCast] at ht
 rw [ht]
 simp only [pow_add,pow_mul,pow_succ]
 ring

theorem extract_three_bands53D (n c r j : ℕ) (hc : c ≠ 2)
 (hj : 2*n+3 ≤ j) (hn : j < 3*n+4) :
 (thirdRunPolyADB2 n c r).coeff j=
 PowerSeries.coeff j (inverseSixFDDA*(lowNumeratorPolyFDDA n c r:PowerSeries ℤ))+
 PowerSeries.coeff (j-(n+2)) (inverseSixFDDA*(tailPoly07F1 n c r:PowerSeries ℤ))+
 PowerSeries.coeff (j-(2*n+3)) (inverseSixFDDA*(thirdTailPoly53D n c r (2*r-c:ℕ):PowerSeries ℤ)) := by
 rw [extract_delayedFDDA _ _ _ (3*n+4) j (third_denominator53D n c r hc) hn]
 simp only [Polynomial.coe_add,Polynomial.coe_mul,Polynomial.coe_pow,Polynomial.coe_X,mul_add,map_add]
 rw [show inverseSixFDDA*(PowerSeries.X^(n+2)*(tailPoly07F1 n c r:PowerSeries ℤ))=
   PowerSeries.X^(n+2)*(inverseSixFDDA*(tailPoly07F1 n c r:PowerSeries ℤ)) by ring]
 rw [show inverseSixFDDA*(PowerSeries.X^(2*n+3)*(thirdTailPoly53D n c r (2*r-c:ℕ):PowerSeries ℤ))=
   PowerSeries.X^(2*n+3)*(inverseSixFDDA*(thirdTailPoly53D n c r (2*r-c:ℕ):PowerSeries ℤ)) by ring]
 rw [PowerSeries.coeff_X_pow_mul',if_pos (by omega : n+2 ≤ j),
   PowerSeries.coeff_X_pow_mul',if_pos hj]

theorem extract_third_tail53D (n c r q : ℤ) (k : ℕ) (hk : 2 ≤ k) :
 120*PowerSeries.coeff k (inverseSixFDDA*(thirdTailPoly53D n c r q:PowerSeries ℤ))=
 '''+'+'.join(f'thirdTailCoeff{l}53D n c r q*fallingFiveBDEE ((k:ℤ)+5-{l})' for l in range(8))+''' := by
 simp only [thirdTailPoly53D,Polynomial.coe_add,mul_add,map_add]
'''
for l in range(8):src+=f' rw [extract_monomialFDDA _ {l} k (by omega)]\n'
for l in range(8):src+=f' have hf{l} := fallingFive_shiftBDEE k {l} (by omega)\n norm_num only [Nat.cast_ofNat] at hf{l}\n rw [hf{l}]\n'
src+=' ring\n'
for ch in ['low','high']:
 chamber='2*r ≤ c' if ch=='low' else 'c ≤ 2*r'
 q='0' if ch=='low' else '(2*(r:ℤ)-c)'
 src+=f'''theorem tail_{ch}_run_coeff53D (n c r j : ℕ) (hc : c ≠ 2)
 (hch : {chamber}) (hj : 2*n+5 ≤ j) (hn : j ≤ 3*n+3) :
 tail{ch.title()}53D c r (3*(n:ℤ)+3-j)=15*(thirdRunPolyADB2 n c r).coeff j := by
 have hl := extract_lowFDDA (n:ℤ) c r j (by omega)
 have ht := extract_tail07F1 (n:ℤ) c r (j-(n+2)) (by omega)
 have hu := extract_third_tail53D (n:ℤ) c r (2*r-c:ℕ) (j-(2*n+3)) (by omega)
 have he := extract_three_bands53D n c r j hc (by omega) (by omega)
 have hf := second_shape_falling07F1 (n:ℤ) c r j
 have hg := tail_{ch}_falling53D (n:ℤ) c r j
 have hk : ((j-(n+2):ℕ):ℤ)=(j:ℤ)-n-2 := by omega
 have hk' : ((j-(2*n+3):ℕ):ℤ)=(j:ℤ)-2*n-3 := by omega
 have hq : ((2*r-c:ℕ):ℤ)={q} := by omega
 rw [hk] at ht
 rw [hk',hq] at hu
 have heq : (j:ℤ)-n-2+5=(j:ℤ)-n+3 := by ring
 have heq' : (j:ℤ)-2*n-3+5=(j:ℤ)-2*n+2 := by ring
 rw [heq] at ht
 rw [heq'] at hu
 omega
\n#print axioms tail_{ch}_run_coeff53D
'''
src+='end\nend MathGKM.Markov\n'
(R/'research/MarkovTailCoefficients53D.lean').write_text(src)
print('Generated third-band coefficient bridge.')
