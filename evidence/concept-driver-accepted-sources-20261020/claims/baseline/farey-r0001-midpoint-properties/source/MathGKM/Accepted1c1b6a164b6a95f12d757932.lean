import MathGKM.Target3c8d87a78ba7ff618caa9f8c
import MathGKM.Markov
import Lean
def Accepted1c1b6a164b6a95f12d757932.interface : MathGKM.Target3c8d87a78ba7ff618caa9f8c.Interface :=
  (
    True.intro
  )
theorem Accepted1c1b6a164b6a95f12d757932.transport : MathGKM.Target3c8d87a78ba7ff618caa9f8c.Transport Accepted1c1b6a164b6a95f12d757932.interface :=
  (
    True.intro
  )
theorem Accepted1c1b6a164b6a95f12d757932.obligation : MathGKM.Target3c8d87a78ba7ff618caa9f8c.Goal Accepted1c1b6a164b6a95f12d757932.interface :=
  (
    by
      have all_inv : ∀ path : List Bool, let f := MathGKM.Markov.frame path;
      f.mid.a = f.lo.a + f.hi.a ∧
      f.mid.b = f.lo.b + f.hi.b ∧
      f.lo.b * f.hi.a = f.lo.a * f.hi.b + 1 ∧
      0 < f.lo.b ∧ 0 < f.hi.b ∧
      f.lo.a ≤ f.lo.b ∧ f.hi.a ≤ f.hi.b :=
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

      intro path
      rcases all_inv path with ⟨ha, hb, hd, hl, hh, hla, hha⟩
      have hpos : 0 < (MathGKM.Markov.frame path).mid.a := by
        by_contra h
        have hz : (MathGKM.Markov.frame path).lo.a = 0 ∧ (MathGKM.Markov.frame path).hi.a = 0 := by omega
        rcases hz with ⟨hzl, hzh⟩
        simp [hzl, hzh] at hd
      have hlt : (MathGKM.Markov.frame path).mid.a < (MathGKM.Markov.frame path).mid.b := by
        by_contra h
        have heq : (MathGKM.Markov.frame path).lo.a = (MathGKM.Markov.frame path).lo.b ∧
            (MathGKM.Markov.frame path).hi.a = (MathGKM.Markov.frame path).hi.b := by omega
        rcases heq with ⟨hel, heh⟩
        rw [hel, heh] at hd
        omega
      refine ⟨hpos, hlt, by omega, ?_⟩
      have hm : (MathGKM.Markov.frame path).lo.b * (MathGKM.Markov.frame path).mid.a =
          (MathGKM.Markov.frame path).lo.a * (MathGKM.Markov.frame path).mid.b + 1 := by
        rw [ha, hb]
        nlinarith
      have hd1 : Nat.gcd (MathGKM.Markov.frame path).mid.a (MathGKM.Markov.frame path).mid.b ∣
          (MathGKM.Markov.frame path).lo.b * (MathGKM.Markov.frame path).mid.a :=
        dvd_mul_of_dvd_right (Nat.gcd_dvd_left _ _) _
      have hd2 : Nat.gcd (MathGKM.Markov.frame path).mid.a (MathGKM.Markov.frame path).mid.b ∣
          (MathGKM.Markov.frame path).lo.a * (MathGKM.Markov.frame path).mid.b :=
        dvd_mul_of_dvd_right (Nat.gcd_dvd_right _ _) _
      rw [hm] at hd1
      exact Nat.eq_one_of_dvd_one ((Nat.dvd_add_iff_right hd2).mpr hd1)
  )
