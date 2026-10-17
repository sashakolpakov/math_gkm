import MarkovTopTemplateMB3E
/-! Machine-authored b3eed364. An exact upper-template sum, derived by
finite polynomial recurrences; no analytic or Lagrange-inversion premise. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 6000000

theorem top_delta_zeroMB3E (n : ℕ) : topDiagonalDeltaMB3E n 0=1 := by
 simp [topDiagonalDeltaMB3E,top_delta_topMB3E]

theorem fib_rows_succMB3E (n j : ℕ) :
 fibRowsMC3E (n+2) (j+1)=(X+1)*fibRowsMC3E (n+1) (j+1)+
 fibRowsMC3E (n+1) j-fibRowsMC3E n j := by
 rw [fib_rows_recMC3E]
 simp [rowSMFFD,rowShiftMFFD]
 ring

theorem top_delta_parameterMB3E (n t : ℕ) (ht : t ≤ n) :
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

theorem top_template_parameterMB3E (n t : ℕ) (ht : t ≤ n) :
 topTemplateMB3E (n+2) (t+1)+topTemplateMB3E n t=
 topTemplateMB3E (n+1) (t+1)+(X+1)*topTemplateMB3E (n+1) t := by
 induction t using Nat.strong_induction_on with
 | h t ih =>
   rcases t with _|_|t
   · have h := top_delta_parameterMB3E n 0 (by omega)
     simp only [topTemplateMB3E,top_delta_zeroMB3E] at *
     linear_combination h
   · have h0 := top_delta_parameterMB3E n 0 (by omega)
     have h1 := top_delta_parameterMB3E n 1 ht
     simp only [topTemplateMB3E,top_delta_zeroMB3E] at *
     linear_combination h1+4*h0
   · have h0 := top_delta_parameterMB3E n t (by omega)
     have h1 := top_delta_parameterMB3E n (t+1) (by omega)
     have h2 := top_delta_parameterMB3E n (t+2) ht
     have ih0 := ih t (by omega) (by omega)
     have ih1 := ih (t+1) (by omega) (by omega)
     simp only [topTemplateMB3E] at ih0 ih1 ⊢
     linear_combination h2+2*(X+1)*h1+(X+1)^2*h0+
       2*(1-X)*ih1-(X+1)^2*ih0

theorem top_diagonal_equationMB3E (n t : ℕ) (ht : t ≤ n) :
 topTemplateMB3E (n+4) (t+2)-2*topTemplateMB3E (n+2) (t+1)+topTemplateMB3E n t=
 topDiagonalDeltaMB3E (n+4) (t+2)+2*topDiagonalDeltaMB3E (n+2) (t+1)+
 topDiagonalDeltaMB3E n t := by
 have hh := row_diagonal_operatorMDAB topTemplateMB3E n t
   (top_template_parameterMB3E n t ht)
   (top_template_parameterMB3E (n+1) t (by omega))
   (top_template_parameterMB3E (n+1) (t+1) (by omega))
   (top_template_parameterMB3E (n+2) (t+1) (by omega))
 have hd := row_diagonal_operatorMDAB topDiagonalDeltaMB3E n t
   (top_delta_parameterMB3E n t ht)
   (top_delta_parameterMB3E (n+1) t (by omega))
   (top_delta_parameterMB3E (n+1) (t+1) (by omega))
   (top_delta_parameterMB3E (n+2) (t+1) (by omega))
 rw [topTemplateMB3E] at hh
 linear_combination hh-hd

theorem top_diagonal_sumMB3E (d t : ℕ) :
 topTemplateMB3E (2*t+d) t=topDiagonalDeltaMB3E (2*t+d) t+
 4*doublePrefixMDAB (fun s => topDiagonalDeltaMB3E (2*s+d) s) t := by
 induction t using Nat.twoStepInduction with
 | zero => simp [topTemplateMB3E,top_delta_zeroMB3E,doublePrefixMDAB]
 | one => simp [topTemplateMB3E,doublePrefixMDAB,top_delta_zeroMB3E]
 | more t h0 h1 =>
   have he := top_diagonal_equationMB3E (2*t+d) t (by omega)
   rw [show 2*t+d+4=2*(t+2)+d by omega,
     show 2*t+d+2=2*(t+1)+d by omega,h0,h1] at he
   have hp := doublePrefix_secondMDAB (fun s => topDiagonalDeltaMB3E (2*s+d) s) t
   linear_combination he-4*hp

theorem top_template_sumMB3E (n t : ℕ) (hn : 2*t ≤ n) :
 topTemplateMB3E n t=topDiagonalDeltaMB3E n t+
 4*∑ s ∈ range t, C (t-s:ℤ)*topDiagonalDeltaMB3E (n-2*t+2*s) s := by
 have h := top_diagonal_sumMB3E (n-2*t) t
 rw [show 2*t+(n-2*t)=n by omega] at h
 convert h using 2
 unfold doublePrefixMDAB
 congr 1
 apply sum_congr rfl
 intro s hs
 rw [show n-2*t+2*s=2*s+(n-2*t) by omega]

end
end MathGKM.Markov
