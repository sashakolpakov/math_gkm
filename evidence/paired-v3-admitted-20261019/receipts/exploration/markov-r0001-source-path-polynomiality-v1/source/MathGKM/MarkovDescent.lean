import MathGKM.MarkovCoverage

/-! Machine-authored, 2026-10-19. Inverse subtractive Euclidean descent
in the coefficients relative to the outer labels of a frame. -/
namespace MathGKM.Markov

theorem mediant_descent_aux (n : ℕ) :
    ∀ x y : ℕ, x + y = n → 0 < x → 0 < y → Nat.Coprime x y →
    ∀ f : Frame, FrameInvariant f →
    ∃ path : List Bool,
      (path.foldl advance f).mid.a = x * f.lo.a + y * f.hi.a ∧
      (path.foldl advance f).mid.b = x * f.lo.b + y * f.hi.b := by
  induction n using Nat.strong_induction_on with
  | h n ih =>
    intro x y hn hx hy hc f hf
    rcases lt_trichotomy x y with hlt | heq | hgt
    · have hc' : Nat.Coprime x (y-x) :=
        (Nat.coprime_sub_self_right (Nat.le_of_lt hlt)).2 hc
      obtain ⟨p, ha, hb⟩ := ih (x + (y-x)) (by omega)
        x (y-x) rfl hx (by omega) hc' (advance f true)
        (advance_invariant f hf true)
      refine ⟨true :: p, ?_, ?_⟩
      · simp only [List.foldl_cons]
        rw [ha]
        simp only [advance, ↓reduceIte]
        rw [hf.sum_a]
        nlinarith [Nat.sub_add_cancel (Nat.le_of_lt hlt)]
      · simp only [List.foldl_cons]
        rw [hb]
        simp only [advance, ↓reduceIte]
        rw [hf.sum_b]
        nlinarith [Nat.sub_add_cancel (Nat.le_of_lt hlt)]
    · subst y
      have hx1 : x = 1 := hc.eq_one_of_dvd (dvd_refl x)
      subst x
      exact ⟨[], by simpa using hf.sum_a, by simpa using hf.sum_b⟩
    · have hc' : Nat.Coprime (x-y) y :=
        (Nat.coprime_sub_self_left (Nat.le_of_lt hgt)).2 hc
      obtain ⟨p, ha, hb⟩ := ih ((x-y) + y) (by omega)
        (x-y) y rfl (by omega) hy hc' (advance f false)
        (advance_invariant f hf false)
      refine ⟨false :: p, ?_, ?_⟩
      · simp only [List.foldl_cons]
        rw [ha]
        simp only [advance, Bool.false_eq_true, ↓reduceIte]
        rw [hf.sum_a]
        nlinarith [Nat.sub_add_cancel (Nat.le_of_lt hgt)]
      · simp only [List.foldl_cons]
        rw [hb]
        simp only [advance, Bool.false_eq_true, ↓reduceIte]
        rw [hf.sum_b]
        nlinarith [Nat.sub_add_cancel (Nat.le_of_lt hgt)]

theorem rational_coverage (a b : ℕ) (ha : 0 < a) (hab : a ≤ b)
    (hc : Nat.Coprime a b) :
    (a = 1 ∧ b = 1) ∨
    ∃ path : List Bool, (frame path).mid.a = a ∧ (frame path).mid.b = b := by
  by_cases heq : a = b
  · subst b
    have h1 := hc.eq_one_of_dvd (dvd_refl a)
    exact Or.inl ⟨h1, h1⟩
  · have hlt : a < b := lt_of_le_of_ne hab heq
    have hc' : Nat.Coprime (b-a) a :=
      (Nat.coprime_sub_self_left hab).2 hc.symm
    obtain ⟨path, hpa, hpb⟩ := mediant_descent_aux ((b-a)+a)
      (b-a) a rfl (by omega) ha hc' initial initial_invariant
    right
    refine ⟨path, ?_, ?_⟩
    · simpa only [frame, initial, Nat.mul_zero, Nat.mul_one, Nat.zero_add] using hpa
    · simpa only [frame, initial, Nat.mul_one, Nat.sub_add_cancel hab] using hpb

end MathGKM.Markov
