import MarkovSecondColumn3556

/-! Machine-authored request 3556cd95. Power-series coefficient extraction;
the series is an exact algebraic tool, with no analytic convergence premise. -/
namespace MathGKM.Markov
noncomputable section

def invFourth3556 : PowerSeries ℤ := PowerSeries.mk (fun n => ((3+n).choose 3:ℤ))
def cubicSeries3556 : PowerSeries ℤ := invFourth3556*(1+PowerSeries.X)

theorem cubicSeries_coeff3556 (j : ℕ) :
    6*PowerSeries.coeff j cubicSeries3556=(j+1:ℤ)*(j+2)*(2*j+3) := by
  have hc (n : ℕ) : 6*((n+3).choose 3:ℤ)=(n+1:ℤ)*(n+2)*(n+3) := by
    have h := congrArg (fun x : ℕ => (x:ℤ)) (Nat.ascFactorial_eq_factorial_mul_choose n 3)
    norm_num [Nat.ascFactorial_succ] at h
    nlinarith [h]
  cases j with
  | zero => norm_num [cubicSeries3556,invFourth3556,PowerSeries.coeff_mul,
      Finset.Nat.antidiagonal_zero,PowerSeries.coeff_mk]
  | succ j =>
    have hx : PowerSeries.coeff (j+1) (invFourth3556*PowerSeries.X)=PowerSeries.coeff j invFourth3556 := by
      simpa using PowerSeries.coeff_mul_X_pow invFourth3556 j 1
    simp only [cubicSeries3556,mul_add,mul_one,map_add]
    rw [hx]
    simp only [invFourth3556,PowerSeries.coeff_mk]
    have h0 := hc j
    have h1 := hc (j+1)
    rw [show 3+(j+1)=j+1+3 by omega,show 3+j=j+3 by omega]
    push_cast at h1 ⊢
    nlinarith [h0,h1]

theorem second_column_series3556 (q : ℕ) :
    ((twoSquare3556 q).coeff 2 : PowerSeries ℤ)=
      cubicSeries3556-8*PowerSeries.X^(q+1)*cubicSeries3556+
      PowerSeries.X^(2*q+1)*(invFourth3556*(columnTail3556 q : PowerSeries ℤ)) := by
  have hh := congrArg (fun p : Polynomial ℤ => (p:PowerSeries ℤ))
    (second_column_cleared3556 q)
  simp only [Polynomial.coe_mul,Polynomial.coe_pow,Polynomial.coe_sub,
    Polynomial.coe_one,Polynomial.coe_X,Polynomial.coe_add] at hh
  have h8 : ((8:Polynomial ℤ):PowerSeries ℤ)=8 := map_ofNat Polynomial.coeToPowerSeries.ringHom 8
  rw [h8] at hh
  have hi : invFourth3556*(1-PowerSeries.X)^4=1 :=
    PowerSeries.mk_add_choose_mul_one_sub_pow_eq_one ℤ 3
  calc
    ((twoSquare3556 q).coeff 2 : PowerSeries ℤ)=
        invFourth3556*((1-PowerSeries.X)^4*((twoSquare3556 q).coeff 2 : PowerSeries ℤ)) := by rw [← mul_assoc,hi,one_mul]
    _ = _ := by rw [hh]; unfold cubicSeries3556; ring

theorem second_column_low3556 (q j : ℕ) (hj : j≤2*q) :
    6*coeff (twoSquare3556 q) 2 j=
      (j+1:ℤ)*(j+2)*(2*j+3)-
      if q+1≤j then 8*((j-q-1:ℕ)+1:ℤ)*((j-q-1:ℕ)+2)*(2*((j-q-1:ℕ):ℤ)+3) else 0 := by
  have hh := congrArg (PowerSeries.coeff j) (second_column_series3556 q)
  simp only [Polynomial.coeff_coe,map_add,map_sub] at hh
  have hz : ¬2*q+1≤j := by omega
  rw [PowerSeries.coeff_X_pow_mul',if_neg hz,add_zero] at hh
  have he : (8:PowerSeries ℤ)*PowerSeries.X^(q+1)*cubicSeries3556=
      PowerSeries.X^(q+1)*(PowerSeries.C 8*cubicSeries3556) := by simp; ring
  rw [he,PowerSeries.coeff_X_pow_mul'] at hh
  split_ifs at hh ⊢ with h
  · rw [PowerSeries.coeff_C_mul] at hh
    have h0 := cubicSeries_coeff3556 j
    have h1 := cubicSeries_coeff3556 (j-(q+1))
    have heq : j-(q+1)=j-q-1 := by omega
    rw [heq] at hh h1
    unfold coeff
    linear_combination 6*hh+h0-8*h1
  · have h0 := cubicSeries_coeff3556 j
    unfold coeff
    linear_combination 6*hh+h0

#print axioms second_column_low3556
end
end MathGKM.Markov
