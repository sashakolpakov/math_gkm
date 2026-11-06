import MathGKM.Round92PolarisationA

/- Machine-authored round92. Linear comparison preservation, with every
class inequality left explicit. No closure of log-concavity is used. -/
namespace BoundaryPolarisationR92
noncomputable section

theorem nonnegative_combination (L : ℕ) (f g : ℕ → ℤ) (a d : ℤ)
    (ha : 0≤a) (hd : 0≤d)
    (hf : ∀ r, r≤L → f r=f (L-r))
    (hg : ∀ r, r≤L → g r=g (L-r))
    (hfi : ∀ r, 2*r<L → f r≤f (r+1))
    (hgi : ∀ r, 2*r<L → g r≤g (r+1)) :
    (∀ r, r≤L → a*f r+d*g r=a*f (L-r)+d*g (L-r)) ∧
    (∀ r, 2*r<L → a*f r+d*g r≤a*f (r+1)+d*g (r+1)) := by
  constructor
  · intro r hr
    rw [hf r hr,hg r hr]
  · intro r hr
    exact add_le_add (mul_le_mul_of_nonneg_left (hfi r hr) ha)
      (mul_le_mul_of_nonneg_left (hgi r hr) hd)

theorem conditional_rank_comparison (m j L b : ℕ)
    (hb : ∀ r, 2*r<L → bulk m j L b r≤bulk m j L b (r+1))
    (he : ∀ r, 2*r<L → endpoint m j L b r≤endpoint m j L b (r+1)) :
    ∀ r, 2*r<L →
      (PairConvolutionR78.P (2*(m+3)) 0 j L 1 b r).card ≤
      (PairConvolutionR78.P (2*(m+3)) 0 j L 1 b (r+1)).card := by
  intro r hr
  have hh := add_le_add
    (mul_le_mul_of_nonneg_left (hb r hr) (show (0 : ℤ) ≤ (m : ℤ)+3 by positivity))
    (mul_le_mul_of_nonneg_left (he r hr) (show (0 : ℤ) ≤ 2 by omega))
  rw [← actual_card m j L b r,← actual_card m j L b (r+1)] at hh
  exact_mod_cast hh

theorem conditional_central (m j i b : ℕ)
    (hb : bulk m j (2*i+2) b i≤bulk m j (2*i+2) b (i+1))
    (he : endpoint m j (2*i+2) b i≤endpoint m j (2*i+2) b (i+1)) :
    (PairConvolutionR78.P (2*(m+3)) 0 j (2*i+2) 1 b i).card ≤
      (PairConvolutionR78.P (2*(m+3)) 0 j (2*i+2) 1 b (i+1)).card := by
  have hh := add_le_add
    (mul_le_mul_of_nonneg_left hb (show (0 : ℤ) ≤ (m : ℤ)+3 by positivity))
    (mul_le_mul_of_nonneg_left he (show (0 : ℤ) ≤ 2 by omega))
  rw [← actual_card m j (2*i+2) b i,← actual_card m j (2*i+2) b (i+1)] at hh
  exact_mod_cast hh

end
end BoundaryPolarisationR92
#print axioms BoundaryPolarisationR92.nonnegative_combination
#print axioms BoundaryPolarisationR92.conditional_central
