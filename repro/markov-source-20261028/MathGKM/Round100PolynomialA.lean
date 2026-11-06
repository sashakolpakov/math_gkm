import MathGKM.Round100FlowA

/- Machine-authored r100. Unit specialization of an exactly homogeneous
two-color polynomial, retaining every coefficient on its antidiagonal. -/
namespace NeighborFlowR100
open scoped BigOperators
noncomputable section

theorem homogeneous_unit (P : Polynomial (Polynomial ℤ)) (K : ℕ)
    (h : ∀ a b, (P.coeff a).coeff b ≠ 0 → a+b=K) :
    (P.map (Polynomial.evalRingHom (1 : ℤ))).eval 1 =
      ∑ a ∈ Finset.range (K+1), (P.coeff a).coeff (K-a) := by
  classical
  have inner (a : ℕ) : (P.coeff a).eval 1 = (P.coeff a).coeff (K-a) := by
    rw [Polynomial.eval_eq_sum,Polynomial.sum_def]
    simp only [one_pow,mul_one]
    apply Finset.sum_eq_single (K-a)
    · intro b hb hne
      by_contra hn
      have hd := h a b hn
      exact hne (by omega)
    · intro hn
      exact Polynomial.notMem_support_iff.mp hn
  have hs : P.support ⊆ Finset.range (K+1) := by
    intro a ha
    have hp : P.coeff a ≠ 0 := Polynomial.mem_support_iff.mp ha
    have hx : ∃ b, (P.coeff a).coeff b ≠ 0 := by
      by_contra hn
      push_neg at hn
      apply hp
      ext b
      exact hn b
    obtain ⟨b,hb⟩ := hx
    have hd := h a b hb
    exact Finset.mem_range.mpr (by omega)
  rw [Polynomial.eval_map,Polynomial.eval₂_at_one]
  change (Polynomial.evalRingHom (1 : ℤ)) (P.eval 1) = _
  rw [show P.eval 1 = ∑ a ∈ P.support, P.coeff a by
    simp [Polynomial.eval_eq_sum,Polynomial.sum_def]]
  rw [map_sum]
  change (∑ a ∈ P.support, (P.coeff a).eval 1) = _
  simp_rw [inner]
  exact Finset.sum_subset hs (fun a ha hn => by
    rw [Polynomial.notMem_support_iff.mp hn,Polynomial.coeff_zero])

end
end NeighborFlowR100
#print axioms NeighborFlowR100.homogeneous_unit
