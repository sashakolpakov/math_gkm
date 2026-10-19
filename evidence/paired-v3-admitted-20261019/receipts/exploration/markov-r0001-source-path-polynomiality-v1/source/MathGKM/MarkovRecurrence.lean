import MathGKM.MarkovDescent

/-! Machine-authored, 2026-10-19. A conditional uniqueness interface for
the affine form of publisher equation (8), with explicit premises.
No assertion is made here that the published family satisfies this interface.
-/
namespace MathGKM.Markov

def FareyNumeratorRecurrence (Q : ℕ → ℕ → BiPoly) : Prop :=
  ∀ a b c d : ℕ, 0 < b → 0 < d → a ≤ b → c ≤ d →
    ((b : ℤ) * c - (a : ℤ) * d = 1 ∨
     (b : ℤ) * c - (a : ℤ) * d = -1) →
    Q (a + 2*c) (b + 2*d) =
      S * Q c d * Q (a+c) (b+d) - U^c * V^d * Q a b

theorem recurrence_determines_frames (Q : ℕ → ℕ → BiPoly)
    (h0 : Q 0 1 = 1) (h1 : Q 1 1 = U + V)
    (h2 : Q 1 2 = (U + V)^2 + U) (hr : FareyNumeratorRecurrence Q)
    (path : List Bool) :
    Q (frame path).lo.a (frame path).lo.b = (frame path).lo.p ∧
    Q (frame path).mid.a (frame path).mid.b = (frame path).mid.p ∧
    Q (frame path).hi.a (frame path).hi.b = (frame path).hi.p := by
  induction path using List.reverseRecOn with
  | nil => exact ⟨h0, h2, h1⟩
  | append_singleton path r ih =>
    have hf := frame_invariant path
    rcases ih with ⟨hlo, hmid, hhi⟩
    have rightrec := hr (frame path).lo.a (frame path).lo.b
      (frame path).hi.a (frame path).hi.b hf.lo_pos hf.hi_pos
      hf.lo_le hf.hi_le (Or.inl hf.det)
    have leftrec := hr (frame path).hi.a (frame path).hi.b
      (frame path).lo.a (frame path).lo.b hf.hi_pos hf.lo_pos
      hf.hi_le hf.lo_le (Or.inr (by nlinarith [hf.det]))
    change _ ∧ _ ∧ _
    simp only [frame, List.foldl_append, List.foldl_cons, List.foldl_nil]
    change Q (advance (frame path) r).lo.a (advance (frame path) r).lo.b = _ ∧
      Q (advance (frame path) r).mid.a (advance (frame path) r).mid.b = _ ∧
      Q (advance (frame path) r).hi.a (advance (frame path) r).hi.b = _
    cases r <;> simp only [advance, Bool.false_eq_true, ↓reduceIte]
    · refine ⟨hlo, ?_, hmid⟩
      calc
        Q ((frame path).lo.a + (frame path).mid.a)
          ((frame path).lo.b + (frame path).mid.b) =
            Q ((frame path).hi.a + 2*(frame path).lo.a)
              ((frame path).hi.b + 2*(frame path).lo.b) := by
                rw [hf.sum_a, hf.sum_b]
                congr 1 <;> omega
        _ = _ := leftrec
        _ = _ := by
          rw [Nat.add_comm (frame path).hi.a (frame path).lo.a,
            Nat.add_comm (frame path).hi.b (frame path).lo.b,
            ← hf.sum_a, ← hf.sum_b, hlo, hmid, hhi]
          rfl
    · refine ⟨hmid, ?_, hhi⟩
      calc
        Q ((frame path).mid.a + (frame path).hi.a)
          ((frame path).mid.b + (frame path).hi.b) =
            Q ((frame path).lo.a + 2*(frame path).hi.a)
              ((frame path).lo.b + 2*(frame path).hi.b) := by
                rw [hf.sum_a, hf.sum_b]
                congr 1 <;> omega
        _ = _ := rightrec
        _ = _ := by
          rw [← hf.sum_a, ← hf.sum_b, hlo, hmid, hhi]
          rfl

theorem recurrence_covers_rationals (Q : ℕ → ℕ → BiPoly)
    (h0 : Q 0 1 = 1) (h1 : Q 1 1 = U + V)
    (h2 : Q 1 2 = (U + V)^2 + U) (hr : FareyNumeratorRecurrence Q)
    (a b : ℕ) (ha : 0 < a) (hab : a ≤ b) (hc : Nat.Coprime a b) :
    ((a = 1 ∧ b = 1) ∧ Q a b = U+V) ∨
    ∃ path : List Bool, (frame path).mid.a = a ∧ (frame path).mid.b = b ∧
      Q a b = (frame path).mid.p := by
  rcases rational_coverage a b ha hab hc with he | ⟨path, hpa, hpb⟩
  · exact Or.inl ⟨he, by rw [he.1, he.2]; exact h1⟩
  · right
    refine ⟨path, hpa, hpb, ?_⟩
    have hm := (recurrence_determines_frames Q h0 h1 h2 hr path).2.1
    simpa only [hpa, hpb] using hm

end MathGKM.Markov
