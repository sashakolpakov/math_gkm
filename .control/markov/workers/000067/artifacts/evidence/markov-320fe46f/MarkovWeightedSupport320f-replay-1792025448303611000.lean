import MarkovWeightedSource320f
/-! Machine-authored 320fe46f. Zero-preserving finite support of one-cut sums. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset

theorem reset_zero320 (n j : ℕ) (h : n<j) : (resetPolyFe01 n).coeff j=0 := by
 simp [reset_coeff9c20,show j≠0 by omega,show ¬j≤n by omega]
theorem pure_zero320 (n j : ℕ) (h : n+1<j) : (purePolyFe01 n).coeff j=0 := by
 simp [pure_coeff9c20,show j≠0 by omega,show j≠n+1 by omega,show ¬j≤n by omega]
theorem smooth_reset_zero320 (n j : ℕ) (h : n+1<j) :
 ((1+X)*resetPolyFe01 n).coeff j=0 := by
 rw [smooth_coeff9c20,reset_zero320 n j (by omega),
   if_neg (by omega),reset_zero320 n (j-1) (by omega)]
 simp
theorem smooth_pure_zero320 (n j : ℕ) (h : n+2<j) :
 ((1+X)*purePolyFe01 n).coeff j=0 := by
 rw [smooth_coeff9c20,pure_zero320 n j (by omega),
   if_neg (by omega),pure_zero320 n (j-1) (by omega)]
 simp

theorem final_zero320 (w : ℕ → ℝ) (n j : ℕ) (h : n<j) :
 (finalWeighted320 w n).coeff j=0 := by
 simp only [finalWeighted320,Polynomial.finsetSum_coeff,Polynomial.coeff_C_mul]
 apply sum_eq_zero
 intro k hk
 rw [smooth_reset_zero320 k j (by have := mem_range.mp hk; omega),mul_zero]

theorem reset_weighted_zero320 (w : ℕ → ℝ) (n j : ℕ) (h : n<j) :
 (resetWeighted320 w n).coeff j=0 := by
 change (finalWeighted320 w n+C (w n)*resetPolyFe01 n).coeff j=0
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul,
   final_zero320 w n j h,reset_zero320 n j h,mul_zero,add_zero]

theorem initial_zero320 (w : ℕ → ℝ) (n j : ℕ) (h : n+1<j) :
 (initialWeighted320 w n).coeff j=0 := by
 simp only [initialWeighted320,Polynomial.coeff_add,Polynomial.finsetSum_coeff,
   Polynomial.coeff_C_mul,pure_zero320 n j h,mul_zero,add_zero]
 apply sum_eq_zero
 intro k hk
 rw [smooth_pure_zero320 k j (by have := mem_range.mp hk; omega),mul_zero]

theorem source_weighted_zero320 (w : ℕ → ℝ) (n : ℕ) (rest : List Bool)
 (j : ℕ) (h : n+1<j) :
 (weightedOne320 (fun k => C (w k)) X X 1
   (central28 (List.replicate n true++false::rest)++[true])).coeff j=0 := by
 rw [source_weighted_runs320]
 simp only [Polynomial.coeff_add,initial_zero320 w n j h,
   final_zero320 w (n+1) j h,zero_add,Polynomial.coeff_list_sum_map]
 apply List.sum_eq_zero
 intro x hx
 obtain ⟨r,hr,rfl⟩ := List.mem_map.mp hx
 exact reset_weighted_zero320 w _ j (by split_ifs <;> omega)

#print axioms source_weighted_zero320
end
end MathGKM.Markov
