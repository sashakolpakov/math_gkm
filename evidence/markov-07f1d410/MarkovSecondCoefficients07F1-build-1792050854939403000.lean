import MarkovSecondShape07F1
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false
def secondR07F1 (n c r : ℕ) : ℤ[X] :=
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
 tailCoeff007F1 n c r*fallingFiveBDEE ((k:ℤ)+5-0)+tailCoeff107F1 n c r*fallingFiveBDEE ((k:ℤ)+5-1)+tailCoeff207F1 n c r*fallingFiveBDEE ((k:ℤ)+5-2)+tailCoeff307F1 n c r*fallingFiveBDEE ((k:ℤ)+5-3)+tailCoeff407F1 n c r*fallingFiveBDEE ((k:ℤ)+5-4)+tailCoeff507F1 n c r*fallingFiveBDEE ((k:ℤ)+5-5)+tailCoeff607F1 n c r*fallingFiveBDEE ((k:ℤ)+5-6)+tailCoeff707F1 n c r*fallingFiveBDEE ((k:ℤ)+5-7) := by
 simp only [tailPoly07F1,Polynomial.coe_add,mul_add,map_add]
 rw [extract_monomialFDDA _ 0 k (by omega)]
 rw [extract_monomialFDDA _ 1 k (by omega)]
 rw [extract_monomialFDDA _ 2 k (by omega)]
 rw [extract_monomialFDDA _ 3 k (by omega)]
 rw [extract_monomialFDDA _ 4 k (by omega)]
 rw [extract_monomialFDDA _ 5 k (by omega)]
 rw [extract_monomialFDDA _ 6 k (by omega)]
 rw [extract_monomialFDDA _ 7 k (by omega)]
 rw [fallingFive_shiftBDEE k 0 (by omega)]
 rw [fallingFive_shiftBDEE k 1 (by omega)]
 rw [fallingFive_shiftBDEE k 2 (by omega)]
 rw [fallingFive_shiftBDEE k 3 (by omega)]
 rw [fallingFive_shiftBDEE k 4 (by omega)]
 rw [fallingFive_shiftBDEE k 5 (by omega)]
 rw [fallingFive_shiftBDEE k 6 (by omega)]
 rw [fallingFive_shiftBDEE k 7 (by omega)]
 ring
theorem second_run_coeff07F1 (n c r j : ℕ) (hj : n+4≤j) (hn : j≤2*n+2) :
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
