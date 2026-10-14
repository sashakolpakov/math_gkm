import MarkovTopLC1998

/-! Machine-authored request 6ade2697. Upper-index binomial log-concavity
and pointwise multiplication, over literal nonnegative integer coefficients. -/
namespace MathGKM.Markov
noncomputable section

theorem choose_upper_lc6 (n k : ℕ) :
    (n.choose k : ℤ)*(n+2).choose k ≤ ((n+1).choose k : ℤ)^2 := by
  by_cases hk : n<k
  · rw [Nat.choose_eq_zero_of_lt hk,Int.natCast_zero,zero_mul]
    exact sq_nonneg _
  · have hkn : k≤n := by omega
    have h1 : (n.choose k : ℤ)*(n+1)=((n+1).choose k : ℤ)*(n+1-k) := by
      have h := congrArg (fun x : ℕ => (x:ℤ)) (Nat.choose_mul_succ_eq n k)
      simpa only [Nat.cast_mul,Nat.cast_sub (show k≤n+1 by omega),
        Nat.cast_add,Nat.cast_one] using h
    have h2 : ((n+1).choose k : ℤ)*(n+2)=((n+2).choose k : ℤ)*(n+2-k) := by
      have h := congrArg (fun x : ℕ => (x:ℤ)) (Nat.choose_mul_succ_eq (n+1) k)
      have he : n+1+1=n+2 := by omega
      rw [he] at h
      simpa only [Nat.cast_mul,Nat.cast_sub (show k≤n+2 by omega),
        Nat.cast_add,Nat.cast_one,Nat.cast_ofNat] using h
    have hn : (0:ℤ)<n+1 := by omega
    have hm : (0:ℤ)<n+2-k := by omega
    have hid : ((n+1:ℤ)*(n+2-k))*
        (((n+1).choose k : ℤ)^2-(n.choose k : ℤ)*(n+2).choose k)=
        (k:ℤ)*((n+1).choose k : ℤ)^2 := by
      linear_combination -((n+2).choose k : ℤ)*(n+2-k)*h1 +
        ((n+1).choose k : ℤ)*(n+1-k)*h2
    have hprod : 0≤((n+1:ℤ)*(n+2-k))*
        (((n+1).choose k : ℤ)^2-(n.choose k : ℤ)*(n+2).choose k) := by
      rw [hid]; positivity
    have := (mul_nonneg_iff_of_pos_left (mul_pos hn hm)).mp hprod
    linarith

theorem lc_product6 (a b c x y z : ℤ)
    (ha : 0≤a) (hc : 0≤c) (hy : 0≤y)
    (hab : a*c≤b^2) (hxy : x*z≤y^2) :
    (a*x)*(c*z)≤(b*y)^2 := by
  calc
    (a*x)*(c*z)=(a*c)*(x*z) := by ring
    _ ≤ (a*c)*y^2 := mul_le_mul_of_nonneg_left hxy (mul_nonneg ha hc)
    _ ≤ b^2*y^2 := mul_le_mul_of_nonneg_right hab (sq_nonneg _)
    _ = (b*y)^2 := by ring

#print axioms choose_upper_lc6
#print axioms lc_product6
end
end MathGKM.Markov
