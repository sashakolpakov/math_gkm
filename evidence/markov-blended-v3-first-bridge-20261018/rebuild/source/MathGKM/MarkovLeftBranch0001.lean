import MathGKM.Markov

/-! Machine-authored round-0001 restricted left-branch bridge.
No source correspondence or full Conjecture 6.3 claim is made here. -/
namespace MathGKM.Markov.LeftBranch0001
noncomputable section

def Q : ℕ → BiPoly
  | 0 => 1
  | 1 => U + V
  | n + 2 => S * Q (n + 1) - V * Q n

theorem frame_left (k : ℕ) :
    frame (List.replicate k false) =
      ⟨⟨0, 1, 1⟩, ⟨1, k+2, Q (k+2)⟩, ⟨1, k+1, Q (k+1)⟩⟩ := by
  induction k with
  | zero =>
    simp [frame, initial, Q, S]
    ring
  | succ k ih =>
    rw [List.replicate_succ', frame, List.foldl_append]
    change advance (frame (List.replicate k false)) false = _
    rw [ih]
    simp [advance, Q, Nat.add_assoc]
    omega

theorem mid_left (k : ℕ) :
    (frame (List.replicate k false)).mid.a = 1 ∧
    (frame (List.replicate k false)).mid.b = k+2 ∧
    (frame (List.replicate k false)).mid.p = Q (k+2) := by
  rw [frame_left]
  exact ⟨rfl, rfl, rfl⟩

#print axioms frame_left
#print axioms mid_left
end
end MathGKM.Markov.LeftBranch0001
