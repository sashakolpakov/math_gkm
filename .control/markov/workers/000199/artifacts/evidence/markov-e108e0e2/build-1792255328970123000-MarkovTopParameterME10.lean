import MarkovTopFiveFormulaME87
/-! Machine-authored e108e0e2. Exact template recurrence through central offsets. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 8000000
attribute [local irreducible] topDiagonalDeltaMB3E topTemplateMB3E
theorem top_delta_parameterME10 (n t : ℕ) (ht : t ≤ n+2) :
 topDiagonalDeltaMB3E (n+2) (t+1)+topDiagonalDeltaMB3E n t=
 topDiagonalDeltaMB3E (n+1) (t+1)+(X+1)*topDiagonalDeltaMB3E (n+1) t := by
 have hh (l : ℕ) := fib_rows_succMB3E (n+l) (n+2-t)
 have h0 := hh 0
 have h1 := hh 1
 have h2 := hh 2
 simp only [Nat.add_zero] at h0
 unfold topDiagonalDeltaMB3E topDeltaMB3E
 simp only [show n+2+2-(t+1)=n+2-t+1 by omega,
   show n+1+2-(t+1)=n+2-t by omega,
   show n+1+2-t=n+2-t+1 by omega]
 simp only [Nat.add_assoc] at h0 h1 h2 ⊢
 linear_combination h2-2*h1+h0

theorem top_template_parameterME10 (n t : ℕ) (ht : t ≤ n+2) :
 topTemplateMB3E (n+2) (t+1)+topTemplateMB3E n t=
 topTemplateMB3E (n+1) (t+1)+(X+1)*topTemplateMB3E (n+1) t := by
 induction t using Nat.strong_induction_on with
 | h t ih =>
   rcases t with _|_|t
   · have h := top_delta_parameterME10 n 0 (by omega)
     simp only [Nat.reduceAdd,topTemplateMB3E,top_delta_zeroMB3E] at *
     linear_combination h
   · have h0 := top_delta_parameterME10 n 0 (by omega)
     have h1 := top_delta_parameterME10 n 1 ht
     simp only [Nat.reduceAdd,topTemplateMB3E,top_delta_zeroMB3E] at *
     linear_combination h1+4*h0
   · have h0 := top_delta_parameterME10 n t (by omega)
     have h1 := top_delta_parameterME10 n (t+1) (by omega)
     have h2 := top_delta_parameterME10 n (t+2) ht
     have ih0 := ih t (by omega) (by omega)
     have ih1 := ih (t+1) (by omega) (by omega)
     simp only [topTemplateMB3E] at ih0 ih1 ⊢
     linear_combination h2+2*(X+1)*h1+(X+1)^2*h0+
       2*(1-X)*ih1-(X+1)^2*ih0

theorem top_diagonal_equationME10 (n t : ℕ) (ht : t ≤ n+2) :
 topTemplateMB3E (n+4) (t+2)-2*topTemplateMB3E (n+2) (t+1)+topTemplateMB3E n t=
 topDiagonalDeltaMB3E (n+4) (t+2)+2*topDiagonalDeltaMB3E (n+2) (t+1)+
 topDiagonalDeltaMB3E n t := by
 have hh := row_diagonal_operatorMDAB topTemplateMB3E n t
   (top_template_parameterME10 n t ht)
   (top_template_parameterME10 (n+1) t (by omega))
   (top_template_parameterME10 (n+1) (t+1) (by omega))
   (top_template_parameterME10 (n+2) (t+1) (by omega))
 have hd := row_diagonal_operatorMDAB topDiagonalDeltaMB3E n t
   (top_delta_parameterME10 n t ht)
   (top_delta_parameterME10 (n+1) t (by omega))
   (top_delta_parameterME10 (n+1) (t+1) (by omega))
   (top_delta_parameterME10 (n+2) (t+1) (by omega))
 have he : topTemplateMB3E (n+2) (t+2)=
   topDiagonalDeltaMB3E (n+2) (t+2)+2*(X+1)*topDiagonalDeltaMB3E (n+2) (t+1)+
   (X+1)^2*topDiagonalDeltaMB3E (n+2) t-
   2*(X-1)*topTemplateMB3E (n+2) (t+1)-(X+1)^2*topTemplateMB3E (n+2) t := by
   rw [topTemplateMB3E]
 rw [he] at hh
 linear_combination hh-hd


end
end MathGKM.Markov
