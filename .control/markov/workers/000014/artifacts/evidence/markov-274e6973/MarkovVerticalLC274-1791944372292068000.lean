import MarkovVerticalFormula274

/-! Machine-authored request 274e6973. Unconditional first-vertical LC, a>=3. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem blockH_ramp_map274 (a r q : ℕ) :
    (blockH274 a r q-X^q*(X+1)).map (Int.castRingHom ℝ)=rampPoly025 a r q := by
  have hsum :
      4*((a:Polynomial ℝ)*(∑ k ∈ Finset.range q, (k:Polynomial ℝ)*X^k)+
        (r:Polynomial ℝ)*(∑ k ∈ Finset.range q, X^k))=
      ∑ k ∈ Finset.range q, monomial k (4*((a:ℝ)*k+r)) := by
    simp only [Finset.mul_sum,Finset.sum_add_distrib,← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro k hk
    rw [← C_mul_X_pow_eq_monomial]
    simp only [map_mul,map_add,map_ofNat,map_natCast]
    ring
  simp only [blockH274,weightedSum025,plainSum025,Polynomial.map_sub,
    Polynomial.map_add,Polynomial.map_mul,Polynomial.map_pow,Polynomial.map_X,
    Polynomial.map_natCast,Polynomial.map_ofNat,Polynomial.map_sum]
  rw [hsum]
  unfold rampPoly025
  simp only [← C_mul_X_pow_eq_monomial,map_sub,map_mul,map_add,map_natCast,map_one]
  rw [pow_succ]
  ring

theorem vertical_one_raw274 (path : List Bool) (ha : 3≤(frame path).mid.a) (j : ℕ) :
    coeff (frame path).mid.p 1 j*coeff (frame path).mid.p 1 (j+2) ≤
      coeff (frame path).mid.p 1 (j+1)^2 := by
  obtain ⟨q,r,hq,hr,hb,he⟩ := source_formula274 path ha
  apply vertical_one_of_formula025 path (frame path).mid.a (frame path).mid.b q r ha hq
  rw [he,Polynomial.map_mul,Polynomial.map_mul,Polynomial.map_pow,Polynomial.map_X,
    Polynomial.map_pow,Polynomial.map_add,Polynomial.map_X,Polynomial.map_one,
    blockH_ramp_map274]

#print axioms vertical_one_raw274
end
end MathGKM.Markov
