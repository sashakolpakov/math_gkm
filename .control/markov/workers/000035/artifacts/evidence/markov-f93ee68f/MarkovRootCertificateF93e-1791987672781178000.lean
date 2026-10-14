import Mathlib
/-! Machine-authored f93ee68f. Exact approximate-root certificate.
This is a general analytic tool, not a proof of Markov log-concavity. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem exists_root_near_f93e (p : Polynomial ℂ) (c : ℂ) (r : ℝ)
    (hr : 0 ≤ r)
    (h : ‖p.eval c‖ < ‖p.leadingCoeff‖ * r^p.natDegree) :
    ∃ z : ℂ, p.eval z=0 ∧ ‖c-z‖<r := by
  have hs : p.Splits := IsAlgClosed.splits p
  by_contra! hn
  have hb : ∀ z ∈ p.roots, r ≤ ‖c-z‖ := by
    intro z hz
    exact hn z (Polynomial.isRoot_of_mem_roots hz)
  have hp := Multiset.prod_map_le_prod_map₀ (s:=p.roots)
    (fun _ : ℂ => r) (fun z => ‖c-z‖) (by intros; exact hr) hb
  simp only [Multiset.map_const', Multiset.prod_replicate,
    ← hs.natDegree_eq_card_roots] at hp
  have he : ‖p.eval c‖ = ‖p.leadingCoeff‖ *
      (p.roots.map (fun z => ‖c-z‖)).prod := by
    rw [hs.eval_eq_prod_roots, norm_mul]
    congr 1
    exact (p.roots.prod_hom' (NormedField.toMulRingNorm ℂ) (fun z => c-z)).symm
  rw [he] at h
  exact (not_lt_of_ge (mul_le_mul_of_nonneg_left hp (norm_nonneg _))) h

#print axioms exists_root_near_f93e
end
end MathGKM.Markov
