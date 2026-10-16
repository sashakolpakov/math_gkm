import MarkovHorizontalIntervalMEA423
import MarkovVerticalIntervalMEA423

/-! Machine-authored ea4238fc. Exact residual endpoints and the reverse
factorization range. The latter cannot be used to cancel log-concavity. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff

theorem horizontal_row_degreeMEA423 (path : List Bool) (j : ℕ) :
 ((Bivariate.swap (frame path).mid.p).coeff j).natDegree ≤
 (frame path).mid.a+(frame path).mid.b-1-j := by
 apply natDegree_le_iff_coeff_eq_zero.mpr
 intro k hk
 rw [swap_coeff46]
 exact raw_outside_polygon18 path k j (by intro h; have ht:=h.2; omega)

theorem vertical_row_degreeMEA423 (path : List Bool) (i : ℕ) :
 ((frame path).mid.p.coeff i).natDegree ≤ (frame path).mid.a+(frame path).mid.b-1-i := by
 apply natDegree_le_iff_coeff_eq_zero.mpr
 intro k hk
 exact raw_outside_polygon18 path i k (by intro h; have ht:=h.2; omega)

theorem horizontal_residual_zero_iffMEA423 (path : List Bool) (j : ℕ) :
 hresidualM511 (X:ℤ[X]) (sourceWord28 path) j=0 ↔
 (frame path).mid.a+(frame path).mid.b-1 < j := by
 constructor
 · intro hz
   by_contra hn
   exact horizontal_residual_ne_zeroMEA423 path j (by omega) hz
 · intro hj
   have hp : (Bivariate.swap (frame path).mid.p).coeff j=0 := by
     ext k
     rw [swap_coeff46]
     exact raw_outside_polygon18 path k j (by intro h; have ht:=h.2; omega)
   have he := horizontal_all_order_clearedM511 path j
   rw [hp,mul_zero] at he
   have hn : (1+X:ℤ[X])≠0 := by
     simpa [add_comm] using X_add_C_ne_zero (1:ℤ)
   exact (mul_eq_zero.mp he.symm).resolve_left (pow_ne_zero _ hn)

theorem vertical_residual_zero_iffMEA423 (path : List Bool) (i : ℕ) :
 vresidualM9E1 path i=0 ↔ (frame path).mid.a+(frame path).mid.b-1 < i := by
 constructor
 · intro hz
   by_contra hn
   exact vertical_residual_ne_zeroMEA423 path i (by omega) hz
 · intro hi
   have hp : (frame path).mid.p.coeff i=0 := by
     ext k
     exact raw_outside_polygon18 path i k (by intro h; have ht:=h.2; omega)
   have he := vertical_all_order_clearedM9E1 path i
   rw [hp,mul_zero] at he
   have hn : (X+1:ℤ[X])≠0 := by simpa using X_add_C_ne_zero (1:ℤ)
   exact (mul_eq_zero.mp he.symm).resolve_left (pow_ne_zero _ hn)

theorem horizontal_residual_degreeMEA423 (path : List Bool) (j : ℕ)
 (hj : j≤(frame path).mid.a+(frame path).mid.b-1) :
 (hresidualM511 (X:ℤ[X]) (sourceWord28 path) j).natDegree=j+(frame path).mid.a := by
 apply le_antisymm
 · exact natDegree_le_iff_coeff_eq_zero.mpr (horizontal_residual_boundMEA423 path j)
 · exact le_natDegree_of_ne_zero (ne_of_gt (horizontal_residual_top_positiveMEA423 path j hj))

theorem vertical_residual_degreeMEA423 (path : List Bool) (i : ℕ)
 (hi : i≤(frame path).mid.a+(frame path).mid.b-1) :
 (vresidualM9E1 path i).natDegree=i+(frame path).mid.b := by
 apply le_antisymm
 · exact natDegree_le_iff_coeff_eq_zero.mpr (vertical_residual_boundMEA423 path i)
 · exact le_natDegree_of_ne_zero (ne_of_gt (vertical_residual_top_positiveMEA423 path i hi))

theorem horizontal_residual_high_factorMEA423 (path : List Bool) (j : ℕ)
 (hj : (frame path).mid.b≤2*j+1) :
 hresidualM511 (X:ℤ[X]) (sourceWord28 path) j=
 (1+X)^(2*j+1-(frame path).mid.b)*(Bivariate.swap (frame path).mid.p).coeff j := by
 have he := horizontal_all_order_clearedM511 path j
 have hb : 1≤(frame path).mid.b := by have h:=frame_reduced path; omega
 have hn : (1+X:ℤ[X])≠0 := by simpa [add_comm] using X_add_C_ne_zero (1:ℤ)
 have hp : (1+X:ℤ[X])^(2*j)=(1+X)^((frame path).mid.b-1)*
   (1+X)^(2*j+1-(frame path).mid.b) := by
   rw [←pow_add]; congr 1; omega
 rw [hp,mul_assoc] at he
 exact (mul_left_cancel₀ (pow_ne_zero _ hn) he).symm

theorem vertical_residual_high_factorMEA423 (path : List Bool) (i : ℕ)
 (hi : (frame path).mid.a≤2*i+1) :
 vresidualM9E1 path i=(X+1)^(2*i+1-(frame path).mid.a)*(frame path).mid.p.coeff i := by
 have he := vertical_all_order_clearedM9E1 path i
 have ha : 1≤(frame path).mid.a := by have h:=frame_reduced path; omega
 have hn : (X+1:ℤ[X])≠0 := by simpa using X_add_C_ne_zero (1:ℤ)
 have hp : (X+1:ℤ[X])^(2*i)=(X+1)^((frame path).mid.a-1)*
   (X+1)^(2*i+1-(frame path).mid.a) := by
   rw [←pow_add]; congr 1; omega
 rw [hp,mul_assoc] at he
 exact (mul_left_cancel₀ (pow_ne_zero _ hn) he).symm

end
end MathGKM.Markov
