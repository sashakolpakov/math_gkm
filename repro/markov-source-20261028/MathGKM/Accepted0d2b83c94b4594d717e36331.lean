import MathGKM.Target2b2131ae2d71b3d5b42c2bc0
import MathGKM.Markov
import Lean
def Accepted0d2b83c94b4594d717e36331.interface : MathGKM.Target2b2131ae2d71b3d5b42c2bc0.Interface :=
  (
    True.intro
  )
theorem Accepted0d2b83c94b4594d717e36331.transport : MathGKM.Target2b2131ae2d71b3d5b42c2bc0.Transport Accepted0d2b83c94b4594d717e36331.interface :=
  (
    True.intro
  )
theorem Accepted0d2b83c94b4594d717e36331.obligation : MathGKM.Target2b2131ae2d71b3d5b42c2bc0.Goal Accepted0d2b83c94b4594d717e36331.interface :=
  (
    by
      have inv : ∀ path : List Bool,
          let f := MathGKM.Markov.frame path
          f.mid.a = f.lo.a + f.hi.a ∧
          f.mid.b = f.lo.b + f.hi.b ∧
          f.hi.a * f.lo.b = f.lo.a * f.hi.b + 1 ∧
          0 < f.lo.b ∧ 0 < f.hi.b ∧
          f.lo.a < f.lo.b ∧ f.hi.a ≤ f.hi.b ∧ 0 < f.hi.a := by
        intro path
        induction path using List.reverseRecOn with
        | nil => norm_num [MathGKM.Markov.frame, MathGKM.Markov.initial]
        | append_singleton path branch ih =>
          have step : MathGKM.Markov.frame (path ++ [branch]) = MathGKM.Markov.advance (MathGKM.Markov.frame path) branch := by
            simp [MathGKM.Markov.frame, List.foldl_append]
          dsimp only at ih ⊢
          rw [step]
          rcases ih with ⟨ha,hb,hd,hl,hh,hlt,hle,hpos⟩
          cases branch <;> simp only [MathGKM.Markov.advance, Bool.false_eq_true, ↓reduceIte]
          · refine ⟨?_,?_,?_,hl,?_,hlt,?_,?_⟩ <;> try dsimp only
            all_goals first | omega | nlinarith [hd]
          · refine ⟨?_,?_,?_,?_,hh,?_,hle,hpos⟩ <;> try dsimp only
            all_goals first | omega | nlinarith [hd]
      intro path
      dsimp only
      rcases inv path with ⟨ha,hb,hd,hl,hh,hlt,hle,hpos⟩
      refine ⟨ha,hb,hd,hl,hh,by omega,by omega,?_⟩
      let d := Nat.gcd (MathGKM.Markov.frame path).mid.a (MathGKM.Markov.frame path).mid.b
      have hda : d ∣ (MathGKM.Markov.frame path).mid.a := Nat.gcd_dvd_left _ _
      have hdb : d ∣ (MathGKM.Markov.frame path).mid.b := Nat.gcd_dvd_right _ _
      have he : (MathGKM.Markov.frame path).mid.a * (MathGKM.Markov.frame path).lo.b =
          (MathGKM.Markov.frame path).lo.a * (MathGKM.Markov.frame path).mid.b + 1 := by
        rw [ha,hb]
        nlinarith [hd]
      have h1 : d ∣ (MathGKM.Markov.frame path).mid.a * (MathGKM.Markov.frame path).lo.b := dvd_mul_of_dvd_left hda _
      have h2 : d ∣ (MathGKM.Markov.frame path).lo.a * (MathGKM.Markov.frame path).mid.b := dvd_mul_of_dvd_right hdb _
      rw [he] at h1
      exact Nat.dvd_one.mp ((Nat.dvd_add_iff_right h2).mpr h1)
  )
