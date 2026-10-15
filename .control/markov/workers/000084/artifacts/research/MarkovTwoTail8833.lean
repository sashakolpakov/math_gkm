import MarkovCrossTail53D
import MarkovThirdAllCycles8BBB
import MarkovLowerFormula487
/-! Machine-authored live request 8833a0fb. Exact two-cycle tail extraction. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
set_option maxRecDepth 16384

def cleanThird8833 (n : ℕ) : ℤ[X] :=
 thirdRunPolyADB2 n 2 1-6*X^(2*n+3)*firstRunPolyADB2 n 2 1

theorem two_denominator8833 (n : ℕ) :
 (1-X)^6*cleanThird8833 n=
 (lowNumeratorPolyFDDA n 2 1+X^(n+2)*tailPoly07F1 n 2 1+
 X^(2*n+3)*thirdTailPoly53D n 2 1 0)+X^(3*n+4)*thirdR53D n 2 1 := by
 unfold cleanThird8833
 rw [mul_sub,second_denominator07F1]
 unfold secondR07F1 thirdR53D
 norm_num only [Nat.reduceMul,Nat.reduceSub,min_self,ite_true,Nat.cast_one]
 have ht := third_tail_poly53D (n:ℤ) 2 1 0 1 0
 norm_num only [Int.cast_ofNat,Int.cast_zero,Int.cast_one,Int.cast_natCast] at ht
 rw [ht]
 simp only [pow_add,pow_mul,pow_succ]
 ring

theorem two_extract8833 (n j : ℕ) (hj : 2*n+3 ≤ j) (hn : j<3*n+4) :
 (cleanThird8833 n).coeff j=
 PowerSeries.coeff j (inverseSixFDDA*(lowNumeratorPolyFDDA n 2 1:PowerSeries ℤ))+
 PowerSeries.coeff (j-(n+2)) (inverseSixFDDA*(tailPoly07F1 n 2 1:PowerSeries ℤ))+
 PowerSeries.coeff (j-(2*n+3)) (inverseSixFDDA*(thirdTailPoly53D n 2 1 0:PowerSeries ℤ)) := by
 rw [extract_delayedFDDA _ _ _ (3*n+4) j (two_denominator8833 n) hn]
 simp only [Polynomial.coe_add,Polynomial.coe_mul,Polynomial.coe_pow,Polynomial.coe_X,mul_add,map_add]
 rw [show inverseSixFDDA*(PowerSeries.X^(n+2)*(tailPoly07F1 n 2 1:PowerSeries ℤ))=
   PowerSeries.X^(n+2)*(inverseSixFDDA*(tailPoly07F1 n 2 1:PowerSeries ℤ)) by ring]
 rw [show inverseSixFDDA*(PowerSeries.X^(2*n+3)*(thirdTailPoly53D n 2 1 0:PowerSeries ℤ))=
   PowerSeries.X^(2*n+3)*(inverseSixFDDA*(thirdTailPoly53D n 2 1 0:PowerSeries ℤ)) by ring]
 rw [PowerSeries.coeff_X_pow_mul',if_pos (by omega : n+2 ≤ j),
   PowerSeries.coeff_X_pow_mul',if_pos hj]

theorem two_corrected8833 (n : ℕ) :
 correctedThirdRun8BBB n 2 1=cleanThird8833 n-
 6*X^(2*n+3)*(firstRunPolyADB2 n 2 1+2+2*X) := by
 norm_num only [correctedThirdRun8BBB,cleanThird8833,ite_true]
 rw [show 2*(n+1)+1=2*n+3 by omega]
 ring

end
end MathGKM.Markov
