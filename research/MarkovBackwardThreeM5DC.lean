import MarkovReflectBlocksM1B
/-! Machine-authored request 5dc9c88d. Three reflected blocks with exact guarded shifts. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem backward_three_coeffM5DC (P H0 H1 H2 H3 H4 : ℤ[X]) (n j : ℕ)
 (hj : n+5≤j) (hju : j≤4*n+7)
 (h0 : H0.natDegree≤12) (h1 : H1.natDegree≤12) (h2 : H2.natDegree≤13)
 (h3 : H3.natDegree≤14) (h4 : H4.natDegree≤15)
 (h : (1-X)^8*P=H0+X^n*H1+X^(2*n)*H2+X^(3*n)*H3+X^(4*n)*H4) :
 P.coeff j=convSevenK0B (reflect 15 H4) (4*n+7-j)+
  (if j≤3*n+6 then convSevenK0B (reflect 14 H3) (3*n+6-j) else 0)+
  (if j≤2*n+5 then convSevenK0B (reflect 13 H2) (2*n+5-j) else 0) := by
 have hb := backward_five_blocksM1B P H0 H1 H2 H3 H4 n j hju h0 h1 h2 h3 h4 h
 simp only [convSeven_addK0B,convSeven_shift_guardM1B] at hb
 rw [if_neg (by omega : ¬4*n+3≤4*n+7-j),
     if_neg (by omega : ¬3*n+3≤4*n+7-j)] at hb
 by_cases hj2 : j≤2*n+5 <;> by_cases hj3 : j≤3*n+6
 · rw [if_pos hj2,if_pos hj3]
   rw [if_pos (by omega : 2*n+2≤4*n+7-j),if_pos (by omega : n+1≤4*n+7-j),
     show 4*n+7-j-(2*n+2)=2*n+5-j by omega,
     show 4*n+7-j-(n+1)=3*n+6-j by omega] at hb
   linarith only [hb]
 · omega
 · rw [if_neg hj2,if_pos hj3]
   rw [if_neg (by omega : ¬2*n+2≤4*n+7-j),if_pos (by omega : n+1≤4*n+7-j),
     show 4*n+7-j-(n+1)=3*n+6-j by omega] at hb
   linarith only [hb]
 · rw [if_neg hj2,if_neg hj3]
   rw [if_neg (by omega : ¬2*n+2≤4*n+7-j),if_neg (by omega : ¬n+1≤4*n+7-j)] at hb
   linarith only [hb]
end
end MathGKM.Markov
