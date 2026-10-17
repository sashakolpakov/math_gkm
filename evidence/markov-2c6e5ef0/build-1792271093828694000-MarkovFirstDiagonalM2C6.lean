import MarkovFirstDiagonalBridgeM2C6
import MarkovFirstDiagonalSmallM2C6
/-! Machine-authored 2c6e5ef0. Complete numerator-three diagonal start one,
including support zeros and every row; no polygon position is filtered. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
attribute [local irreducible] threeRawM9E2

theorem first_diagonal_zeroM2C6 (q j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hj : j+q+2 < sourceNME9C q r) : threeRawM9E2 q r 1 (j+2)=0 := by
 obtain ⟨n,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : q≠0)
 rw [←three_raw_formulaM9E2,←three_path_polynomialM9E2]
 apply raw_outside_polygon18
 rw [(three_path_labelsM9E2 n r).1,(three_path_labelsM9E2 n r).2]
 intro h
 have hh := h.1
 cases r <;> simp only [sourceNME9C,Bool.false_eq_true,if_false,if_true] at hj hh <;> omega

theorem source_first_diagonalM2C6 (q j : ℕ) (r : Bool) (hq : 1 ≤ q) :
 threeRawM9E2 q r 1 (j+2)*threeRawM9E2 q r 3 j ≤ threeRawM9E2 q r 2 (j+1)^2 := by
 by_cases hu : sourceNME9C q r ≤ j+q
 · exact source_upper_diagonal_allM9F23 q 1 j r hq hu
 by_cases hz : j+q+2 < sourceNME9C q r
 · rw [first_diagonal_zeroM2C6 q j r hq hz,zero_mul]
   exact sq_nonneg _
 have hs : ∃ s : ℕ, s ≤ 1 ∧ j+q+1+s=sourceNME9C q r := by
   refine ⟨sourceNME9C q r-(j+q+1),?_,?_⟩ <;> omega
 obtain ⟨s,hs,hj⟩ := hs
 by_cases hq7 : 7 ≤ q
 · exact first_boundary_largeM2C6 q j s r hq7 hs hj
 · have h := first_boundary_smallM2C6 q r s hq (by omega) hs
   dsimp only at h
   rwa [show sourceNME9C q r-q-1-s=j by omega] at h

theorem path_first_diagonalM2C6 (path : List Bool) (ha : (frame path).mid.a=3) (j : ℕ) :
 coeff (frame path).mid.p 1 (j+2)*coeff (frame path).mid.p 3 j ≤
 coeff (frame path).mid.p 2 (j+1)^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 simp only [hp]
 exact source_first_diagonalM2C6 q j r hq

end
end MathGKM.Markov
