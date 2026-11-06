import MathGKM.Round93SmallA

/- Machine-authored round93 exact typed submission. -/
namespace Round93Submission2
theorem candidate :
∀ n j i b : ℕ, n<3 →
  (PairConvolutionR78.P (2*n) 0 j (2*i+2) 1 b i).card ≤
    (PairConvolutionR78.P (2*n) 0 j (2*i+2) 1 b (i+1)).card :=
  BoundarySmallR93.alpha_one_small
end Round93Submission2
#print axioms Round93Submission2.candidate
