import MathGKM.Target74be273e7633368ae67a137d
import MathGKM.Acceptedd41b10d26d5356a8a854a527
import Lean
def Accepteddbe47cff06ae43fd1c953340.interface : MathGKM.Target74be273e7633368ae67a137d.Interface :=
  (
    True.intro
  )
theorem Accepteddbe47cff06ae43fd1c953340.transport : MathGKM.Target74be273e7633368ae67a137d.Transport Accepteddbe47cff06ae43fd1c953340.interface :=
  (
    True.intro
  )
theorem Accepteddbe47cff06ae43fd1c953340.obligation : MathGKM.Target74be273e7633368ae67a137d.Goal Accepteddbe47cff06ae43fd1c953340.interface :=
  (
    by
      intro f branch fixed other F r q H run phi T A nn z
      have fixed_step (g : MathGKM.Markov.Frame) : fixed (MathGKM.Markov.advance g branch) = fixed g := by
        cases branch <;> rfl
      have pair_step (g : MathGKM.Markov.Frame) (hf : fixed g = F) :
          ((MathGKM.Markov.advance g branch).mid.p,(other (MathGKM.Markov.advance g branch)).p) =
            T (g.mid.p,(other g).p) := by
        cases branch
        · change g.lo = F at hf
          dsimp [MathGKM.Markov.advance, other, T]
          rw [hf]
          apply Prod.ext
          · dsimp [H, r, q]
            ring
          · rfl
        · change g.hi = F at hf
          dsimp [MathGKM.Markov.advance, other, T]
          rw [hf]
          apply Prod.ext
          · dsimp [H, r, q]
            ring
          · rfl
      have trajectory (n : ℕ) : fixed (run n) = F ∧
          ((run n).mid.p,(other (run n)).p) = T^[n] z := by
        induction n with
        | zero => exact ⟨rfl,rfl⟩
        | succ n ih =>
          have step_run : run (n+1) = MathGKM.Markov.advance (run n) branch := by
            exact Function.iterate_succ_apply' _ _ _
          rw [step_run]
          refine ⟨?_,?_⟩
          · rw [fixed_step,ih.1]
          · rw [pair_step _ ih.1,ih.2,Function.iterate_succ_apply']
      have accepted := Acceptedd41b10d26d5356a8a854a527.obligation H r q
      change (∀ w, phi (T w) = A (phi w)) ∧
        (∀ n w, phi (T^[n] w) = A^[n] (phi w)) ∧
        (∀ w, nn H → nn r → nn q → nn w.1 → nn (w.1-r*w.2) →
          ∀ n, nn (T^[n] w).1 ∧ nn (phi (T^[n] w)).2) at accepted
      constructor
      · intro n
        exact ⟨(trajectory n).1,(trajectory n).2,by rw [(trajectory n).2]; exact accepted.2.1 n z⟩
      · intro hH hr hq hm hg n
        have hp := accepted.2.2 z hH hr hq hm hg n
        rw [← (trajectory n).2] at hp
        exact hp
  )
