import MathGKM.Targete53fdd001b2c1f5675b1eab5
import MathGKM.Markov
import Lean
def StudyInterface : MathGKM.Targete53fdd001b2c1f5675b1eab5.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Targete53fdd001b2c1f5675b1eab5.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Targete53fdd001b2c1f5675b1eab5.Goal StudyInterface :=
  (
    by
      let Inv : MathGKM.Markov.Frame → Prop := fun f =>
        f.mid.a = f.lo.a + f.hi.a ∧
        f.mid.b = f.lo.b + f.hi.b ∧
        f.lo.b * f.hi.a = f.lo.a * f.hi.b + 1 ∧
        0 < f.lo.b ∧ 0 < f.hi.b ∧
        f.lo.a ≤ f.lo.b ∧ f.hi.a ≤ f.hi.b
      have initial_inv : Inv MathGKM.Markov.initial := by norm_num [Inv, MathGKM.Markov.initial]
      have step_inv (f : MathGKM.Markov.Frame) (right : Bool) (h : Inv f) : Inv (MathGKM.Markov.advance f right) := by
        rcases h with ⟨ha, hb, hd, hl, hh, hla, hha⟩
        cases right <;> simp only [MathGKM.Markov.advance, Bool.false_eq_true, ↓reduceIte, Inv]
        · refine ⟨True.intro, True.intro, ?_, hl, ?_, hla, ?_⟩
          · rw [ha, hb]
            nlinarith
          · omega
          · omega
        · refine ⟨True.intro, True.intro, ?_, ?_, hh, ?_, hha⟩
          · rw [ha, hb]
            nlinarith
          · omega
          · omega

      intro path
      have lift : ∀ (p : List Bool) (f : MathGKM.Markov.Frame), Inv f → Inv (p.foldl MathGKM.Markov.advance f) := by
        intro p
        induction p with
        | nil => intro f h; exact h
        | cons r p ih =>
          intro f h
          exact ih (MathGKM.Markov.advance f r) (step_inv f r h)
      exact lift path MathGKM.Markov.initial initial_inv
  )
