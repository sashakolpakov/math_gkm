import MarkovSecondSource8934
import MarkovSecondSmall8934

/-! Machine-authored worker 8934af17. Every source second horizontal row,
with unbounded paths, exact raw coefficients and zero extension. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem horizontal_two_crossLC8934 (path : List Bool) :
    CrossLC (CoeffSeq (((Bivariate.swap (frame path).mid.p).coeff 2).map
      (Int.castRingHom ℝ))) := by
  by_cases hb : 5 ≤ (frame path).mid.b
  · exact second_large_crossLC8934 path hb
  · obtain ⟨w,hn,_,he⟩ := source_hword46 path
    rw [he]
    exact second_small_crossLC8934 w (by omega)

/-- Unconditional raw j=2 horizontal inequality; all natural indices, with
zeros retained. This is one line of Conjecture63, not its conclusion. -/
theorem horizontal_two_raw8934 (path : List Bool) (i : ℕ) :
    coeff (frame path).mid.p i 2 * coeff (frame path).mid.p (i+2) 2 ≤
      coeff (frame path).mid.p (i+1) 2 ^ 2 := by
  have h := crossLC_adjacent (horizontal_two_crossLC8934 path) (↑i+1)
  have hn : ¬ (↑i : ℤ) < 0 := by omega
  have hn1 : ¬ (↑i+1 : ℤ) < 0 := by omega
  have hn2 : ¬ (↑i+1+1 : ℤ) < 0 := by omega
  simp only [CoeffSeq,add_sub_cancel_right,hn,hn1,hn2,if_false,
    Int.toNat_natCast,Polynomial.coeff_map] at h
  simp only [swap_coeff46] at h
  change (coeff (frame path).mid.p i 2 : ℝ) *
    (coeff (frame path).mid.p (i+2) 2 : ℝ) ≤
      (coeff (frame path).mid.p (i+1) 2 : ℝ)^2 at h
  exact_mod_cast h

#print axioms horizontal_two_crossLC8934
#print axioms horizontal_two_raw8934
end
end MathGKM.Markov
