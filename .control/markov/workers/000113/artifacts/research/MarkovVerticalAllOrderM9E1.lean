import MarkovVerticalRescaleM9E1
import MarkovHorizontalResidualPositiveM511
/-! Machine-authored request 9e104e0c. All-order integral vertical residual,
its coefficient nonnegativity and exact raw factorization. No LC assertion. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
set_option linter.unusedSimpArgs false

def vresidualM9E1 (path : List Bool) (i : ℕ) : ℤ[X] :=
 (vdiffM9E1 (vKwordM9E1 (X:ℤ[X]) (sourceWord28 path))).coeff i

theorem vsub_coeffM9E1 (p : BiPoly) (i : ℕ) :
 (vsubM9E1 p).coeff i=(X+1)^(2*i)*p.coeff i := by
 induction p using Polynomial.induction_on' with
 | add p q hp hq => simp [map_add,Polynomial.coeff_add,hp,hq,mul_add]
 | monomial n c =>
   simp only [vsubM9E1,coe_eval₂RingHom,eval₂_monomial,mul_pow,←map_pow,←map_mul]
   rw [←mul_assoc,←map_mul,Polynomial.coeff_C_mul_X_pow]
   simp only [Polynomial.coeff_monomial]
   by_cases h : n=i
   · subst n
     have hp : ((X+1:ℤ[X])^2)^i=(X+1)^(2*i) := (pow_mul (X+1) 2 i).symm
     simp [hp,mul_comm]
   · simp [h,Ne.symm h]

theorem vertical_all_order_clearedM9E1 (path : List Bool) (i : ℕ) :
 (X+1)^(2*i)*((frame path).mid.p).coeff i=
 (X+1)^((frame path).mid.a-1)*vresidualM9E1 path i := by
 have h := congrArg (fun p : BiPoly => p.coeff i) (vertical_rescaled_sourceM9E1 path)
 simpa only [vsub_coeffM9E1,←map_pow,Polynomial.coeff_C_mul,vresidualM9E1] using h

theorem vertical_all_order_factorM9E1 (path : List Bool) (i : ℕ)
 (ha : 2*i+1 ≤ (frame path).mid.a) :
 ((frame path).mid.p).coeff i=
 (X+1)^((frame path).mid.a-2*i-1)*vresidualM9E1 path i := by
 have h := vertical_all_order_clearedM9E1 path i
 have hn : (X+1:ℤ[X])≠0 := by simpa using X_add_C_ne_zero (1:ℤ)
 apply mul_left_cancel₀ (pow_ne_zero (2*i) hn)
 have he : (X+1:ℤ[X])^((frame path).mid.a-1)=
   (X+1)^(2*i)*(X+1)^((frame path).mid.a-2*i-1) := by
   rw [←pow_add]; congr 1; omega
 rw [he,mul_assoc] at h
 exact h

theorem vKa_nonnegM9E1 : MatNonneg16 (vKaM9E1 (X:ℤ[X])) := by
 have hu := poly_U_nonneg16
 have hv := poly_V_nonneg16
 have hh : PolyNonneg16 (C (X+1)) := by
   simpa only [V,map_add,map_one] using poly_add_nonneg16 hv poly_one_nonneg16
 change PolyNonneg16 (V*(1+C (X+1)*U)) ∧ PolyNonneg16 (2+C (X+1)*U) ∧
   PolyNonneg16 (V*C (X+1)*U) ∧ PolyNonneg16 (1+C (X+1)*U)
 refine ⟨?_,?_,?_,?_⟩
 all_goals repeat' first
 | exact hu
 | exact hv
 | exact hh
 | exact poly_one_nonneg16
 | exact poly_nat_nonnegM511 _
 | apply poly_add_nonneg16
 | apply poly_mul_nonneg16

theorem vKc_nonnegM9E1 : MatNonneg16 (vKcM9E1 (X:ℤ[X])) := by
 change PolyNonneg16 (1+V*U) ∧ PolyNonneg16 U ∧ PolyNonneg16 (V*U) ∧ PolyNonneg16 U
 have h := poly_mul_nonneg16 poly_V_nonneg16 poly_U_nonneg16
 exact ⟨poly_add_nonneg16 poly_one_nonneg16 h,poly_U_nonneg16,h,poly_U_nonneg16⟩

theorem vKletter_nonnegM9E1 (r : Bool) : MatNonneg16 (vKletterM9E1 (X:ℤ[X]) r) := by
 cases r
 · exact vKa_nonnegM9E1
 · exact mat_mul_nonneg16 vKa_nonnegM9E1 vKc_nonnegM9E1

theorem vKword_nonnegM9E1 (w : List Bool) : MatNonneg16 (vKwordM9E1 (X:ℤ[X]) w) := by
 induction w with
 | nil =>
   change PolyNonneg16 1 ∧ PolyNonneg16 0 ∧ PolyNonneg16 0 ∧ PolyNonneg16 1
   exact ⟨poly_one_nonneg16,by simpa using poly_nat_nonnegM511 0,
     by simpa using poly_nat_nonnegM511 0,poly_one_nonneg16⟩
 | cons r rs ih => exact mat_mul_nonneg16 (vKletter_nonnegM9E1 r) ih

theorem vdiff_source_nonnegM9E1 (path : List Bool) :
 PolyNonneg16 (vdiffM9E1 (vKwordM9E1 (X:ℤ[X]) (sourceWord28 path))) := by
 rw [sourceWord_central28]
 change PolyNonneg16 (vdiffM9E1
   (mm16 (vKaM9E1 (X:ℤ[X])) (vKwordM9E1 X (central28 path++[true]))))
 rw [vdiff_firstM9E1]
 obtain ⟨ha,hb,hc,hd⟩ := vKword_nonnegM9E1 (central28 path++[true])
 exact poly_add_nonneg16 (poly_mul_nonneg16 poly_V_nonneg16 (poly_add_nonneg16 ha hb))
   (poly_add_nonneg16 hc hd)

theorem vresidual_coeff_nonnegM9E1 (path : List Bool) (i j : ℕ) :
 0 ≤ (vresidualM9E1 path i).coeff j := vdiff_source_nonnegM9E1 path i j

theorem vertical_positive_factorM9E1 (path : List Bool) (i : ℕ) :
 ∃ Q : ℤ[X], (∀ j, 0 ≤ Q.coeff j) ∧
 ((frame path).mid.p).coeff i=(X+1)^((frame path).mid.a-2*i-1)*Q := by
 by_cases ha : 2*i+1 ≤ (frame path).mid.a
 · exact ⟨vresidualM9E1 path i,vresidual_coeff_nonnegM9E1 path i,
     vertical_all_order_factorM9E1 path i ha⟩
 · have he : (frame path).mid.a-2*i-1=0 := by omega
   refine ⟨((frame path).mid.p).coeff i,?_,by simp [he]⟩
   intro j
   exact raw_coeff_nonneg18 path i j

end
end MathGKM.Markov
