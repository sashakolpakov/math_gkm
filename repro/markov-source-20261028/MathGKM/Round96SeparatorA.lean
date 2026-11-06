import MathGKM.Round96AllocationA

/- Machine-authored r96. Exact first committed separator only.
The block failure coexists with a strictly positive aggregate increment. -/
namespace ComplementaryAllocationR96
open Polynomial MatchingProjectionR64 FullFiberRankR80
open scoped BigOperators
noncomputable section
set_option maxHeartbeats 2000000
set_option maxSynthPendingDepth 64

private theorem alg1 {R : Type*} [CommRing R] (x y a b : R) :
    (x+y)^4+((x+y)^2*(a*x)+((x+y)^2*(b*y)+((x+y)^2*(a*x)+a*x*(a*x)))) =
    (x+y)^4+(2*a*x+b*y)*(x+y)^2+a^2*x^2 := by ring

private theorem alg2 {R : Type*} [CommRing R] (x y a b : R) :
    (x+y)^4+(2*a*x+b*y)*(x+y)^2+a^2*x^2 =
    y^4+b*y^3+(4*y^3+2*a*y^2+2*b*y^2)*x+
    (6*y^2+4*a*y+b*y+a^2)*x^2+(4*y+2*a)*x^3+x^4 := by ring

theorem F_four : F 4 0 = (fu+fv)^4 + (2*C (C alpha)*fu+C (C beta)*fv)*(fu+fv)^2 +
    C (C (alpha^2))*fu^2 := by
  classical
  have hm : FiniteMatchingR61.matchings 4 = {∅,{0},{1},{2},{0,2}} := by decide
  simp only [F,FiniteMatchingR61.finiteSum,hm]
  rw [Finset.sum_insert (by decide),Finset.sum_insert (by decide),
    Finset.sum_insert (by decide),Finset.sum_insert (by decide),Finset.sum_singleton]
  norm_num [coloredEdge,Finset.prod_insert,fu,fv]
  exact alg1 (X : Four) (C X) (C (C alpha)) (C (C beta))

theorem B_four_zero (r : ℕ) :
    B 4 0 r 0 = if r=2 then alpha^2 else if r=3 then 2*alpha else if r=4 then 1 else 0 := by
  have he : F 4 0 =
      C (X^4+C beta*X^3) +
      C (4*X^3+2*C alpha*X^2+2*C beta*X^2)*X +
      C (6*X^2+4*C alpha*X+C beta*X+C (alpha^2))*X^2 +
      C (4*X+2*C alpha)*X^3 + X^4 := by
    rw [F_four]
    simp only [fu,fv,map_add,map_mul,map_pow,map_ofNat]
    exact alg2 (X : Four) (C X) (C (C alpha)) (C (C beta))
  unfold B
  have hec := congrArg (fun P : Four => P.coeff r) he
  simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow,
    Polynomial.coeff_C_mul_X,Polynomial.coeff_X_pow,Polynomial.coeff_C] at hec
  rw [hec]
  by_cases h2 : r=2
  · subst r
    norm_num
    rw [← Polynomial.C_pow,Polynomial.coeff_C_zero]
  by_cases h3 : r=3
  · subst r; norm_num
  by_cases h4 : r=4
  · subst r; norm_num
  by_cases h0 : r=0
  · subst r; norm_num
  by_cases h1 : r=1
  · subst r; norm_num
  simp [h0,h1,h2,h3,h4]

theorem separator_values :
    G 4 0 0 6 2 0 0 2=1 ∧ G 4 0 0 6 2 0 0 3=0 ∧
    G 4 0 0 6 2 0 1 2=0 ∧ G 4 0 0 6 2 0 1 3=4 := by
  norm_num [G,S,allocation,f,B_four_zero,alpha,Polynomial.coeff_X_pow,Polynomial.coeff_X]

theorem separator :
    G 4 0 0 6 2 0 0 3 < G 4 0 0 6 2 0 0 2 ∧
    (PairConvolutionR78.P 4 0 0 6 2 0 2).card=1 ∧
    (PairConvolutionR78.P 4 0 0 6 2 0 3).card=4 ∧
    ¬ (∀ n sigma j i a b c : ℕ, sigma≤1 → c≤a/2 →
      G (2*n) sigma j (2*i+2) a b c i ≤ G (2*n) sigma j (2*i+2) a b c (i+1)) := by
  have hv := separator_values
  have hl := partition 4 0 0 6 2 0 2
  have hm := partition 4 0 0 6 2 0 3
  norm_num only [Finset.sum_range_succ,Finset.sum_range_zero,zero_add,
    hv.1,hv.2.1,hv.2.2.1,hv.2.2.2,rank_coeff] at hl hm
  refine ⟨?_,?_,?_,?_⟩
  · omega
  · exact_mod_cast hl
  · exact_mod_cast hm
  · intro h
    have hh := h 2 0 0 2 2 0 0 (by omega) (by omega)
    norm_num [hv.1,hv.2.1] at hh

end
end ComplementaryAllocationR96
#print axioms ComplementaryAllocationR96.separator
