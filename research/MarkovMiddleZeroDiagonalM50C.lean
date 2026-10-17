import MarkovUpperCompleteM9F23
/-! Machine-authored 50c262c5. The zeroth diagonal start, with support and
top-boundary cases kept separate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
attribute [local irreducible] threeRawM9E2

theorem source_three_outsideM50C (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hp : ¬InPolygon 3 (sourceNME9C q r) i j) : threeRawM9E2 q r i j=0 := by
 obtain ⟨s,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : q≠0)
 have h := raw_outside_polygon18 (threePathM9E2 s r) i j
 rw [(three_path_labelsM9E2 s r).1,(three_path_labelsM9E2 s r).2,
   three_path_polynomialM9E2,three_raw_formulaM9E2] at h
 exact h hp

theorem source_zero_diagonalM50C (q j : ℕ) (r : Bool) (hq : 1 ≤ q) :
 threeRawM9E2 q r 0 (j+2)*threeRawM9E2 q r 2 j ≤ threeRawM9E2 q r 1 (j+1)^2 := by
 by_cases ht : sourceNME9C q r ≤ j+2
 · simpa using source_three_top_diagonalsM9F23 q 0 j r hq (by omega)
 · have hz : threeRawM9E2 q r 0 (j+2)=0 := source_three_outsideM50C q 0 (j+2) r hq (by
     unfold InPolygon; omega)
   rw [hz,zero_mul]
   exact sq_nonneg _

end
end MathGKM.Markov
