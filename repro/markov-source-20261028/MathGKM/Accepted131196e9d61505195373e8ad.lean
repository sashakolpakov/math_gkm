import MathGKM.Targetdc5da224b6fa0c400d38f6a4
import MathGKM.Markov
import Lean
def Accepted131196e9d61505195373e8ad.interface : MathGKM.Targetdc5da224b6fa0c400d38f6a4.Interface :=
  (
    True.intro
  )
theorem Accepted131196e9d61505195373e8ad.transport : MathGKM.Targetdc5da224b6fa0c400d38f6a4.Transport Accepted131196e9d61505195373e8ad.interface :=
  (
    True.intro
  )
theorem Accepted131196e9d61505195373e8ad.obligation : MathGKM.Targetdc5da224b6fa0c400d38f6a4.Goal Accepted131196e9d61505195373e8ad.interface :=
  (
    (show (let A : Polynomial ℤ := 1+Polynomial.X; let B : Polynomial ℤ := 1+Polynomial.X^2; let C : Polynomial ℤ := 1+Polynomial.X+Polynomial.X^2+Polynomial.X^3; A*B=C ∧ (∀ n, 0 ≤ A.coeff n) ∧ (∀ n, 0 ≤ B.coeff n) ∧ (∀ n, 0 ≤ C.coeff n) ∧ (∀ n, A.coeff n*A.coeff (n+2) ≤ A.coeff (n+1)^2) ∧ (∀ n, C.coeff n*C.coeff (n+2) ≤ C.coeff (n+1)^2) ∧ B.coeff 1=0 ∧ B.coeff 0*B.coeff 2 > B.coeff 1^2) from
    by
      intro A B C
      have ha (n : ℕ) : A.coeff n = (if n=0 then 1 else 0)+(if n=1 then 1 else 0) := by
        simp [A, Polynomial.coeff_one, Polynomial.coeff_X, eq_comm]
      have hb (n : ℕ) : B.coeff n = (if n=0 then 1 else 0)+(if n=2 then 1 else 0) := by
        simp [B, Polynomial.coeff_one, Polynomial.coeff_X_pow]
      have hc (n : ℕ) : C.coeff n =
          (if n=0 then 1 else 0)+(if n=1 then 1 else 0)+
          (if n=2 then 1 else 0)+(if n=3 then 1 else 0) := by
        simp [C, Polynomial.coeff_one, Polynomial.coeff_X, Polynomial.coeff_X_pow, eq_comm]
      refine ⟨?_,?_,?_,?_,?_,?_,?_,?_⟩
      · dsimp [A,B,C]
        ring
      · intro n
        rw [ha]
        split_ifs <;> norm_num
      · intro n
        rw [hb]
        split_ifs <;> norm_num
      · intro n
        rw [hc]
        split_ifs <;> norm_num
      · intro n
        by_cases hn : n<4
        · interval_cases n <;> norm_num [ha]
        · have hn0 : n≠0 := by omega
          have hn1 : n≠1 := by omega
          simp (disch := omega) [ha,hn0,hn1]
      · intro n
        by_cases hn : n<4
        · interval_cases n <;> norm_num [hc]
        · have hn0 : n≠0 := by omega
          have hn1 : n≠1 := by omega
          have hn2 : n≠2 := by omega
          have hn3 : n≠3 := by omega
          simp (disch := omega) [hc,hn0,hn1,hn2,hn3]
      · rw [hb]
        norm_num
      · simp only [hb]
        norm_num
    )
  )
