import MarkovCurvature320f
/-! Machine-authored 320fe46f. Curvature of aggregated one-cut runs. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 2000000

theorem final_curvature_zero320 (w : ℕ → ℝ) (n : ℕ) :
 curvature320 (finalWeighted320 w n) 0=
 -(∑ k ∈ range n,w (k+1))-2*(if 1<n then w 2 else 0) := by
 simp only [finalWeighted320,curvature_sum320,curvature_weight320]
 have he (k : ℕ) : w (k+1)*curvature320 ((1+X)*resetPolyFe01 k) 0=
     -w (k+1)-2*(if k=1 then w (k+1) else 0) := by
   rw [smooth_reset_curvature320]
   split_ifs <;> (first | omega | ring)
 simp only [he,sum_sub_distrib,sum_neg_distrib,←mul_sum]
 simp

theorem final_curvature_succ320 (w : ℕ → ℝ) (n j : ℕ) :
 curvature320 (finalWeighted320 w n) (j+1)=
 -(if j=0 then ∑ k ∈ range n,w (k+1) else 0)-
 2*(if j+2<n then w (j+3) else 0)+2*(if j<n then w (j+1) else 0) := by
 simp only [finalWeighted320,curvature_sum320,curvature_weight320]
 have he (k : ℕ) : w (k+1)*curvature320 ((1+X)*resetPolyFe01 k) (j+1)=
     -(if j=0 then w (k+1) else 0)-
     2*(if k=j+2 then w (k+1) else 0)+2*(if k=j then w (k+1) else 0) := by
   rw [smooth_reset_curvature320]
   split_ifs <;> (first | omega | ring)
 simp only [he,sum_sub_distrib,sum_add_distrib,sum_neg_distrib,←mul_sum]
 simp [Finset.sum_ite_irrel,Nat.add_assoc]

theorem initial_curvature_zero320 (w : ℕ → ℝ) (n : ℕ) :
 curvature320 (initialWeighted320 w n) 0=
 -(∑ k ∈ range n,w (k+2))-(if 1<n then w 3 else 0)-
 (if 0<n then w 2 else 0)-w (n+1)-(if n=1 then w (n+1) else 0) := by
 simp only [initialWeighted320,curvature_add320,curvature_sum320,curvature_weight320]
 have he (k : ℕ) : w (k+2)*curvature320 ((1+X)*purePolyFe01 k) 0=
     -w (k+2)-(if k=1 then w (k+2) else 0)-(if k=0 then w (k+2) else 0) := by
   rw [smooth_pure_curvature320]
   split_ifs <;> (first | omega | ring)
 simp only [he,sum_sub_distrib,sum_neg_distrib,pure_curvature320]
 simp
 split_ifs <;> ring

theorem initial_curvature_succ320 (w : ℕ → ℝ) (n j : ℕ) :
 curvature320 (initialWeighted320 w n) (j+1)=
 -(if j=0 then ∑ k ∈ range n,w (k+2) else 0)-
 (if j+2<n then w (j+4) else 0)-(if j+1<n then w (j+3) else 0)+
 (if j<n then w (j+2) else 0)+(if 0<j ∧ j-1<n then w (j+1) else 0)-
 (if n=j+2 then w (n+1) else 0)+(if n=j then w (n+1) else 0) := by
 simp only [initialWeighted320,curvature_add320,curvature_sum320,curvature_weight320]
 have he (k : ℕ) : w (k+2)*curvature320 ((1+X)*purePolyFe01 k) (j+1)=
     -(if j=0 then w (k+2) else 0)-(if k=j+2 then w (k+2) else 0)-
     (if k=j+1 then w (k+2) else 0)+(if k=j then w (k+2) else 0)+
     (if 0<j ∧ k=j-1 then w (k+2) else 0) := by
   rw [smooth_pure_curvature320]
   split_ifs <;> (first | omega | ring)
 simp only [he,sum_sub_distrib,sum_add_distrib,sum_neg_distrib,pure_curvature320]
 have he2 : (if j+1=0 then (1:ℝ) else 0)=0 := by simp
 rw [he2]
 by_cases hj : j=0
 · subst j
   simp
   split_ifs <;> ring
 · have hjp : 0<j := by omega
   have hjn : j-1+2=j+1 := by omega
   simp [hj,hjp,hjn,Finset.sum_ite_irrel,Nat.add_assoc,
     show ∀n:ℕ,(j+1=n+1)↔n=j by omega]
   split_ifs <;> ring

#print axioms final_curvature_succ320
#print axioms initial_curvature_succ320
end
end MathGKM.Markov
