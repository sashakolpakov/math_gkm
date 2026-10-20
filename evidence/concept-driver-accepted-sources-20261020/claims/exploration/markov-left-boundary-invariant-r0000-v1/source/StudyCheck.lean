import MathGKM.Target8edb64187418889e9e311936
import MathGKM.Markov
import Lean
def StudyInterface : MathGKM.Target8edb64187418889e9e311936.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Target8edb64187418889e9e311936.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Target8edb64187418889e9e311936.Goal StudyInterface :=
  (
    by
      intro k
      let atVZero := fun p : MathGKM.Markov.BiPoly => p.map (Polynomial.evalRingHom (0 : ℤ))
      change
        let f := MathGKM.Markov.frame (List.replicate k false)
        f.lo = ⟨0,1,1⟩ ∧ f.mid.a = 1 ∧ f.mid.b = k+2 ∧
        f.hi.a = 1 ∧ f.hi.b = k+1 ∧
        atVZero f.mid.p = Polynomial.X * (1+Polynomial.X)^(k+1) ∧
        atVZero f.hi.p = Polynomial.X * (1+Polynomial.X)^k
      have left_step (k : ℕ) :
          MathGKM.Markov.frame (List.replicate (k+1) false) =
            MathGKM.Markov.advance (MathGKM.Markov.frame (List.replicate k false)) false := by
        simp [MathGKM.Markov.frame, List.replicate_succ', List.foldl_append]
      induction k with
      | zero =>
        norm_num [MathGKM.Markov.frame, MathGKM.Markov.initial, atVZero, MathGKM.Markov.U, MathGKM.Markov.V]
        ring
      | succ k ih =>
        dsimp only at ih ⊢
        rcases ih with ⟨hlo, hma, hmb, hha, hhb, hmp, hhp⟩
        rw [left_step]
        simp only [MathGKM.Markov.advance, Bool.false_eq_true, ↓reduceIte]
        simp only [hlo]
        refine ⟨True.intro, ?_, ?_, hma, ?_, ?_, ?_⟩
        · simpa using hma
        · simpa [hmb, Nat.add_comm, Nat.add_left_comm, Nat.add_assoc]
        · simpa [hmb]
        · simp only [atVZero, Polynomial.map_sub, Polynomial.map_mul,
            Polynomial.map_pow, MathGKM.Markov.S, Polynomial.map_add, Polynomial.map_one,
            MathGKM.Markov.U, MathGKM.Markov.V, Polynomial.map_X, Polynomial.map_C]
          simp only [Polynomial.coe_evalRingHom, Polynomial.eval_X, Polynomial.C_0,
            pow_zero, pow_one, mul_zero, zero_mul, sub_zero, mul_one, add_zero]
          change (Polynomial.X + 1) * atVZero (MathGKM.Markov.frame (List.replicate k false)).mid.p = _
          rw [hmp, pow_succ]
          ring
        · simpa [Nat.succ_eq_add_one] using hmp
  )
