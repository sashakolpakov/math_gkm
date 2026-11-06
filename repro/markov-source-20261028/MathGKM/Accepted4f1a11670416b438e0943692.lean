import MathGKM.Target231c08e274ae7854558ea819
import MathGKM.Markov
import Lean
def Accepted4f1a11670416b438e0943692.interface : MathGKM.Target231c08e274ae7854558ea819.Interface :=
  (
    True.intro
  )
theorem Accepted4f1a11670416b438e0943692.transport : MathGKM.Target231c08e274ae7854558ea819.Transport Accepted4f1a11670416b438e0943692.interface :=
  (
    True.intro
  )
theorem Accepted4f1a11670416b438e0943692.obligation : MathGKM.Target231c08e274ae7854558ea819.Goal Accepted4f1a11670416b438e0943692.interface :=
  (
    by
      have inv : ∀ path : List Bool,
          let f := MathGKM.Markov.frame path
          f.mid.a = f.lo.a + f.hi.a ∧ f.mid.b = f.lo.b + f.hi.b ∧
          f.mid.p^2 + MathGKM.Markov.U^f.lo.a*MathGKM.Markov.V^f.lo.b*f.hi.p^2 + MathGKM.Markov.U^f.hi.a*MathGKM.Markov.V^f.hi.b*f.lo.p^2 -
            MathGKM.Markov.S*f.lo.p*f.mid.p*f.hi.p = 0 := by
        intro path
        induction path using List.reverseRecOn with
        | nil =>
          norm_num [MathGKM.Markov.frame, MathGKM.Markov.initial, MathGKM.Markov.S]
          ring
        | append_singleton path branch ih =>
          have step : MathGKM.Markov.frame (path ++ [branch]) = MathGKM.Markov.advance (MathGKM.Markov.frame path) branch := by
            simp [MathGKM.Markov.frame, List.foldl_append]
          dsimp only at ih ⊢
          rw [step]
          rcases ih with ⟨ha,hb,hs⟩
          cases branch <;> simp only [MathGKM.Markov.advance, Bool.false_eq_true, ↓reduceIte]
          · refine ⟨?_,?_,?_⟩
            · exact True.intro
            · exact True.intro
            · rw [ha,hb,pow_add,pow_add]
              calc
                _ = (MathGKM.Markov.U^(MathGKM.Markov.frame path).lo.a*MathGKM.Markov.V^(MathGKM.Markov.frame path).lo.b) *
                    ((MathGKM.Markov.frame path).mid.p^2 + MathGKM.Markov.U^(MathGKM.Markov.frame path).lo.a*MathGKM.Markov.V^(MathGKM.Markov.frame path).lo.b*(MathGKM.Markov.frame path).hi.p^2 +
                      MathGKM.Markov.U^(MathGKM.Markov.frame path).hi.a*MathGKM.Markov.V^(MathGKM.Markov.frame path).hi.b*(MathGKM.Markov.frame path).lo.p^2 -
                      MathGKM.Markov.S*(MathGKM.Markov.frame path).lo.p*(MathGKM.Markov.frame path).mid.p*(MathGKM.Markov.frame path).hi.p) := by ring
                _ = 0 := by rw [hs]; ring
          · refine ⟨?_,?_,?_⟩
            · exact True.intro
            · exact True.intro
            · rw [ha,hb,pow_add,pow_add]
              calc
                _ = (MathGKM.Markov.U^(MathGKM.Markov.frame path).hi.a*MathGKM.Markov.V^(MathGKM.Markov.frame path).hi.b) *
                    ((MathGKM.Markov.frame path).mid.p^2 + MathGKM.Markov.U^(MathGKM.Markov.frame path).lo.a*MathGKM.Markov.V^(MathGKM.Markov.frame path).lo.b*(MathGKM.Markov.frame path).hi.p^2 +
                      MathGKM.Markov.U^(MathGKM.Markov.frame path).hi.a*MathGKM.Markov.V^(MathGKM.Markov.frame path).hi.b*(MathGKM.Markov.frame path).lo.p^2 -
                      MathGKM.Markov.S*(MathGKM.Markov.frame path).lo.p*(MathGKM.Markov.frame path).mid.p*(MathGKM.Markov.frame path).hi.p) := by ring
                _ = 0 := by rw [hs]; ring
      intro path
      dsimp only
      have hs := (inv path).2.2
      refine ⟨hs,?_⟩
      intro branch
      cases branch <;> dsimp [MathGKM.Markov.advance]
      · linear_combination -hs
      · linear_combination -hs
  )
