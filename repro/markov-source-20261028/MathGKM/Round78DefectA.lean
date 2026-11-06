import MathGKM.Round78PairSubmissionA

/- Machine-authored round78. This transport exposes, but does not prove, the comparison. -/
namespace PairConvolutionR78
open scoped Finset
noncomputable section

theorem color_cells_disjoint (S : Finset LocalRetilingR76.Pair) (sigma : ℕ)
    (x y : (ℕ × ℕ) × (ℕ × ℕ)) (h : x ≠ y) :
    Disjoint (S.filter fun z => colors sigma z=x) (S.filter fun z => colors sigma z=y) := by
  classical
  apply Finset.disjoint_left.mpr
  intro z hz hw
  exact h ((Finset.mem_filter.mp hz).2.symm.trans (Finset.mem_filter.mp hw).2)

theorem defect_card (N sigma i j a b : ℕ) :
    ((MatchingProjectionR64.defect N sigma i j).coeff a).coeff b =
      ((P N sigma j (2*i+2) a b (i+1)).card : ℤ) -
      ((P N sigma j (2*i+2) a b i).card : ℤ) := by
  unfold MatchingProjectionR64.defect
  rw [pow_two,Polynomial.coeff_sub,Polynomial.coeff_sub,
    pair_coefficient,pair_coefficient]
  rw [show i+1+(i+1)=2*i+2 by omega, show i+(i+2)=2*i+2 by omega]

theorem defect_nonnegative_iff (N sigma i j a b : ℕ) :
    (0 ≤ ((MatchingProjectionR64.defect N sigma i j).coeff a).coeff b) ↔
      (P N sigma j (2*i+2) a b i).card ≤ (P N sigma j (2*i+2) a b (i+1)).card := by
  rw [defect_card,sub_nonneg, Nat.cast_le]

theorem defect_submission :
    (∀ N sigma i j a b : ℕ,
      ((MatchingProjectionR64.defect N sigma i j).coeff a).coeff b =
        ((P N sigma j (2*i+2) a b (i+1)).card : ℤ) -
        ((P N sigma j (2*i+2) a b i).card : ℤ)) ∧
    (∀ N sigma i j a b : ℕ,
      (0 ≤ ((MatchingProjectionR64.defect N sigma i j).coeff a).coeff b) ↔
        (P N sigma j (2*i+2) a b i).card ≤ (P N sigma j (2*i+2) a b (i+1)).card) :=
  ⟨defect_card,defect_nonnegative_iff⟩

end
end PairConvolutionR78

#print axioms PairConvolutionR78.defect_submission
#print axioms PairConvolutionR78.color_cells_disjoint
