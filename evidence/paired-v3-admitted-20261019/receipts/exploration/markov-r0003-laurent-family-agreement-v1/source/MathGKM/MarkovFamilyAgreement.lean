import MathGKM.MarkovLaurentPaths

/-! Machine-authored round-0003. Conditional Laurent-family uniqueness on all
three path labels. No supplied polynomial family or normalization premise. -/
namespace MathGKM.Markov
noncomputable section

theorem laurent_family_agreement {K : Type*} [Field K] (x y : K)
    (M : ℕ → ℕ → K) (hs : AffineLaurentFamily x y M) (path : List Bool) :
    M (frame path).lo.a (frame path).lo.b = (affineLaurentFrame x y path).lo ∧
    M (frame path).mid.a (frame path).mid.b = (affineLaurentFrame x y path).mid ∧
    M (frame path).hi.a (frame path).hi.b = (affineLaurentFrame x y path).hi := by
  induction path using List.reverseRecOn with
  | nil => exact ⟨hs.zero, hs.half, hs.one⟩
  | append_singleton path r ih =>
    have hf := frame_invariant path
    rcases ih with ⟨hlo, hmid, hhi⟩
    have rightrec := hs.mutation (frame path).lo.a (frame path).lo.b
      (frame path).hi.a (frame path).hi.b hf.lo_pos hf.hi_pos
      hf.lo_le hf.hi_le (Or.inl hf.det)
    have leftrec := hs.mutation (frame path).hi.a (frame path).hi.b
      (frame path).lo.a (frame path).lo.b hf.hi_pos hf.lo_pos
      hf.hi_le hf.lo_le (Or.inr (by nlinarith [hf.det]))
    simp only [frame, affineLaurentFrame, List.foldl_append, List.foldl_cons,
      List.foldl_nil]
    change M (advance (frame path) r).lo.a (advance (frame path) r).lo.b =
      (affineLaurentAdvance x y (affineLaurentFrame x y path) r).lo ∧
      M (advance (frame path) r).mid.a (advance (frame path) r).mid.b =
      (affineLaurentAdvance x y (affineLaurentFrame x y path) r).mid ∧
      M (advance (frame path) r).hi.a (advance (frame path) r).hi.b =
      (affineLaurentAdvance x y (affineLaurentFrame x y path) r).hi
    cases r <;> simp only [advance, affineLaurentAdvance, Bool.false_eq_true, ↓reduceIte]
    · refine ⟨hlo, ?_, hmid⟩
      calc
        M ((frame path).lo.a + (frame path).mid.a)
          ((frame path).lo.b + (frame path).mid.b) =
            M ((frame path).hi.a + 2*(frame path).lo.a)
              ((frame path).hi.b + 2*(frame path).lo.b) := by
                rw [hf.sum_a, hf.sum_b]
                congr 1 <;> omega
        _ = _ := leftrec
        _ = _ := by
          rw [Nat.add_comm (frame path).hi.a (frame path).lo.a,
            Nat.add_comm (frame path).hi.b (frame path).lo.b,
            ← hf.sum_a, ← hf.sum_b, hlo, hmid, hhi]
    · refine ⟨hmid, ?_, hhi⟩
      calc
        M ((frame path).mid.a + (frame path).hi.a)
          ((frame path).mid.b + (frame path).hi.b) =
            M ((frame path).lo.a + 2*(frame path).hi.a)
              ((frame path).lo.b + 2*(frame path).hi.b) := by
                rw [hf.sum_a, hf.sum_b]
                congr 1 <;> omega
        _ = _ := rightrec
        _ = _ := by rw [← hf.sum_a, ← hf.sum_b, hlo, hmid, hhi]

end
end MathGKM.Markov
