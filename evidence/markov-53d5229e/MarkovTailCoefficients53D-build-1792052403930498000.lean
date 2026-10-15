import MarkovTailShape53D
/-! Machine-authored 53d5229e. Formal coefficient extraction; no experimental premises. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
set_option maxRecDepth 16384
def thirdR53D (n c r : ℕ) : ℤ[X] :=
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
 thirdTailCoeff053D n c r q*fallingFiveBDEE ((k:ℤ)+5-0)+thirdTailCoeff153D n c r q*fallingFiveBDEE ((k:ℤ)+5-1)+thirdTailCoeff253D n c r q*fallingFiveBDEE ((k:ℤ)+5-2)+thirdTailCoeff353D n c r q*fallingFiveBDEE ((k:ℤ)+5-3)+thirdTailCoeff453D n c r q*fallingFiveBDEE ((k:ℤ)+5-4)+thirdTailCoeff553D n c r q*fallingFiveBDEE ((k:ℤ)+5-5)+thirdTailCoeff653D n c r q*fallingFiveBDEE ((k:ℤ)+5-6)+thirdTailCoeff753D n c r q*fallingFiveBDEE ((k:ℤ)+5-7) := by
 simp only [thirdTailPoly53D,Polynomial.coe_add,mul_add,map_add]
 rw [extract_monomialFDDA _ 0 k (by omega)]
 rw [extract_monomialFDDA _ 1 k (by omega)]
 rw [extract_monomialFDDA _ 2 k (by omega)]
 rw [extract_monomialFDDA _ 3 k (by omega)]
 rw [extract_monomialFDDA _ 4 k (by omega)]
 rw [extract_monomialFDDA _ 5 k (by omega)]
 rw [extract_monomialFDDA _ 6 k (by omega)]
 rw [extract_monomialFDDA _ 7 k (by omega)]
 have hf0 := fallingFive_shiftBDEE k 0 (by omega)
 norm_num only [Nat.cast_ofNat] at hf0
 rw [hf0]
 have hf1 := fallingFive_shiftBDEE k 1 (by omega)
 norm_num only [Nat.cast_ofNat] at hf1
 rw [hf1]
 have hf2 := fallingFive_shiftBDEE k 2 (by omega)
 norm_num only [Nat.cast_ofNat] at hf2
 rw [hf2]
 have hf3 := fallingFive_shiftBDEE k 3 (by omega)
 norm_num only [Nat.cast_ofNat] at hf3
 rw [hf3]
 have hf4 := fallingFive_shiftBDEE k 4 (by omega)
 norm_num only [Nat.cast_ofNat] at hf4
 rw [hf4]
 have hf5 := fallingFive_shiftBDEE k 5 (by omega)
 norm_num only [Nat.cast_ofNat] at hf5
 rw [hf5]
 have hf6 := fallingFive_shiftBDEE k 6 (by omega)
 norm_num only [Nat.cast_ofNat] at hf6
 rw [hf6]
 have hf7 := fallingFive_shiftBDEE k 7 (by omega)
 norm_num only [Nat.cast_ofNat] at hf7
 rw [hf7]
 ring
theorem tail_low_run_coeff53D (n c r j : ℕ) (hc : c ≠ 2)
 (hch : 2*r ≤ c) (hj : 2*n+5 ≤ j) (hn : j ≤ 3*n+3) :
 tailLow53D c r (3*(n:ℤ)+3-j)=15*(thirdRunPolyADB2 n c r).coeff j := by
 have hl := extract_lowFDDA (n:ℤ) c r j (by omega)
 have ht := extract_tail07F1 (n:ℤ) c r (j-(n+2)) (by omega)
 have hu := extract_third_tail53D (n:ℤ) c r (2*r-c:ℕ) (j-(2*n+3)) (by omega)
 have he := extract_three_bands53D n c r j hc (by omega) (by omega)
 have hf := second_shape_falling07F1 (n:ℤ) c r j
 have hg := tail_low_falling53D (n:ℤ) c r j
 have hk : ((j-(n+2):ℕ):ℤ)=(j:ℤ)-n-2 := by omega
 have hk' : ((j-(2*n+3):ℕ):ℤ)=(j:ℤ)-2*n-3 := by omega
 have hq : ((2*r-c:ℕ):ℤ)=0 := by omega
 rw [hk] at ht
 rw [hk',hq] at hu
 rw [hq] at he
 have heq : (j:ℤ)-n-2+5=(j:ℤ)-n+3 := by ring
 have heq' : (j:ℤ)-2*n-3+5=(j:ℤ)-2*n+2 := by ring
 rw [heq] at ht
 rw [heq'] at hu
 omega

#print axioms tail_low_run_coeff53D
theorem tail_high_run_coeff53D (n c r j : ℕ) (hc : c ≠ 2)
 (hch : c ≤ 2*r) (hj : 2*n+5 ≤ j) (hn : j ≤ 3*n+3) :
 tailHigh53D c r (3*(n:ℤ)+3-j)=15*(thirdRunPolyADB2 n c r).coeff j := by
 have hl := extract_lowFDDA (n:ℤ) c r j (by omega)
 have ht := extract_tail07F1 (n:ℤ) c r (j-(n+2)) (by omega)
 have hu := extract_third_tail53D (n:ℤ) c r (2*r-c:ℕ) (j-(2*n+3)) (by omega)
 have he := extract_three_bands53D n c r j hc (by omega) (by omega)
 have hf := second_shape_falling07F1 (n:ℤ) c r j
 have hg := tail_high_falling53D (n:ℤ) c r j
 have hk : ((j-(n+2):ℕ):ℤ)=(j:ℤ)-n-2 := by omega
 have hk' : ((j-(2*n+3):ℕ):ℤ)=(j:ℤ)-2*n-3 := by omega
 have hq : ((2*r-c:ℕ):ℤ)=(2*(r:ℤ)-c) := by omega
 rw [hk] at ht
 rw [hk',hq] at hu
 rw [hq] at he
 have heq : (j:ℤ)-n-2+5=(j:ℤ)-n+3 := by ring
 have heq' : (j:ℤ)-2*n-3+5=(j:ℤ)-2*n+2 := by ring
 rw [heq] at ht
 rw [heq'] at hu
 omega

#print axioms tail_high_run_coeff53D
end
end MathGKM.Markov
