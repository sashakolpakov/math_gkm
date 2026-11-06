import MathGKM.Round28CoefficientsA

/-! Machine-authored directional binomial inequalities, committed round29. -/
namespace EndpointR29
open MathGKM.Markov RenewalR28
set_option maxHeartbeats 1000000

theorem choose_lc (n k : ℕ) :
    (n.choose k : ℤ)*(n.choose (k+2) : ℤ) ≤ (n.choose (k+1) : ℤ)^2 := by
  by_cases h : k+2 ≤ n
  · have h1 : (n.choose (k+1) : ℤ)*(k+1)= (n.choose k : ℤ)*((n-k : ℕ) : ℤ) := by
      exact_mod_cast Nat.choose_succ_right_eq n k
    have h2 : (n.choose (k+2) : ℤ)*(k+2)= (n.choose (k+1) : ℤ)*((n-(k+1) : ℕ) : ℤ) := by
      exact_mod_cast Nat.choose_succ_right_eq n (k+1)
    have ek : (n-k : ℕ)=(n:ℤ)-k := by omega
    have ek1 : (n-(k+1) : ℕ)=(n:ℤ)-k-1 := by omega
    push_cast at h1 h2
    rw [ek] at h1
    rw [ek1] at h2
    have ident : ((k:ℤ)+1)*((n:ℤ)-k-1)*
        ((n.choose (k+1) : ℤ)^2-(n.choose k : ℤ)*(n.choose (k+2) : ℤ)) =
        (n.choose k : ℤ)*(n.choose (k+2) : ℤ)*((n:ℤ)+1) := by
      linear_combination (n.choose (k+1) : ℤ)*((n:ℤ)-k-1)*h1 -
        (n.choose k : ℤ)*((n:ℤ)-k)*h2
    have factor : 0<((k:ℤ)+1)*((n:ℤ)-k-1) := by
      apply mul_pos <;> omega
    have rhs : 0 ≤ (n.choose k : ℤ)*(n.choose (k+2) : ℤ)*((n:ℤ)+1) := by positivity
    nlinarith
  · rw [Nat.choose_eq_zero_of_lt (by omega : n<k+2)]
    simp only [Nat.cast_zero,mul_zero]
    positivity

theorem upper_lc (n k : ℕ) :
    (n.choose k : ℤ)*((n+2).choose k : ℤ) ≤ ((n+1).choose k : ℤ)^2 := by
  by_cases hk : k ≤ n
  · have h1 : (n.choose k : ℤ)*(n+1)=((n+1).choose k : ℤ)*(n+1-k : ℕ) := by
      exact_mod_cast Nat.choose_mul_succ_eq n k
    have h2 : ((n+1).choose k : ℤ)*(n+2)=((n+2).choose k : ℤ)*(n+2-k : ℕ) := by
      exact_mod_cast Nat.choose_mul_succ_eq (n+1) k
    have e1 : (n+1-k : ℕ)=(n:ℤ)+1-k := by omega
    have e2 : (n+2-k : ℕ)=(n:ℤ)+2-k := by omega
    push_cast at h1 h2
    rw [e1] at h1
    rw [e2] at h2
    have ident : ((n:ℤ)+1)*((n:ℤ)+2-k)*
        (((n+1).choose k : ℤ)^2-(n.choose k : ℤ)*((n+2).choose k : ℤ)) =
        (k:ℤ)*((n+1).choose k : ℤ)^2 := by
      linear_combination -((n+2).choose k : ℤ)*((n:ℤ)+2-k)*h1 +
        ((n+1).choose k : ℤ)*((n:ℤ)+1-k)*h2
    have hp : 0<((n:ℤ)+1)*((n:ℤ)+2-k) := by apply mul_pos <;> omega
    have hn : 0≤(k:ℤ)*((n+1).choose k : ℤ)^2 := by positivity
    nlinarith
  · rw [Nat.choose_eq_zero_of_lt (by omega : n<k)]
    simp only [Nat.cast_zero,zero_mul]
    positivity

theorem product_lc (a b c x y z : ℤ)
    (ha : 0≤a) (hc : 0≤c) (hx : 0≤x) (hz : 0≤z)
    (h : a*c≤b^2) (h' : x*z≤y^2) : (a*x)*(c*z)≤(b*y)^2 := by
  calc
    (a*x)*(c*z) = (a*c)*(x*z) := by ring
    _ ≤ (b^2)*(y^2) := mul_le_mul h h' (mul_nonneg hx hz) (sq_nonneg b)
    _ = (b*y)^2 := by ring

end EndpointR29
