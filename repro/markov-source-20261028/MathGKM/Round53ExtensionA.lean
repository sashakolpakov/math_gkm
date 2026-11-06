import MathGKM.Accepted3c265afc977f227a9f6535e7

/-! Machine-authored round53: extension of the actual fixed-right sequence.
No row-factorization or inequality premise is inferred from the recurrence. -/
namespace HorizontalR53
noncomputable section
open MathGKM.Markov

def R : ℕ → BiPoly
  | 0 => 1
  | n+1 => RightR30.M n

def A : BiPoly := RightR30.T*(RightR30.T+1)

theorem R_actual (n : ℕ) (hn : 1≤n) :
    R n=(frame (List.replicate (n-1) true)).mid.p := by
  obtain ⟨k,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : n≠0)
  simp [R,RightR30.M]

theorem R_initial : R 0=1 ∧ R 1=(U+V)^2+U := by
  constructor
  · rfl
  · rfl

theorem R_recurrence (n : ℕ) : R (n+2)=A*R (n+1)-U*V*R n := by
  cases n with
  | zero =>
    change RightR30.M 1=A*RightR30.M 0-U*V*1
    change S*(U+V)*((U+V)^2+U)-U^1*V^1*1=
      A*((U+V)^2+U)-U*V*1
    dsimp [A,RightR30.T,S]
    ring
  | succ k =>
    exact Accepted3c265afc977f227a9f6535e7.obligation.1.2.2.2 k

theorem extension_bundle :
    (R 0=1 ∧ R 1=(U+V)^2+U) ∧
    (∀ n, 1≤n → R n=(frame (List.replicate (n-1) true)).mid.p) ∧
    (∀ n, R (n+2)=A*R (n+1)-U*V*R n) :=
  ⟨R_initial,R_actual,R_recurrence⟩
end
end HorizontalR53
#print axioms HorizontalR53.extension_bundle
