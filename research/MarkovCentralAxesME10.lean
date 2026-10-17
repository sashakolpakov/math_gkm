import MarkovCentralSourceME10
/-! Machine-authored e108e0e2. Exact absent low columns in the central residual. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000
theorem source_central_axesME10 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hi : i ≤ 1) (hj : q+3 < j) (hu : 2*j ≤ sourceNME9C q r+3) :
 threeRawM9E2 q r i j=0 := by
 obtain ⟨n,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : q≠0)
 rw [←three_raw_formulaM9E2,←three_path_polynomialM9E2]
 apply raw_outside_polygon18
 rw [(three_path_labelsM9E2 n r).1,(three_path_labelsM9E2 n r).2]
 intro h
 have hh := h.1
 have hm := Nat.mul_le_mul_left (3*(n+1)+(if r then 1 else 2)) hi
 cases r <;> simp only [sourceNME9C,Bool.false_eq_true,if_false,if_true] at hu hh hm
   <;> nlinarith

theorem source_central_lowME10 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hi : i ≤ 1) (hj : q+3 < j) (hu : 2*j ≤ sourceNME9C q r+3) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 := by
 rw [source_central_axesME10 q i j r hq hi hj hu,zero_mul]
 exact sq_nonneg _
end
end MathGKM.Markov
