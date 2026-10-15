import MarkovBackwardGeneralM94
import MarkovBlockSourceCC
/-! Machine-authored 1b02dddc. Exact two-block backwards extraction, including zero terms. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem convSeven_shift_guardM1B (P : ℤ[X]) (n j : ℕ) :
 convSevenK0B (X^n*P) j = if n≤j then convSevenK0B P (j-n) else 0 := by
 by_cases h : n≤j
 · rw [if_pos h,show j=n+(j-n) by omega,convSeven_shiftCC]
   congr 1
   omega
 · rw [if_neg h]
   unfold convSevenK0B
   apply Finset.sum_eq_zero
   intro k hk
   rw [coeff_X_pow_mul',if_neg (by have := Finset.mem_range.mp hk; omega),zero_mul]

theorem backward_two_coeffM1B (P L H3 H4 : ℤ[X]) (n j : ℕ)
 (hj : j≤4*n+7) (hL : L.natDegree≤j+7)
 (h3 : H3.natDegree≤14) (h4 : H4.natDegree≤15)
 (h : (1-X)^8*P=L+X^(3*n)*H3+X^(4*n)*H4) :
 P.coeff j=convSevenK0B (reflect 15 H4) (4*n+7-j)+
   if j≤3*n+6 then convSevenK0B (reflect 14 H3) (3*n+6-j) else 0 := by
 have he : (1-X)^8*P=L+X^(3*n)*(H3+X^n*H4) := by
   rw [h,show 4*n=3*n+n by omega,pow_add]
   ring
 have hh := backward_coeff_generalM94 P L (H3+X^n*H4) (3*n) (n+7) j
   (by omega) hL (by compute_degree; omega) he
 have hr3 : reflect (n+15) H3=X^(n+1)*reflect 14 H3 := by
   have hr := reflect_mul (1:ℤ[X]) H3 (F:=n+1) (G:=14) (by simp) h3
   simpa only [one_mul,reflect_one,show n+1+14=n+15 by omega] using hr
 have hr4 : reflect (n+15) (X^n*H4)=reflect 15 H4 := by
   rw [reflect_mul _ _ (by compute_degree) h4]
   simp [reflect_monomial]
 change P.coeff j=convSevenK0B (reflect (n+7+8) (H3+X^n*H4)) (3*n+(n+7)-j) at hh
 rw [show n+7+8=n+15 by omega,show 3*n+(n+7)=4*n+7 by omega,
   reflect_add,hr3,hr4,convSeven_addK0B,convSeven_shift_guardM1B] at hh
 by_cases hj3 : j≤3*n+6
 · rw [if_pos hj3,if_pos (by omega : n+1≤4*n+7-j),
     show 4*n+7-j-(n+1)=3*n+6-j by omega] at *
   linarith only [hh]
 · rw [if_neg hj3,if_neg (by omega : ¬n+1≤4*n+7-j)] at *
   linarith only [hh]
end
end MathGKM.Markov
