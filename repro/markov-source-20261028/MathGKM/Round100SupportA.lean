import MathGKM.Round78PairA
import MathGKM.Round76CountingA
import MathGKM.Round100PolynomialA

/- Machine-authored r100. Reuses the exact retained r98 support argument,
without importing its unrelated alpha-two consumer. -/
namespace NeighborSupportR100
open MatchingSeparatorR63 LocalRetilingR76 PairConvolutionR78 MatchingProjectionR64
open scoped BigOperators
noncomputable section
set_option maxHeartbeats 1500000
theorem colors_card (sigma : ℕ) (M : Finset ℕ) : p sigma M+q sigma M=M.card := by
  classical
  have hu : M.filter (fun e => (e+sigma)%2=0) ∪
      M.filter (fun e => (e+sigma)%2=1) = M := by
    ext e
    simp only [Finset.mem_union,Finset.mem_filter]
    constructor
    · rintro (⟨he,_⟩ | ⟨he,_⟩) <;> exact he
    · intro he
      have hm : (e+sigma)%2=0 ∨ (e+sigma)%2=1 := by omega
      rcases hm with hm | hm
      · exact Or.inl ⟨he,hm⟩
      · exact Or.inr ⟨he,hm⟩
  have hd : Disjoint (M.filter (fun e => (e+sigma)%2=0))
      (M.filter (fun e => (e+sigma)%2=1)) := by
    apply Finset.disjoint_left.mpr
    intro e h0 h1
    have h0' := (Finset.mem_filter.mp h0).2
    have h1' := (Finset.mem_filter.mp h1).2
    omega
  have hc := congrArg Finset.card hu
  rw [Finset.card_union_of_disjoint hd] at hc
  exact hc

theorem object_degree (N sigma : ℕ) (o : Obj) (ho : valid N o) :
    du sigma o+dv N sigma o+p sigma o.1+q sigma o.1=N := by
  have hcol := colors_card sigma o.1
  have hb := FiniteMatchingR61.cardinality N o.1 ho.1
  have huc : (ColorFibersR66.uncovered N o.1).card=N-2*o.1.card :=
    ColorFibersR76.uncovered_card N o.1 ho.1
  have hs := Finset.card_le_card ho.2
  unfold du dv
  omega

theorem coefficient_degree (N sigma i j a b : ℕ)
    (h : ((MatchingProjectionR64.B N sigma i j).coeff a).coeff b ≠ 0) :
    i+j+a+b=N := by
  classical
  rw [coefficient_single] at h
  have hc : (single N sigma i j a b).card ≠ 0 := by exact_mod_cast h
  obtain ⟨o,ho⟩ := Finset.card_ne_zero.mp hc
  obtain ⟨hv,hp,hq,hi,hj⟩ := Finset.mem_filter.mp ho
  have hd := object_degree N sigma o ((mem_U N o).mp hv)
  omega

theorem pair_degree (N sigma j L a b r : ℕ)
    (h : (P N sigma j L a b r).Nonempty) : L+2*j+a+b=2*N := by
  classical
  obtain ⟨z,hz⟩ := h
  obtain ⟨_,hf,_⟩ := Finset.mem_filter.mp hz
  obtain ⟨h1,h2,h3,h4,h5,h6,h7⟩ := hf
  have hd1 := object_degree N sigma z.1 h1
  have hd2 := object_degree N sigma z.2 h2
  omega

theorem pair_zero (N sigma j L a b r : ℕ) (h : L+2*j+a+b≠2*N) :
    P N sigma j L a b r=∅ := by
  apply Finset.eq_empty_iff_forall_notMem.mpr
  intro z hz
  exact h (pair_degree N sigma j L a b r ⟨z,hz⟩)


def pooledDelta (N sigma t r K a : ℕ) : ℤ :=
  ((P N sigma t (2*r+2) a (K-a) (r+1)).card : ℤ) -
    ((P N sigma t (2*r+2) a (K-a) r).card : ℤ)

theorem defect_coeff (N sigma t r a b : ℕ) :
    ((defect N sigma r t).coeff a).coeff b =
      ((P N sigma t (2*r+2) a b (r+1)).card : ℤ) -
      ((P N sigma t (2*r+2) a b r).card : ℤ) := by
  have hc := pair_coefficient N sigma (r+1) (r+1) t a b
  have ha := pair_coefficient N sigma r (r+2) t a b
  have h1 : r+1+(r+1)=2*r+2 := by omega
  have h0 : r+(r+2)=2*r+2 := by omega
  rw [h1] at hc
  rw [h0] at ha
  simp only [defect,pow_two,Polynomial.coeff_sub]
  rw [hc,ha]

theorem defect_degree (N sigma t r a b : ℕ)
    (h : ((defect N sigma r t).coeff a).coeff b ≠ 0) :
    (2*r+2)+2*t+a+b=2*N := by
  by_contra hn
  rw [defect_coeff,pair_zero N sigma t (2*r+2) a b (r+1) hn,
    pair_zero N sigma t (2*r+2) a b r hn] at h
  simp at h

theorem pooled_specialization (N sigma t r K : ℕ)
    (hK : (2*r+2)+2*t+K=2*N) :
    unit (defect N sigma r t) =
      ∑ a ∈ Finset.range (K+1), pooledDelta N sigma t r K a := by
  have he := NeighborFlowR100.homogeneous_unit (defect N sigma r t) K (by
    intro a b h
    have hd := defect_degree N sigma t r a b h
    omega)
  change unit (defect N sigma r t) = _ at he
  rw [he]
  exact Finset.sum_congr rfl (fun a _ => defect_coeff N sigma t r a (K-a))

theorem support_and_specialization :
    (∀ N sigma t L a b r, (P N sigma t L a b r).Nonempty →
      L+2*t+a+b=2*N) ∧
    (∀ N sigma t r K, (2*r+2)+2*t+K=2*N →
      unit (defect N sigma r t) =
      ∑ a ∈ Finset.range (K+1), pooledDelta N sigma t r K a) :=
  ⟨pair_degree,pooled_specialization⟩

end
end NeighborSupportR100
#print axioms NeighborSupportR100.support_and_specialization
