import MarkovTwoTail8833
import MarkovThirdCorrectionSupport8BBB
/-! Machine-authored 8833a0fb. Four terminal raw coefficient identities. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
set_option maxRecDepth 16384

theorem first_two_coeff08833 (n : ℕ) :
 (firstRunPolyADB2 n 2 1).coeff 0=2*(n:ℤ)+2 := by
 have h0 := (lowerH_coeff487 n).1
 have he : 4*X*runSumA27 (X : ℤ[X]) n=X*(4*runSumA27 X n) := by ring
 simp [firstRunPolyADB2,he,Polynomial.coeff_add,Polynomial.coeff_sub,
   Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_mul,h0] <;> ring

theorem first_two_coeff18833 (n : ℕ) :
 (firstRunPolyADB2 n 2 1).coeff 1=6*(n:ℤ)+2 := by
 have h1 := (lowerH_coeff487 n).2.1
 have he : 4*X*runSumA27 (X : ℤ[X]) n=X*(4*runSumA27 X n) := by ring
 simp [firstRunPolyADB2,he,Polynomial.coeff_add,Polynomial.coeff_sub,
   Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_mul,h1,runSumA27,
   Polynomial.finsetSum_coeff,Polynomial.coeff_X_pow] <;> ring

theorem two_tail_coeff18833 (n : ℕ) (hn : 4 ≤ n) :
 (correctedThirdRun8BBB n 2 1).coeff (2*n+1)=6*(440*(n:ℤ)-532) := by
 rw [correctedThird_coeff_below8BBB n 2 1 (2*n+1) (by omega)]
 have h := second_run_coeff07F1 n 2 1 (2*n+1) (by omega) (by omega)
 simp only [Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one] at h
 have he : secondShape07F1 n 2 1 (2*(n:ℤ)+1)=90*(440*(n:ℤ)-532) := by
   unfold secondShape07F1; ring
 rw [he] at h
 omega

theorem two_tail_coeff28833 (n : ℕ) (hn : 4 ≤ n) :
 (correctedThirdRun8BBB n 2 1).coeff (2*n+2)=6*(120*(n:ℤ)-92) := by
 rw [correctedThird_coeff_below8BBB n 2 1 (2*n+2) (by omega)]
 have h := second_run_coeff07F1 n 2 1 (2*n+2) (by omega) (by omega)
 simp only [Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat] at h
 have he : secondShape07F1 n 2 1 (2*(n:ℤ)+2)=90*(120*(n:ℤ)-92) := by
   unfold secondShape07F1; ring
 rw [he] at h
 omega

theorem two_tail_coeff38833 (n : ℕ) (hn : 4 ≤ n) :
 (correctedThirdRun8BBB n 2 1).coeff (2*n+3)=6*(22*(n:ℤ)-8) := by
 have he := two_extract8833 n (2*n+3) (by omega) (by omega)
 have hs := second_series53D n 2 1 (2*n+3) (by omega)
 rw [show 2*n+3-(2*n+3)=0 by omega] at he
 have ht : PowerSeries.coeff 0 (inverseSixFDDA*(thirdTailPoly53D n 2 1 0:PowerSeries ℤ))=
   thirdTailCoeff053D n 2 1 0 := by
  simp only [thirdTailPoly53D,Polynomial.coe_add,mul_add,map_add,extract_monomial07F1]
  norm_num [Nat.choose]
 rw [ht] at he
 have hg : secondShape07F1 n 2 1 (2*(n:ℤ)+3)+15*thirdTailCoeff053D n 2 1 0-
   90*(2*(n:ℤ)+4)=90*(22*(n:ℤ)-8) := by
   unfold secondShape07F1 thirdTailCoeff053D; ring
 have hc : (correctedThirdRun8BBB n 2 1).coeff (2*n+3)=
   (cleanThird8833 n).coeff (2*n+3)-6*(2*(n:ℤ)+4) := by
   rw [two_corrected8833]
   rw [show (6:ℤ[X])*X^(2*n+3)*(firstRunPolyADB2 n 2 1+2+2*X)=
     X^(2*n+3)*(6*(firstRunPolyADB2 n 2 1+2+2*X)) by ring]
   simp [Polynomial.coeff_sub,Polynomial.coeff_X_pow_mul',first_two_coeff08833,
     Polynomial.coeff_ofNat_mul,Polynomial.coeff_add]
 simp only [Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat] at hs
 omega

theorem two_tail_coeff48833 (n : ℕ) (hn : 4 ≤ n) :
 (correctedThirdRun8BBB n 2 1).coeff (2*n+4)=12*(n:ℤ) := by
 have he := two_extract8833 n (2*n+4) (by omega) (by omega)
 have hs := second_series53D n 2 1 (2*n+4) (by omega)
 rw [show 2*n+4-(2*n+3)=1 by omega] at he
 have ht : PowerSeries.coeff 1 (inverseSixFDDA*(thirdTailPoly53D n 2 1 0:PowerSeries ℤ))=
   6*thirdTailCoeff053D n 2 1 0+thirdTailCoeff153D n 2 1 0 := by
  simp only [thirdTailPoly53D,Polynomial.coe_add,mul_add,map_add,extract_monomial07F1]
  norm_num [Nat.choose] <;> ring
 rw [ht] at he
 have hg : secondShape07F1 n 2 1 (2*(n:ℤ)+4)+90*thirdTailCoeff053D n 2 1 0+
   15*thirdTailCoeff153D n 2 1 0-90*(6*(n:ℤ)+4)=180*(n:ℤ) := by
   unfold secondShape07F1 thirdTailCoeff053D thirdTailCoeff153D; ring
 have hc : (correctedThirdRun8BBB n 2 1).coeff (2*n+4)=
   (cleanThird8833 n).coeff (2*n+4)-6*(6*(n:ℤ)+4) := by
   rw [two_corrected8833]
   rw [show (6:ℤ[X])*X^(2*n+3)*(firstRunPolyADB2 n 2 1+2+2*X)=
     X^(2*n+3)*(6*(firstRunPolyADB2 n 2 1+2+2*X)) by ring]
   simp [Polynomial.coeff_sub,Polynomial.coeff_X_pow_mul',show 2*n+3 ≤ 2*n+4 by omega,
     show 2*n+4-(2*n+3)=1 by omega,first_two_coeff18833,
     Polynomial.coeff_ofNat_mul,Polynomial.coeff_add]
 simp only [Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat] at hs
 omega

end
end MathGKM.Markov
