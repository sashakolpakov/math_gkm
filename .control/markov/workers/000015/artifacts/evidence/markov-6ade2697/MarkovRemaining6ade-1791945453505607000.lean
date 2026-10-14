import MarkovFibonacciLC6ade

/-! Machine-authored request 6ade2697. Exact scope reduction, not closure. -/
namespace MathGKM.Markov
noncomputable section

theorem source_one_global6 (path : List Bool) (ha : (frame path).mid.a=1) :
    GlobalLC18 (frame path).mid.p :=
  (global_iff_weak18 (raw_outside_polygon18 path)).mpr (source_one_weakLC6 path ha)

/-- Exact root equivalence. Every direction and index remains universally
quantified for every source numerator at least two. That side is unproved. -/
theorem root_iff_numerator_ge_two6 : Conjecture63 ↔
    ∀ path : List Bool, 2≤(frame path).mid.a → GlobalLC18 (frame path).mid.p := by
  constructor
  · intro h path _
    exact (global_iff_weak18 (raw_outside_polygon18 path)).mpr (h.2.2 path)
  · intro h
    apply root_iff_raw_matrix18.mpr
    intro path
    rw [← raw_matrix18]
    by_cases ha : 2≤(frame path).mid.a
    · exact h path ha
    · have hp := (frame_reduced path).1
      exact source_one_global6 path (by omega)

#print axioms source_one_global6
#print axioms root_iff_numerator_ge_two6
end
end MathGKM.Markov
