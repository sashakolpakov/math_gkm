import MarkovResidualEndpointsMEA423

/-! Machine-authored ea4238fc. Exact leading residual coefficients.
All factors are uniform polynomial factors, never coefficient normalization. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff

theorem binomial_degree_leMEA423 (n : ℕ) : ((1+X:ℤ[X])^n).natDegree≤n := by
 apply natDegree_le_iff_coeff_eq_zero.mpr
 intro k hk
 rw [coeff_one_add_X_pow,Nat.choose_eq_zero_of_lt hk]
 rfl

theorem cleared_leadingMEA423 (p q : ℤ[X]) (n m d e : ℕ)
 (hp : p.natDegree≤d) (hq : q.natDegree≤e)
 (hi : n+d=m+e) (he : (1+X)^n*p=(1+X)^m*q) : p.coeff d=q.coeff e := by
 have hc := congrArg (fun p : ℤ[X] => p.coeff (n+d)) he
 rw [coeff_mul_add_eq_of_natDegree_le (binomial_degree_leMEA423 n) hp] at hc
 rw [hi,coeff_mul_add_eq_of_natDegree_le (binomial_degree_leMEA423 m) hq] at hc
 simpa only [coeff_one_add_X_pow,Nat.choose_self,Nat.cast_one,one_mul] using hc

theorem horizontal_residual_leadingMEA423 (path : List Bool) (j : ℕ)
 (hj : j≤(frame path).mid.a+(frame path).mid.b-1) :
 (hresidualM511 (X:ℤ[X]) (sourceWord28 path) j).coeff (j+(frame path).mid.a)=
 (((frame path).mid.a+(frame path).mid.b-1).choose
   ((frame path).mid.a+(frame path).mid.b-1-j):ℤ) := by
 have hb : 1≤(frame path).mid.b := by have h:=frame_reduced path; omega
 have he := cleared_leadingMEA423 _ _ (2*j) ((frame path).mid.b-1)
   ((frame path).mid.a+(frame path).mid.b-1-j) (j+(frame path).mid.a)
   (horizontal_row_degreeMEA423 path j)
   (natDegree_le_iff_coeff_eq_zero.mpr (horizontal_residual_boundMEA423 path j))
   (by omega) (horizontal_all_order_clearedM511 path j)
 rw [swap_coeff46] at he
 rw [←he]
 exact top_raw_coeff1998 path _ j (by omega)

theorem vertical_residual_leadingMEA423 (path : List Bool) (i : ℕ)
 (hi : i≤(frame path).mid.a+(frame path).mid.b-1) :
 (vresidualM9E1 path i).coeff (i+(frame path).mid.b)=
 (((frame path).mid.a+(frame path).mid.b-1).choose i:ℤ) := by
 have ha : 1≤(frame path).mid.a := by have h:=frame_reduced path; omega
 have heq := vertical_all_order_clearedM9E1 path i
 simp only [add_comm X 1] at heq
 have he := cleared_leadingMEA423 _ _ (2*i) ((frame path).mid.a-1)
   ((frame path).mid.a+(frame path).mid.b-1-i) (i+(frame path).mid.b)
   (vertical_row_degreeMEA423 path i)
   (natDegree_le_iff_coeff_eq_zero.mpr (vertical_residual_boundMEA423 path i))
   (by omega) heq
 rw [←he]
 simpa only [coeff] using top_raw_coeff1998 path i
   ((frame path).mid.a+(frame path).mid.b-1-i) (by omega)

end
end MathGKM.Markov
