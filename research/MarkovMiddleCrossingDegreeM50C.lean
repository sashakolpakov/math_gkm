import MarkovMiddleCrossingM50C
/-! Machine-authored 50c262c5. Exact extension through j=q-1, retaining
the full signed middle correction and both residue classes. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
attribute [local irreducible] topTemplateMB3E threeRawM9E2

theorem middle_gain_crossing_degreeM50C (q k : ℕ) (r : Bool) (hk : k ≤ q+(if r then 1 else 2)) :
 (middleGainM99A q k r).natDegree ≤ k := by
 apply natDegree_le_iff_coeff_eq_zero.mpr
 intro i hi
 unfold middleGainM99A
 apply gain_row_total_zeroM99A
 cases r <;> simp <;> omega

theorem middle_correction_crossing_degreeM50C (q k : ℕ) (r : Bool) (hk : k ≤ q+(if r then 1 else 2)) :
 (middleCorrectionM99A q r k).natDegree ≤ k+1 := by
 have hx : (X+1:Polynomial ℤ).natDegree ≤ 1 := by compute_degree
 have hy : (2*(1-X):Polynomial ℤ).natDegree ≤ 1 := by compute_degree
 have hg (l : ℕ) (hl : l ≤ q+(if r then 1 else 2)) : (4*X*middleGainM99A q l r).natDegree ≤ l+1 := by
   have h := natDegree_mul_le (p := (4*X:Polynomial ℤ)) (q := middleGainM99A q l r)
   have h4 : (4*X:Polynomial ℤ).natDegree ≤ 1 := by compute_degree
   have := middle_gain_crossing_degreeM50C q l r hl
   omega
 induction k using Nat.strong_induction_on with
 | h k ih =>
   rcases k with _|_|k
   · exact hg 0 hk
   · rw [middleCorrectionM99A]
     apply (natDegree_add_le _ _).trans
     apply max_le (hg 1 hk)
     have h := natDegree_mul_le (p := (2*(1-X):Polynomial ℤ)) (q := middleCorrectionM99A q r 0)
     have h0 := ih 0 (by omega) (by omega)
     omega
   · rw [middleCorrectionM99A]
     apply (natDegree_sub_le _ _).trans
     apply max_le
     · apply (natDegree_add_le _ _).trans
       apply max_le (hg (k+2) hk)
       have h := natDegree_mul_le (p := (2*(1-X):Polynomial ℤ)) (q := middleCorrectionM99A q r (k+1))
       have h1 := ih (k+1) (by omega) (by omega)
       omega
     · have h := natDegree_mul_le (p := ((X+1)^2:Polynomial ℤ)) (q := middleCorrectionM99A q r k)
       have hp := natDegree_pow_le (p := (X+1:Polynomial ℤ)) (n := 2)
       have h0 := ih k (by omega) (by omega)
       omega

theorem source_middle_crossing_highM50C (q k i : ℕ) (r : Bool)
 (hq : 1 ≤ q) (hk : k ≤ q+(if r then 1 else 2)) (hi : k+1 < i) :
 threeRawM9E2 q r i (sourceNME9C q r+2-(q+3+k))=
 (topTemplateMB3E (sourceNME9C q r) (q+3+k)).coeff i := by
 rw [←three_raw_formulaM9E2,←raw_row_coeffMC3E,source_middle_crossing_formulaM50C q k r hq hk,
   coeff_add,(natDegree_le_iff_coeff_eq_zero.mp (middle_correction_crossing_degreeM50C q k r hk)) i hi,
   add_zero]

end
end MathGKM.Markov
