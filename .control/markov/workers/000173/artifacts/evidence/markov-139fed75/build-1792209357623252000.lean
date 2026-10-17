import MarkovBandLeadingM139
/-! Machine-authored 139fed75. Exact final correction slot and zero tails. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000

theorem band_correction_tailM139 (q k i : ℕ) (r : Bool)
 (hi : bandExponentM139 q k r+k+2 < i) :
 (bandCorrectionM139 q k r).coeff i=0 := by
 have ha : (X+1:Polynomial ℤ).natDegree ≤ 1 := by compute_degree
 have hp := natDegree_pow_le_of_le (bandExponentM139 q k r) ha
 have hx : ((X:Polynomial ℤ)^2).natDegree ≤ 2 := by compute_degree
 have hd := natDegree_mul_le_of_le (natDegree_mul_le_of_le hx hp) (band_Q_degreeM139 q k r)
 apply coeff_eq_zero_of_natDegree_lt
 unfold bandCorrectionM139
 omega

theorem band_correction_endpointM139 (q k : ℕ) (r : Bool) :
 (bandCorrectionM139 q k r).coeff (bandExponentM139 q k r+k+2)=
 (bandQM139 q r k).coeff k := by
 unfold bandCorrectionM139
 rw [mul_assoc,coeff_X_pow_mul',if_pos (by omega),show bandExponentM139 q k r+k+2-2=
   bandExponentM139 q k r+k by omega]
 have ha : (X+1:Polynomial ℤ).natDegree ≤ 1 := by compute_degree
 have hp : ((X+1:Polynomial ℤ)^bandExponentM139 q k r).natDegree ≤ bandExponentM139 q k r := by
   simpa using natDegree_pow_le_of_le (bandExponentM139 q k r) ha
 rw [coeff_mul_add_eq_of_natDegree_le hp (band_Q_degreeM139 q k r),coeff_X_add_one_pow,
   Nat.choose_self,Nat.cast_one,one_mul]

theorem band_correction_endpoint_posM139 (q k : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 0 < (bandCorrectionM139 q k r).coeff (bandExponentM139 q k r+k+2) := by
 rw [band_correction_endpointM139]
 exact band_Q_top_posM139 q k r hq hn

end
end MathGKM.Markov
