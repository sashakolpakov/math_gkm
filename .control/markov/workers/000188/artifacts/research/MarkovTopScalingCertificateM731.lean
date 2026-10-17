import MarkovTopIntegerDensityM731
/-! Machine-authored 73199834. Exact algebra for a proposed central-scaling
analysis. No limit, approximation, variance estimate, or source inequality
is asserted by these scalar certificates. -/
namespace MathGKM.Markov
noncomputable section

def scalingDenM731 (a u g : ℝ) : ℝ := g^2-a*g+2*g*u+2*u^2
def scalingNumeratorM731 (a u g : ℝ) : ℝ :=
 (2*u*(g+u)+a*g)*scalingDenM731 a u g-(a+u)*(g-a+u)*(g+2*u)^2
def scalingQFreeM731 (a u g : ℝ) : ℝ := g^2-3*a*g-4*a*u-2*u^2

theorem scaling_factorM731 (a u g : ℝ) :
 scalingNumeratorM731 a u g=u*(g+u)*(g-2*a)^2 := by
 unfold scalingNumeratorM731 scalingDenM731
 ring

theorem scaling_den_positiveM731 (a u g : ℝ)
 (ha : 0 < a) (hu : 0 < u) (hg : 3*a+1 ≤ g) : 0 < scalingDenM731 a u g := by
 have hg0 : 0 < g := by linarith
 have hga : 0 < g-a := by linarith
 have he : scalingDenM731 a u g=g*(g-a)+2*g*u+2*u^2 := by
   unfold scalingDenM731; ring
 rw [he]
 positivity

theorem scaling_numerator_positiveM731 (a u g : ℝ)
 (ha : 0 < a) (hu : 0 < u) (hg : 3*a+1 ≤ g) : 0 < scalingNumeratorM731 a u g := by
 rw [scaling_factorM731]
 have hg0 : 0 < g := by linarith
 have hga : 0 < g-2*a := by linarith
 exact mul_pos (mul_pos hu (add_pos hg0 hu)) (sq_pos_of_pos hga)

theorem scaling_qfree_minimalM731 (a u : ℝ) :
 scalingQFreeM731 a u (3*a+1)=1-2*u^2+a*(3-4*u) := by
 unfold scalingQFreeM731
 ring

theorem scaling_qfree_negative_witnessM731 :
 scalingQFreeM731 (1/5) (4/5) (8/5) < 0 ∧
 0 < scalingNumeratorM731 (1/5) (4/5) (8/5) := by
 norm_num [scalingQFreeM731,scalingNumeratorM731,scalingDenM731]

end
end MathGKM.Markov
