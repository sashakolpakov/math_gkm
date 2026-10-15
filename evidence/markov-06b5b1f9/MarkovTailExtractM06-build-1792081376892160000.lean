import Mathlib
/-! Machine-authored 06b5b1f9. Exact polynomial tail transport. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
theorem tail_coeff_of_clearedM06 (P R L : ℤ[X]) (m k : ℕ)
 (h : (1-X)^8*(P-X^m*R)=L) (hd : L.natDegree ≤ m+7) :
 P.coeff (m+k)=R.coeff k := by
 have hb : ((1-X)^8 : ℤ[X]).natDegree=8 := by compute_degree!
 have hn : ((1-X)^8 : ℤ[X])≠0 := by
   intro hz
   rw [hz, natDegree_zero] at hb
   omega
 have he : (P-X^m*R).coeff (m+k)=0 := by
   by_cases hz : P-X^m*R=0
   · rw [hz]; exact coeff_zero _
   · have hd' := natDegree_mul hn hz
     rw [h,hb] at hd'
     apply coeff_eq_zero_of_natDegree_lt
     omega
 rw [coeff_sub, add_comm m k, coeff_X_pow_mul] at he
 exact sub_eq_zero.mp he

theorem tail_coeff_four_blocksM06 (P H0 H1 H2 H3 H4 R L : ℤ[X])
 (n k : ℕ) (hn : 7≤n)
 (h : (1-X)^8*P=H0+X^n*H1+X^(2*n)*H2+X^(3*n)*H3+X^(4*n)*H4)
 (h4 : H4=(1-X)^8*R+L)
 (h0d : H0.natDegree≤12) (h1d : H1.natDegree≤12)
 (h2d : H2.natDegree≤13) (h3d : H3.natDegree≤14) (hld : L.natDegree≤7) :
 P.coeff (4*n+k)=R.coeff k := by
 apply tail_coeff_of_clearedM06 P R
   (H0+X^n*H1+X^(2*n)*H2+X^(3*n)*H3+X^(4*n)*L) (4*n) k
 · rw [mul_sub,h,h4]
   ring
 · compute_degree
   omega
end
end MathGKM.Markov
