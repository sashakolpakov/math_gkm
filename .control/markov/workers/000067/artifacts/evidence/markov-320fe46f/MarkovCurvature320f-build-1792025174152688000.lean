import MarkovWeightedOne320f
/-! Machine-authored 320fe46f. Linear coefficient concavity certificates. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 3000000

def curvature320 (p : ℝ[X]) (j : ℕ) : ℝ :=
 p.coeff j-2*p.coeff (j+1)+p.coeff (j+2)

theorem curvature_add320 (p q : ℝ[X]) (j : ℕ) :
 curvature320 (p+q) j=curvature320 p j+curvature320 q j := by
 simp [curvature320]; ring

theorem curvature_weight320 (a : ℝ) (p : ℝ[X]) (j : ℕ) :
 curvature320 (C a*p) j=a*curvature320 p j := by
 simp [curvature320]; ring

theorem curvature_sum320 (n j : ℕ) (p : ℕ → ℝ[X]) :
 curvature320 (∑ k ∈ range n,p k) j=∑ k ∈ range n,curvature320 (p k) j := by
 induction n with
 | zero => simp [curvature320]
 | succ n ih => simp [sum_range_succ,curvature_add320,ih]

theorem reset_curvature320 (n j : ℕ) :
 curvature320 (resetPolyFe01 n) j=
 -(if j=0 then 1 else 0)-2*(if n=j+1 then 1 else 0)+2*(if n=j then 1 else 0) := by
 simp only [curvature320,reset_coeff9c20]
 rcases (show n+2<j ∨ n+2=j ∨ n+1=j ∨ n=j ∨ n=j+1 ∨ j+2≤n by omega) with h|h|h|h|h|h <;>
   by_cases hj0 : j=0 <;> by_cases hj1 : j=1 <;>
   simp (disch := omega) [hj0,hj1] <;> ring

theorem pure_curvature320 (n j : ℕ) :
 curvature320 (purePolyFe01 n) j=
 -(if j=0 then 1 else 0)-(if n=j+1 then 1 else 0)+(if j=n+1 then 1 else 0) := by
 simp only [curvature320,pure_coeff9c20]
 rcases (show n+2<j ∨ n+2=j ∨ n+1=j ∨ n=j ∨ n=j+1 ∨ j+2≤n by omega) with h|h|h|h|h|h <;>
   by_cases hj0 : j=0 <;> by_cases hj1 : j=1 <;>
   simp (disch := omega) [hj0,hj1] <;> ring

theorem smooth_reset_curvature320 (n j : ℕ) :
 curvature320 ((1+X)*resetPolyFe01 n) j=
 -(if j=0 then 1 else 0)-(if j=1 then 1 else 0)-
 2*(if n=j+1 then 1 else 0)+2*(if j=n+1 then 1 else 0) := by
 simp only [curvature320,smooth_coeff9c20,reset_coeff9c20]
 rcases (show n+2<j ∨ n+2=j ∨ n+1=j ∨ n=j ∨ n=j+1 ∨ j+2≤n by omega) with h|h|h|h|h|h <;>
   by_cases hj0 : j=0 <;> by_cases hj1 : j=1 <;>
   simp (disch := omega) [hj0,hj1] <;> ring

theorem smooth_pure_curvature320 (n j : ℕ) :
 curvature320 ((1+X)*purePolyFe01 n) j=
 -(if j=0 then 1 else 0)-(if j=1 then 1 else 0)-
 (if n=j+1 then 1 else 0)-(if n=j then 1 else 0)+
 (if j=n+1 then 1 else 0)+(if j=n+2 then 1 else 0) := by
 simp only [curvature320,smooth_coeff9c20,pure_coeff9c20]
 rcases (show n+2<j ∨ n+2=j ∨ n+1=j ∨ n=j ∨ n=j+1 ∨ j+2≤n by omega) with h|h|h|h|h|h <;>
   by_cases hj0 : j=0 <;> by_cases hj1 : j=1 <;>
   simp (disch := omega) [hj0,hj1] <;> ring

theorem weighted_hit320 (w : ℕ → ℝ) (n t a : ℕ) :
 (∑ k ∈ range n,w (k+a)*(if k=t then 1 else 0))=
 if t<n then w (t+a) else 0 := by simp

theorem final_curvature_zero320 (w : ℕ → ℝ) (n : ℕ) :
 curvature320 (finalWeighted320 w n) 0=
 -(∑ k ∈ range n,w (k+1))-2*(if 1<n then w 2 else 0) := by
 simp only [finalWeighted320,curvature_sum320,curvature_weight320,
   smooth_reset_curvature320]
 simp only [show (0:ℕ)≠1 by omega,if_pos rfl,if_false,Nat.zero_add,
   show ∀ k:ℕ, ¬0=k+1 by omega]
 simp only [if_false,mul_zero,add_zero,sub_zero,mul_sub,mul_neg,mul_one,
   sum_sub_distrib,sum_neg_distrib]
 have hh := weighted_hit320 w n 1 1
 simp only [mul_left_comm] at *
 rw [←mul_sum,hh]

theorem final_curvature_succ320 (w : ℕ → ℝ) (n j : ℕ) :
 curvature320 (finalWeighted320 w n) (j+1)=
 -(if j=0 then ∑ k ∈ range n,w (k+1) else 0)-
 2*(if j+2<n then w (j+3) else 0)+2*(if j<n then w (j+1) else 0) := by
 simp only [finalWeighted320,curvature_sum320,curvature_weight320,
   smooth_reset_curvature320]
 simp only [show j+1≠0 by omega,if_false,zero_sub,
   show (j+1=1)↔j=0 by omega,
   show ∀ k:ℕ, (j+1=k+1)↔k=j by omega,
   show j+1+1=j+2 by omega]
 simp only [mul_add,mul_sub,mul_neg,sum_add_distrib,sum_sub_distrib,sum_neg_distrib]
 have h0 : (∑ k ∈ range n,w (k+1)*(if j=0 then 1 else 0))=
     if j=0 then ∑ k ∈ range n,w (k+1) else 0 := by split_ifs <;> simp
 rw [h0]
 simp only [mul_left_comm,←mul_sum,weighted_hit320]
 congr 2 <;> congr 1 <;> omega

#print axioms smooth_pure_curvature320
#print axioms final_curvature_succ320
end
end MathGKM.Markov
