import MarkovSmallDiagonalM8F7
/-! Machine-authored 8f77f493. Every numerator-two source, all three raw directions.
The full root retains every source with numerator at least three. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem source_two_diagonal_allM8F7 (path : List Bool)
 (ha : (frame path).mid.a=2) (i j : ℕ) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 by_cases hi : i≤2
 · exact small_two_diagonalM8F7 path ha i j hi
 · exact source_two_diagonal_ge_threeM8F7 path ha i j (by omega)

theorem source_two_globalM8F7 (path : List Bool) (ha : (frame path).mid.a=2) :
 GlobalLC18 (frame path).mid.p :=
 ⟨source_two_horizontal_allMEC6 path ha,source_two_vertical_allMDB9 path ha,
   source_two_diagonal_allM8F7 path ha⟩

theorem source_two_weakM8F7 (path : List Bool) (ha : (frame path).mid.a=2) :
 WeakLC (frame path).mid.a (frame path).mid.b (frame path).mid.p :=
 (global_iff_weak18 (raw_outside_polygon18 path)).mp (source_two_globalM8F7 path ha)

theorem two_family_globalM8F7 (q : ℕ) (hq : 1≤q) : GlobalLC18 (twoFamily3af q) := by
 obtain ⟨n,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : q≠0)
 have h := source_two_globalM8F7 (twoPath3af n) (two_path_labels3af n).1
 rw [two_path_polynomial3af] at h
 exact h

theorem two_diagonal_arithmeticM8F7 : TwoDiagonalMDB9 := by
 intro q hq i j
 have h := (two_family_globalM8F7 q hq).2.2 i j
 simp only [two_family_coeffM679] at h
 exact_mod_cast h

theorem root_iff_other_sourcesM8F7 : Conjecture63 ↔ OtherSourcesM679 := by
 rw [root_iff_two_diagonalMDB9]
 exact and_iff_right two_diagonal_arithmeticM8F7

theorem unbounded_two_sourcesM8F7 (B : ℕ) :
 ∃ path : List Bool, (frame path).mid.a=2 ∧ B<(frame path).mid.b ∧
   GlobalLC18 (frame path).mid.p := by
 refine ⟨twoPath3af B,(two_path_labels3af B).1,?_,
   source_two_globalM8F7 _ (two_path_labels3af B).1⟩
 rw [(two_path_labels3af B).2]
 omega

end
end MathGKM.Markov
