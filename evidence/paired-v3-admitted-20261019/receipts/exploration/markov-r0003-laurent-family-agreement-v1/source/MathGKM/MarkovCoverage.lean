import MathGKM.Markov

/-! Machine-authored, 2026-10-19, round-0000 ordinary coverage work.
Arithmetic statements about the pinned frame definition. No claim here
identifies its polynomials with the source family or proves Conjecture63.
-/
namespace MathGKM.Markov

structure FrameInvariant (f : Frame) : Prop where
  sum_a : f.mid.a = f.lo.a + f.hi.a
  sum_b : f.mid.b = f.lo.b + f.hi.b
  lo_pos : 0 < f.lo.b
  hi_pos : 0 < f.hi.b
  lo_le : f.lo.a ≤ f.lo.b
  hi_le : f.hi.a ≤ f.hi.b
  det : (f.lo.b : ℤ) * f.hi.a - (f.lo.a : ℤ) * f.hi.b = 1

theorem initial_invariant : FrameInvariant initial := by
  constructor <;> norm_num [initial]

theorem advance_invariant (f : Frame) (h : FrameInvariant f) (r : Bool) :
    FrameInvariant (advance f r) := by
  rcases h with ⟨ha, hb, hl, hh, hla, hha, hd⟩
  cases r <;> simp only [advance, Bool.false_eq_true, ↓reduceIte]
  · constructor
    · rfl
    · rfl
    · exact hl
    · change 0 < f.mid.b
      omega
    · exact hla
    · change f.mid.a ≤ f.mid.b
      omega
    · push_cast
      rw [ha, hb]
      push_cast
      nlinarith [hd]
  · constructor
    · rfl
    · rfl
    · change 0 < f.mid.b
      omega
    · exact hh
    · change f.mid.a ≤ f.mid.b
      omega
    · exact hha
    · rw [ha, hb]
      push_cast
      nlinarith [hd]

theorem frame_invariant (path : List Bool) : FrameInvariant (frame path) := by
  induction path using List.reverseRecOn with
  | nil => exact initial_invariant
  | append_singleton p r ih =>
      simpa only [frame, List.foldl_append, List.foldl_cons, List.foldl_nil] using
        advance_invariant (frame p) ih r

theorem coprime_of_det {a b c d : ℕ}
    (h : (b : ℤ) * c - (a : ℤ) * d = 1) : Nat.Coprime a b := by
  apply IsCoprime.natCoprime
  exact ⟨-(d : ℤ), (c : ℤ), by nlinarith [h]⟩

theorem frame_coprime (path : List Bool) :
    Nat.Coprime (frame path).lo.a (frame path).lo.b ∧
    Nat.Coprime (frame path).mid.a (frame path).mid.b ∧
    Nat.Coprime (frame path).hi.a (frame path).hi.b := by
  have h := frame_invariant path
  refine ⟨coprime_of_det h.det, ?_, ?_⟩
  · apply coprime_of_det (c := (frame path).hi.a) (d := (frame path).hi.b)
    rw [h.sum_a, h.sum_b]
    push_cast
    nlinarith [h.det]
  · apply IsCoprime.natCoprime
    refine ⟨((frame path).lo.b : ℤ), -((frame path).lo.a : ℤ), ?_⟩
    nlinarith [h.det]

theorem path_arithmetic (path : List Bool) :
    FrameInvariant (frame path) ∧
    (0 < (frame path).mid.b ∧ (frame path).mid.a ≤ (frame path).mid.b) ∧
    Nat.Coprime (frame path).lo.a (frame path).lo.b ∧
    Nat.Coprime (frame path).mid.a (frame path).mid.b ∧
    Nat.Coprime (frame path).hi.a (frame path).hi.b := by
  have h := frame_invariant path
  refine ⟨h, ⟨?_, ?_⟩, frame_coprime path⟩
  · rw [h.sum_b]
    exact Nat.add_pos_left h.lo_pos _
  · rw [h.sum_a, h.sum_b]
    exact Nat.add_le_add h.lo_le h.hi_le

end MathGKM.Markov
