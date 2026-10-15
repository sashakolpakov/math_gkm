import MarkovWeightedCurvature320f
import MarkovWeightedSource320f
import MarkovWeightedMasks320f
/-! Machine-authored 320fe46f. Monotone whole-degree weights preserve
one-cut coefficient concavity on every mixed mechanical source. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 3000000

theorem reset_weighted_concave320 (w : ℕ → ℝ) (hw : ∀ k,0≤w k)
 (hm : Monotone w) (n j : ℕ) (hj : j<n) :
 curvature320 (resetWeighted320 w n) j≤0 := by
 change curvature320 (finalWeighted320 w n+C (w n)*resetPolyFe01 n) j≤0
 rw [curvature_add320,curvature_weight320,reset_curvature320]
 have hs : 0≤∑ k ∈ range n,w (k+1) := sum_nonneg (fun k _ => hw _)
 cases j with
 | zero =>
   rw [final_curvature_zero320]
   simp only [if_pos rfl,show n≠0 by omega,if_false,mul_zero,add_zero]
   split_ifs <;> nlinarith [hw n,hw 2]
 | succ j =>
   rw [final_curvature_succ320]
   have h1 := hm (show j+1≤n by omega)
   have h2 := hm (show j+1≤j+3 by omega)
   simp only [show j+1≠0 by omega,if_false,show n≠j+1 by omega,
     show j<n by omega,if_pos,mul_zero,add_zero,neg_zero,zero_sub]
   split_ifs <;> (first | omega | nlinarith [hw n,hw (j+1),hw (j+3)])

theorem initial_final_concave320 (w : ℕ → ℝ) (hw : ∀ k,0≤w k)
 (hm : Monotone w) (n j : ℕ) (hj : j<n) :
 curvature320 (initialWeighted320 w n+finalWeighted320 w (n+1)) j≤0 := by
 rw [curvature_add320]
 have hs : 0≤∑ k ∈ range n,w (k+2) := sum_nonneg (fun k _ => hw _)
 have ht : 0≤∑ k ∈ range (n+1),w (k+1) := sum_nonneg (fun k _ => hw _)
 cases j with
 | zero =>
   rw [initial_curvature_zero320,final_curvature_zero320]
   split_ifs <;> nlinarith [hw 2,hw 3,hw (n+1)]
 | succ j =>
   rw [initial_curvature_succ320,final_curvature_succ320]
   have h1 := hm (show j+1≤j+3 by omega)
   have h2 := hm (show j+2≤j+4 by omega)
   have h3 := hm (show j+1≤n+1 by omega)
   have h4 := hm (show j+2≤n+1 by omega)
   have h5 := hw (j+1)
   by_cases hn : j+2<n
   · simp only [hn,if_pos,show j+1<n by omega,show j<n by omega,
       show j+2<n+1 by omega,show j<n+1 by omega,
       show n≠j+2 by omega,show n≠j by omega,if_false,add_zero,sub_zero]
     split_ifs <;> nlinarith
   · have he : n=j+2 := by omega
     subst n
     simp only [show ¬j+2<j+2 by omega,if_false,show j+1<j+2 by omega,
       show j<j+2 by omega,if_pos,show j+2≠j by omega,show j+2<j+2+1 by omega,
       show j<j+2+1 by omega,show j+2+1=j+3 by omega,add_zero,sub_zero]
     split_ifs <;> nlinarith

theorem source_weighted_concave320 (w : ℕ → ℝ) (hw : ∀ k,0≤w k)
 (hm : Monotone w) (n : ℕ) (rest : List Bool) (j : ℕ) (hj : j<n) :
 curvature320 (weightedOne320 (fun k => C (w k)) X X 1
   (central28 (List.replicate n true++false::rest)++[true])) j≤0 := by
 rw [source_weighted_runs320,curvature_add320]
 have hh := initial_final_concave320 w hw hm n j hj
 have ht : curvature320
     (((central28 rest).map (fun r => resetWeighted320 w (n+if r then 1 else 0))).sum) j≤0 := by
   generalize central28 rest=v
   induction v with
   | nil => simp [curvature320]
   | cons r rs ih =>
     simp only [List.map_cons,List.sum_cons,curvature_add320]
     have h := reset_weighted_concave320 w hw hm (n+if r then 1 else 0) j (by split_ifs <;> omega)
     linarith
 linarith

theorem lc_of_curvature320 (p : ℝ[X]) (hp : ∀ k,0≤p.coeff k) (j : ℕ)
 (h : curvature320 p j≤0) : p.coeff j*p.coeff (j+2)≤p.coeff (j+1)^2 := by
 unfold curvature320 at h
 have hmul := mul_nonneg (show 0≤2*p.coeff (j+1)-p.coeff j-p.coeff (j+2) by linarith)
   (show 0≤2*p.coeff (j+1)+p.coeff j+p.coeff (j+2) by linarith [hp j,hp (j+1),hp (j+2)])
 nlinarith [sq_nonneg (p.coeff j-p.coeff (j+2))]

theorem source_weighted_interior_lc320 (w : ℕ → ℝ) (hw : ∀ k,0≤w k)
 (hm : Monotone w) (n : ℕ) (rest : List Bool) (j : ℕ) (hj : j<n) :
 let p := weightedOne320 (fun k => C (w k)) X X 1
   (central28 (List.replicate n true++false::rest)++[true])
 p.coeff j*p.coeff (j+2)≤p.coeff (j+1)^2 := by
 apply lc_of_curvature320
 · exact weightedOne_nonneg320 w hw _
 · exact source_weighted_concave320 w hw hm n rest j hj

#print axioms source_weighted_concave320
#print axioms source_weighted_interior_lc320
end
end MathGKM.Markov
