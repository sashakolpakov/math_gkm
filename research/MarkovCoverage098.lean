import MathGKM.MarkovIndices

/-! Machine-authored worker 098a5a66: unbounded rational coverage for the exact
path recurrence. No coefficient inequality or source-family identity is assumed. -/
namespace MathGKM.Markov

theorem weighted_coverage_098 (n : ℕ) :
    ∀ (x y : ℕ), x + y = n → 0 < x → 0 < y → Nat.Coprime x y →
    ∀ f : Frame, FrameIndices f → ∃ path : List Bool,
      (path.foldl advance f).mid.a = x * f.lo.a + y * f.hi.a ∧
      (path.foldl advance f).mid.b = x * f.lo.b + y * f.hi.b := by
  induction n using Nat.strong_induction_on with
  | h n ih =>
    intro x y hsum hx hy hcop f hf
    rcases lt_trichotomy x y with hlt | heq | hgt
    · have hc : Nat.Coprime x (y-x) :=
        (Nat.coprime_sub_self_right (Nat.le_of_lt hlt)).mpr hcop
      obtain ⟨path, ha, hb⟩ := ih (x+(y-x)) (by omega) x (y-x) rfl hx
        (by omega) hc (advance f true) (indices_advance hf true)
      refine ⟨true :: path, ?_, ?_⟩
      · simp only [List.foldl_cons]
        rw [ha]
        simp only [advance, if_true]
        rw [hf.1]
        have he : x + (y-x) = y := by omega
        nlinarith
      · simp only [List.foldl_cons]
        rw [hb]
        simp only [advance, if_true]
        rw [hf.2.1]
        have he : x + (y-x) = y := by omega
        nlinarith
    · have hx1 : x = 1 := by simpa [heq] using hcop
      have hy1 : y = 1 := by omega
      refine ⟨[], ?_, ?_⟩
      · simpa [hx1, hy1] using hf.1
      · simpa [hx1, hy1] using hf.2.1
    · have hc : Nat.Coprime (x-y) y :=
        (Nat.coprime_sub_self_left (Nat.le_of_lt hgt)).mpr hcop
      obtain ⟨path, ha, hb⟩ := ih ((x-y)+y) (by omega) (x-y) y rfl
        (by omega) hy hc (advance f false) (indices_advance hf false)
      refine ⟨false :: path, ?_, ?_⟩
      · simp only [List.foldl_cons]
        rw [ha]
        simp only [advance, Bool.false_eq_true, if_false]
        rw [hf.1]
        have he : (x-y) + y = x := by omega
        nlinarith
      · simp only [List.foldl_cons]
        rw [hb]
        simp only [advance, Bool.false_eq_true, if_false]
        rw [hf.2.1]
        have he : (x-y) + y = x := by omega
        nlinarith

/-- Every reduced interior rational occurs with its exact numerator and
denominator, not merely an equal rational value. -/
theorem rational_coverage_098 {a b : ℕ} (ha : 0 < a) (hab : a < b)
    (hc : Nat.Coprime a b) :
    ∃ path : List Bool, (frame path).mid.a = a ∧ (frame path).mid.b = b := by
  have hw : Nat.Coprime (b-a) a :=
    (Nat.coprime_sub_self_left (Nat.le_of_lt hab)).mpr hc.symm
  obtain ⟨path, hp, hq⟩ := weighted_coverage_098 ((b-a)+a) (b-a) a rfl
    (by omega) ha hw initial indices_initial
  refine ⟨path, ?_, ?_⟩
  · simpa [frame, initial] using hp
  · simpa [frame, initial, Nat.sub_add_cancel (Nat.le_of_lt hab)] using hq

#print axioms weighted_coverage_098
#print axioms rational_coverage_098
end MathGKM.Markov
