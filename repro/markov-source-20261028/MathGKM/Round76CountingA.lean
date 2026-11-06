import MathGKM.Round64ProjectionA
import MathGKM.Round66FiberDefinitionsA

/- Machine-authored round65. Decorations are subsets of the actual uncovered
vertices, with membership meaning u and nonmembership meaning v. -/
namespace ColorFibersR76
open MatchingSeparatorR63 MatchingProjectionR64
open scoped BigOperators
noncomputable section

def uncovered (N : ℕ) (M : Finset ℕ) : Finset ℕ :=
  Finset.range N \ (M ∪ M.image Nat.succ)

theorem uncovered_card (N : ℕ) (M : Finset ℕ)
    (h : FiniteMatchingR61.Match N M) :
    (uncovered N M).card = N-2*M.card := by
  classical
  have hd : Disjoint M (M.image Nat.succ) := by
    apply Finset.disjoint_left.mpr
    intro x hx hy
    obtain ⟨e,he,heq⟩ := Finset.mem_image.mp hy
    subst x
    exact h.2 e he hx
  have hs : M ∪ M.image Nat.succ ⊆ Finset.range N := by
    intro x hx
    rcases Finset.mem_union.mp hx with hx|hx
    · have := h.1 x hx
      exact Finset.mem_range.mpr (by omega)
    · obtain ⟨e,he,rfl⟩ := Finset.mem_image.mp hx
      exact Finset.mem_range.mpr (h.1 e he)
  rw [uncovered,Finset.card_sdiff_of_subset hs,Finset.card_range,
    Finset.card_union_of_disjoint hd,Finset.card_image_of_injective _ Nat.succ_injective]
  omega

def fiber (N sigma i j a b : ℕ) : Finset ((M : Finset ℕ) × Finset ℕ) :=
  (FiniteMatchingR61.matchings N).sigma fun M =>
    ((uncovered N M).powerset).filter fun S =>
      p sigma M=a ∧ q sigma M=b ∧
      p sigma M+S.card=i ∧ q sigma M+((uncovered N M).card-S.card)=j

theorem monomer_decorations (N sigma : ℕ) (M : Finset ℕ)
    (h : FiniteMatchingR61.Match N M) :
    monomer N sigma M =
      ∑ S ∈ (uncovered N M).powerset,
        u^(p sigma M+S.card)*v^(q sigma M+((uncovered N M).card-S.card)) := by
  classical
  have hp := Finset.prod_add (fun _ : ℕ => u) (fun _ : ℕ => v) (uncovered N M)
  simp only [Finset.prod_const] at hp
  unfold monomer
  rw [← uncovered_card N M h,hp,Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro S hS
  have hs := Finset.mem_powerset.mp hS
  rw [Finset.card_sdiff_of_subset hs,pow_add,pow_add]
  ring

theorem monomial_coeff (r s i j : ℕ) :
    ((u^r*v^s).coeff i).coeff j = if r=i ∧ s=j then (1:ℤ) else 0 := by
  rw [show u^r*v^s = Polynomial.monomial r (Polynomial.X^s) by
    simp only [u,v, ← Polynomial.C_pow, Polynomial.X_pow_mul_C, Polynomial.C_mul_X_pow_eq_monomial]]
  by_cases hr : r=i <;> by_cases hs : s=j <;> simp [Polynomial.coeff_monomial,Polynomial.coeff_X_pow,hr,hs,eq_comm]

theorem monomer_count (N sigma i j : ℕ) (M : Finset ℕ)
    (h : FiniteMatchingR61.Match N M) :
    ((monomer N sigma M).coeff i).coeff j =
      ((((uncovered N M).powerset).filter fun S =>
        p sigma M+S.card=i ∧ q sigma M+((uncovered N M).card-S.card)=j).card : ℤ) := by
  rw [monomer_decorations N sigma M h]
  simp only [Polynomial.finset_sum_coeff,monomial_coeff]
  simp

theorem pi_product (sigma : ℕ) (M : Finset ℕ) :
    pi sigma (∏ e ∈ M, w e) = alpha^(p sigma M)*beta^(q sigma M) := by
  classical
  induction M using Finset.induction_on with
  | empty => simp [p,q]
  | @insert e M he ih =>
    have hm : (e+sigma)%2=0 ∨ (e+sigma)%2=1 := by omega
    rcases hm with h|h
    · rw [Finset.prod_insert he, map_mul, ih]
      have hv : pi sigma (w e)=alpha := by simp [pi,w,h]
      rw [hv]
      simp [p,q,Finset.filter_insert,h,he,pow_succ]
      <;> ring
    · rw [Finset.prod_insert he, map_mul, ih]
      have hv : pi sigma (w e)=beta := by simp [pi,w,h]
      rw [hv]
      simp [p,q,Finset.filter_insert,h,he,pow_succ]
      <;> ring

theorem color_monomial_coeff (c : ℤ) (r s a b : ℕ) :
    (((c : Color)*alpha^r*beta^s).coeff a).coeff b =
      if r=a ∧ s=b then c else 0 := by
  have he : (c : Color)*alpha^r*beta^s = Polynomial.monomial r (Polynomial.monomial s c) := by
    simp only [alpha,beta, ← Polynomial.C_mul_X_pow_eq_monomial, ← Polynomial.C_pow, map_mul, Polynomial.C_eq_intCast]
    have hc0 : Polynomial.C (Polynomial.C c) = (c : Color) := by
      exact (Polynomial.C_eq_intCast c).trans (Polynomial.C_eq_intCast c)
    rw [hc0]
    ring
  rw [he]
  by_cases hr : r=a <;> by_cases hs : s=b <;> simp [Polynomial.coeff_monomial,hr,hs,eq_comm]

theorem coefficient_fiber (N sigma i j a b : ℕ) :
    ((B N sigma i j).coeff a).coeff b = (fiber N sigma i j a b).card := by
  classical
  rw [MatchingProjectionR64.projected_C]
  unfold C
  simp only [map_sum,map_mul]
  simp only [pi_product]
  have hc (z : ℤ) : pi sigma (MvPolynomial.C z) = (z : Color) := by simp [pi]
  simp only [hc,Polynomial.finset_sum_coeff]
  simp only [← mul_assoc,color_monomial_coeff]
  unfold fiber
  rw [Finset.card_sigma,Nat.cast_sum]
  apply Finset.sum_congr rfl
  intro M hM
  have hm := (Finset.mem_filter.mp hM).2
  rw [monomer_count N sigma i j M hm]
  by_cases hp : p sigma M=a ∧ q sigma M=b
  · simp [hp.1,hp.2]
  · simp only [if_neg hp]
    have : ¬(p sigma M=a ∧ q sigma M=b) := hp
    have hz : (((uncovered N M).powerset).filter fun S =>
        p sigma M=a ∧ q sigma M=b ∧
        p sigma M+S.card=i ∧ q sigma M+((uncovered N M).card-S.card)=j) = ∅ := by
      apply Finset.eq_empty_iff_forall_notMem.mpr
      intro S hs
      have ht := (Finset.mem_filter.mp hs).2
      exact hp ⟨ht.1,ht.2.1⟩
    rw [hz]
    simp

end
end ColorFibersR76
