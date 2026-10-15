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
 repeat' first | omega | (solve | ring) | (split <;> try omega)

theorem pure_curvature320 (n j : ℕ) :
 curvature320 (purePolyFe01 n) j=
 -(if j=0 then 1 else 0)-(if n=j+1 then 1 else 0)+(if j=n+1 then 1 else 0) := by
 simp only [curvature320,pure_coeff9c20]
 repeat' first | omega | (solve | ring) | (split <;> try omega)

theorem smooth_reset_curvature320 (n j : ℕ) :
 curvature320 ((1+X)*resetPolyFe01 n) j=
 -(if j=0 then 1 else 0)-(if j=1 then 1 else 0)-
 2*(if n=j+1 then 1 else 0)+2*(if j=n+1 then 1 else 0) := by
 simp only [curvature320,smooth_coeff9c20,reset_coeff9c20]
 repeat' first | omega | (solve | ring) | (split <;> try omega)

theorem smooth_pure_curvature320 (n j : ℕ) :
 curvature320 ((1+X)*purePolyFe01 n) j=
 -(if j=0 then 1 else 0)-(if j=1 then 1 else 0)-
 (if n=j+1 then 1 else 0)-(if n=j then 1 else 0)+
 (if j=n+1 then 1 else 0)+(if j=n+2 then 1 else 0) := by
 simp only [curvature320,smooth_coeff9c20,pure_coeff9c20]
 repeat' first | omega | (solve | ring) | (split <;> try omega)

theorem weighted_hit320 (w : ℕ → ℝ) (n t a : ℕ) :
 (∑ k ∈ range n,w (k+a)*(if k=t then 1 else 0))=
 if t<n then w (t+a) else 0 := by simp

#print axioms smooth_pure_curvature320
end
end MathGKM.Markov
