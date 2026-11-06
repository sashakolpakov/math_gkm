import MathGKM.Round93CompensationA

/- Machine-authored round93 exact typed submission. -/
namespace Round93Submission1
theorem candidate :
(∀ m j L b r : ℕ,
  ((PairConvolutionR78.P (2*(m+3)) 0 j L 1 b (r+1)).card : ℤ)-
    ((PairConvolutionR78.P (2*(m+3)) 0 j L 1 b r).card : ℤ)=
    BoundaryCompensationR93.increment m j L b r) ∧
(∀ m j L b r : ℕ,
  (0 ≤ BoundaryCompensationR93.increment m j L b r) ↔
  (PairConvolutionR78.P (2*(m+3)) 0 j L 1 b r).card ≤
    (PairConvolutionR78.P (2*(m+3)) 0 j L 1 b (r+1)).card) ∧
(∀ m j i b : ℕ,
  (0 ≤ (m+3 : ℤ)*(BoundaryPolarisationR92.bulk m j (2*i+2) b (i+1)-BoundaryPolarisationR92.bulk m j (2*i+2) b i)+
    2*(BoundaryPolarisationR92.endpoint m j (2*i+2) b (i+1)-BoundaryPolarisationR92.endpoint m j (2*i+2) b i)) ↔
  (PairConvolutionR78.P (2*(m+3)) 0 j (2*i+2) 1 b i).card ≤
    (PairConvolutionR78.P (2*(m+3)) 0 j (2*i+2) 1 b (i+1)).card) :=
  by exact ⟨BoundaryCompensationR93.card_increment, BoundaryCompensationR93.comparison_iff, BoundaryCompensationR93.central_iff⟩
end Round93Submission1
#print axioms Round93Submission1.candidate
