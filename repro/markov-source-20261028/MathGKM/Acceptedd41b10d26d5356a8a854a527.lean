import MathGKM.Target44dd5e9971774f444cb3be6c
import MathGKM.Markov
import Lean
def Acceptedd41b10d26d5356a8a854a527.interface : MathGKM.Target44dd5e9971774f444cb3be6c.Interface :=
  (
    True.intro
  )
theorem Acceptedd41b10d26d5356a8a854a527.transport : MathGKM.Target44dd5e9971774f444cb3be6c.Transport Acceptedd41b10d26d5356a8a854a527.interface :=
  (
    True.intro
  )
theorem Acceptedd41b10d26d5356a8a854a527.obligation : MathGKM.Target44dd5e9971774f444cb3be6c.Goal Acceptedd41b10d26d5356a8a854a527.interface :=
  (
    by
      set_option maxHeartbeats 1000000 in
        intro H r q phi T A nn
        have step (z) : phi (T z) = A (phi z) := by
          apply Prod.ext
          all_goals dsimp [phi, T, A]; ring
        have iter (n : ℕ) (z) : phi (T^[n] z) = A^[n] (phi z) := by
          induction n with
          | zero => rfl
          | succ n ih =>
            rw [Function.iterate_succ_apply', Function.iterate_succ_apply', step, ih]
        refine ⟨step, iter, ?_⟩
        have nn_add (P Q : MathGKM.Markov.BiPoly) (hp : nn P) (hq : nn Q) : nn (P+Q) := by
          intro i j
          simpa only [MathGKM.Markov.coeff, Polynomial.coeff_add] using add_nonneg (hp i j) (hq i j)
        have nn_mul (P Q : MathGKM.Markov.BiPoly) (hp : nn P) (hq : nn Q) : nn (P*Q) := by
          intro i j
          dsimp [MathGKM.Markov.coeff]
          rw [Polynomial.coeff_mul, Polynomial.finsetSum_coeff]
          apply Finset.sum_nonneg
          intro uv huv
          rw [Polynomial.coeff_mul]
          apply Finset.sum_nonneg
          intro st hst
          exact mul_nonneg (hp uv.1 st.1) (hq uv.2 st.2)
        intro z hH hr hq hm hg n
        have preserve (w : MathGKM.Markov.BiPoly × MathGKM.Markov.BiPoly)
            (h1 : nn w.1) (h2 : nn w.2) : nn (A w).1 ∧ nn (A w).2 := by
          exact ⟨nn_add _ _ (nn_mul _ _ (nn_add _ _ hH hr) h1) (nn_mul _ _ hq h2),
            nn_add _ _ (nn_mul _ _ hH h1) (nn_mul _ _ hq h2)⟩
        have pos (n : ℕ) : nn (A^[n] (phi z)).1 ∧ nn (A^[n] (phi z)).2 := by
          induction n with
          | zero => exact ⟨hm, hg⟩
          | succ n ih =>
            rw [Function.iterate_succ_apply']
            exact preserve _ ih.1 ih.2
        have hp := pos n
        rw [← iter n z] at hp
        exact hp
  )
