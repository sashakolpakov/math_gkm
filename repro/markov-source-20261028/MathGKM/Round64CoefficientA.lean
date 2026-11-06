import MathGKM.Round63MatchingDefinitionsA

/- Machine-authored round64. Exact coefficient identity for the unchanged
two presentations, with no coefficient-sign or actual-family assumption. -/
namespace MatchingCoefficientR64
open MatchingSeparatorR63
open scoped BigOperators
noncomputable section

def lift : UV →+* WeightedUV :=
  Polynomial.mapRingHom (Polynomial.mapRingHom (Int.castRingHom W))

theorem lift_monomer (N sigma : ℕ) (M : Finset ℕ) :
    lift (monomer N sigma M) =
      wu^(p sigma M)*wv^(q sigma M)*(wu+wv)^(N-2*M.card) := by
  simp [lift,monomer,u,v,wu,wv,Polynomial.map_add,Polynomial.map_mul,
    Polynomial.map_pow]

theorem product_colors (sigma : ℕ) (M : Finset ℕ) :
    (∏ e ∈ M, if (e+sigma)%2=0 then wu else wv) =
      wu^(p sigma M)*wv^(q sigma M) := by
  classical
  induction M using Finset.induction_on with
  | empty => simp [p,q]
  | @insert e M he ih =>
    have hm : (e+sigma)%2=0 ∨ (e+sigma)%2=1 := by omega
    rcases hm with h|h
    · simp [Finset.prod_insert,he,p,q,Finset.filter_insert,h,ih,pow_succ]
      ring
    · simp [Finset.prod_insert,he,p,q,Finset.filter_insert,h,ih,pow_succ]
      ring

theorem summand (N sigma : ℕ) (M : Finset ℕ) :
    (wu+wv)^(N-2*M.card) * ∏ e ∈ M, edge sigma e =
      lift (monomer N sigma M) *
        Polynomial.C (Polynomial.C (∏ e ∈ M, w e)) := by
  classical
  rw [lift_monomer]
  simp only [edge,Finset.prod_mul_distrib]
  rw [product_colors]
  simp only [← map_prod]
  ring

theorem coeff_C_mul (P : WeightedUV) (c : W) (i j : ℕ) :
    ((P*Polynomial.C (Polynomial.C c)).coeff i).coeff j =
      (P.coeff i).coeff j*c := by
  simp [Polynomial.coeff_mul_C]

theorem coefficient_identity (N sigma i j : ℕ) :
    ((Z N sigma).coeff i).coeff j = C N sigma i j := by
  classical
  unfold Z FiniteMatchingR61.finiteSum C
  simp only [Polynomial.finset_sum_coeff]
  apply Finset.sum_congr rfl
  intro M hM
  rw [summand,coeff_C_mul]
  simp [lift,Polynomial.coeff_map]

end
end MatchingCoefficientR64
