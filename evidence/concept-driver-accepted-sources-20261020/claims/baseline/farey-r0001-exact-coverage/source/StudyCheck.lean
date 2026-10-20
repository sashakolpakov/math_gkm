import MathGKM.Target8175fcd84b59e92c4c40bab7
import MathGKM.Markov
import Lean
def StudyInterface : MathGKM.Target8175fcd84b59e92c4c40bab7.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Target8175fcd84b59e92c4c40bab7.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Target8175fcd84b59e92c4c40bab7.Goal StudyInterface :=
  (
    by
      have weighted_coverage : ∀ (x y : ℕ), 0 < x → 0 < y → Nat.Coprime x y →
          ∀ f : MathGKM.Markov.Frame, (f.mid.a = f.lo.a + f.hi.a ∧ f.mid.b = f.lo.b + f.hi.b) →
          ∃ p : List Bool,
            (p.foldl MathGKM.Markov.advance f).mid.a = x * f.lo.a + y * f.hi.a ∧
            (p.foldl MathGKM.Markov.advance f).mid.b = x * f.lo.b + y * f.hi.b := by
        have go : ∀ n : ℕ, ∀ x y : ℕ, x + y = n → 0 < x → 0 < y → Nat.Coprime x y →
            ∀ f : MathGKM.Markov.Frame, (f.mid.a = f.lo.a + f.hi.a ∧ f.mid.b = f.lo.b + f.hi.b) →
            ∃ p : List Bool,
              (p.foldl MathGKM.Markov.advance f).mid.a = x * f.lo.a + y * f.hi.a ∧
              (p.foldl MathGKM.Markov.advance f).mid.b = x * f.lo.b + y * f.hi.b := by
          intro n
          induction n using Nat.strong_induction_on with
          | h n ih =>
            intro x y hn hx hy hc f hf
            by_cases heq : x = y
            · subst y
              have h1 : x = 1 := by simpa using hc
              subst x
              exact ⟨[], by simpa using hf.1, by simpa using hf.2⟩
            · rcases lt_or_gt_of_ne heq with hlt | hgt
              · have hsmall : x + (y - x) < n := by omega
                have hc' : Nat.Coprime x (y - x) :=
                  (Nat.coprime_sub_self_right (by omega)).mpr hc
                obtain ⟨p, ha, hb⟩ := ih (x + (y - x)) hsmall x (y-x) rfl hx
                  (by omega) hc' (MathGKM.Markov.advance f true) (by simp [MathGKM.Markov.advance])
                refine ⟨true :: p, ?_, ?_⟩
                · simp only [List.foldl_cons]
                  rw [ha]
                  simp only [MathGKM.Markov.advance, ↓reduceIte]
                  rw [hf.1]
                  have he : x + (y-x) = y := by omega
                  calc
                    _ = x * f.lo.a + (x + (y-x)) * f.hi.a := by ring
                    _ = _ := by rw [he]
                · simp only [List.foldl_cons]
                  rw [hb]
                  simp only [MathGKM.Markov.advance, ↓reduceIte]
                  rw [hf.2]
                  have he : x + (y-x) = y := by omega
                  calc
                    _ = x * f.lo.b + (x + (y-x)) * f.hi.b := by ring
                    _ = _ := by rw [he]
              · have hsmall : (x - y) + y < n := by omega
                have hc' : Nat.Coprime (x - y) y :=
                  (Nat.coprime_sub_self_left (by omega)).mpr hc
                obtain ⟨p, ha, hb⟩ := ih ((x-y)+y) hsmall (x-y) y rfl
                  (by omega) hy hc' (MathGKM.Markov.advance f false) (by simp [MathGKM.Markov.advance])
                refine ⟨false :: p, ?_, ?_⟩
                · simp only [List.foldl_cons]
                  rw [ha]
                  simp only [MathGKM.Markov.advance, Bool.false_eq_true, ↓reduceIte]
                  rw [hf.1]
                  have he : (x-y) + y = x := by omega
                  calc
                    _ = ((x-y)+y) * f.lo.a + y * f.hi.a := by ring
                    _ = _ := by rw [he]
                · simp only [List.foldl_cons]
                  rw [hb]
                  simp only [MathGKM.Markov.advance, Bool.false_eq_true, ↓reduceIte]
                  rw [hf.2]
                  have he : (x-y) + y = x := by omega
                  calc
                    _ = ((x-y)+y) * f.lo.b + y * f.hi.b := by ring
                    _ = _ := by rw [he]
        intro x y hx hy hc f hf
        exact go (x+y) x y rfl hx hy hc f hf
      intro a b ha hab hc
      have hc' : Nat.Coprime (b-a) a :=
        (Nat.coprime_sub_self_left (Nat.le_of_lt hab)).mpr hc.symm
      obtain ⟨p, hp, hq⟩ := weighted_coverage (b-a) a (by omega) ha hc' MathGKM.Markov.initial
        (by norm_num [MathGKM.Markov.initial])
      refine ⟨p, ?_, ?_⟩
      · simpa [MathGKM.Markov.frame, MathGKM.Markov.initial] using hp
      · simpa [MathGKM.Markov.frame, MathGKM.Markov.initial, Nat.sub_add_cancel (Nat.le_of_lt hab)] using hq
  )
