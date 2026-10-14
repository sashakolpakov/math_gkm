import MathGKM.MarkovLogConcavity

/-! Machine-authored worker 774eaadc. The no-internal-zero bridge required by
the independent residual audit. Nonnegativity and interval support are explicit. -/
namespace MathGKM.Markov
noncomputable section

def IntervalSupport774 (f : ℤ → ℝ) : Prop :=
  ∀ i k j, i ≤ k → k ≤ j → 0 < f i → 0 < f j → 0 < f k

theorem crossLC_of_adjacent_interval774 (f : ℤ → ℝ)
    (hn : ∀ k, 0 ≤ f k)
    (ha : ∀ k, f (k-1)*f (k+1) ≤ f k^2)
    (hs : IntervalSupport774 f) : CrossLC f := by
  have hmain : ∀ (n : ℕ) (i : ℤ),
      f i * f (i+(n:ℤ)+1) ≤ f (i+1)*f (i+(n:ℤ)) := by
    intro n
    induction n with
    | zero => intro i; simp
    | succ n ih =>
      intro i
      let j : ℤ := i+(n:ℤ)+1
      change f i * f (i+(↑(n+1):ℤ)+1) ≤ f (i+1)*f (i+(↑(n+1):ℤ))
      have he : i+(↑(n+1):ℤ) = j := by simp [j]
      rw [he]
      by_cases hi : f i = 0
      · rw [hi,zero_mul]; exact mul_nonneg (hn _) (hn _)
      by_cases hj : f (j+1) = 0
      · rw [hj,mul_zero]; exact mul_nonneg (hn _) (hn _)
      have hp : 0 < f j := hs i j (j+1) (by dsimp [j]; omega) (by omega)
        (lt_of_le_of_ne (hn _) (Ne.symm hi))
        (lt_of_le_of_ne (hn _) (Ne.symm hj))
      have h1 : f i*f j ≤ f (i+1)*f (j-1) := by simpa [j] using ih i
      have h2 := ha j
      have h3 := mul_le_mul_of_nonneg_right h1 (hn (j+1))
      have h4 := mul_le_mul_of_nonneg_left h2 (hn (i+1))
      apply (mul_le_mul_right hp).mp
      nlinarith
  intro i j hij
  have he : i + ((j-i).toNat : ℤ) = j := by omega
  simpa only [he] using hmain (j-i).toNat i

/-- Polynomial form; negative indices and indices past degree retain zeros. -/
theorem polynomial_crossLC_of_adjacent_interval774 (p : Polynomial ℝ)
    (hn : ∀ k, 0 ≤ CoeffSeq p k)
    (ha : ∀ k, CoeffSeq p (k-1)*CoeffSeq p (k+1) ≤ CoeffSeq p k^2)
    (hs : IntervalSupport774 (CoeffSeq p)) : CrossLC (CoeffSeq p) :=
  crossLC_of_adjacent_interval774 _ hn ha hs

#print axioms crossLC_of_adjacent_interval774
end
end MathGKM.Markov
