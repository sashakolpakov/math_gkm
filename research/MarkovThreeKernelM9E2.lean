import MarkovThreeSeriesM9E2
import MarkovQuadraticKernelM9E2
/-! Machine-authored 9e205206. Finite binomial-kernel formula for every
numerator-three source. Kernels are positive; the explicit seed is signed.
No summation-preservation claim is made. -/
namespace MathGKM.Markov
noncomputable section
open PowerSeries Finset
set_option maxHeartbeats 3000000
attribute [local irreducible] U V S quadInverseM9E2 quadDenomM9E2

def threePerturbM9E2 : BiPoly := U*(3*(V^2+V+1)+3*U*(V+1)+U^2)
def threeInverseM9E2 : PowerSeries BiPoly :=
 quadInverseM9E2 V (V^2) (U*V)*quadInverseM9E2 1 (V^3) threePerturbM9E2
def threeKernelM9E2 (q : ℕ) : BiPoly :=
 ∑ k∈range (q+1),quadCoeffM9E2 V (V^2) (U*V) k*
   quadCoeffM9E2 1 (V^3) threePerturbM9E2 (q-k)

theorem three_denominator_inverseM9E2 : threeDenomM9E2*threeInverseM9E2=1 := by
 have hd : threeDenomM9E2=quadDenomM9E2 V (V^2) (U*V)*
     quadDenomM9E2 1 (V^3) threePerturbM9E2 := by
   rw [three_denominator_factorM9E2]
   simp only [quadDenomM9E2,threePerturbM9E2,map_one,one_mul]
 rw [hd,threeInverseM9E2]
 calc
  _ = (quadDenomM9E2 V (V^2) (U*V)*quadInverseM9E2 V (V^2) (U*V))*
    (quadDenomM9E2 1 (V^3) threePerturbM9E2*quadInverseM9E2 1 (V^3) threePerturbM9E2) := by ring
  _ = 1 := by rw [quad_inverseM9E2,quad_inverseM9E2,one_mul]

theorem three_inverse_coeffM9E2 (q : ℕ) :
 PowerSeries.coeff q threeInverseM9E2=threeKernelM9E2 q := by
 rw [threeInverseM9E2,PowerSeries.coeff_mul,Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
 simp only [quad_coeffM9E2,threeKernelM9E2]

theorem three_series_solutionM9E2 (r : Bool) :
 threeSeriesM9E2 r=threeNumerM9E2 r*threeInverseM9E2 := by
 calc
  _ = threeSeriesM9E2 r*(threeDenomM9E2*threeInverseM9E2) := by
    rw [three_denominator_inverseM9E2,mul_one]
  _ = (threeDenomM9E2*threeSeriesM9E2 r)*threeInverseM9E2 := by ring
  _ = _ := by rw [three_series_equationM9E2]

def threeExplicitM9E2 (q : ℕ) (r : Bool) : BiPoly :=
 ∑ k∈range (q+1),PowerSeries.coeff k (threeNumerM9E2 r)*threeKernelM9E2 (q-k)

theorem three_explicit_formulaM9E2 (q : ℕ) (r : Bool) :
 threePolyM9E2 q r=threeExplicitM9E2 q r := by
 have h := congrArg (PowerSeries.coeff q) (three_series_solutionM9E2 r)
 rw [PowerSeries.coeff_mul,Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk] at h
 simpa only [threeSeriesM9E2,PowerSeries.coeff_mk,three_inverse_coeffM9E2,threeExplicitM9E2] using h

theorem three_kernel_nonnegM9E2 (q : ℕ) : PolyNonneg16 (threeKernelM9E2 q) := by
 have hu := poly_U_nonneg16
 have hv := poly_V_nonneg16
 have h1 := poly_one_nonneg16
 have hv2 : PolyNonneg16 (V^2) := by simpa only [pow_two] using poly_mul_nonneg16 hv hv
 have hv3 : PolyNonneg16 (V^3) := by simpa only [show (3:ℕ)=2+1 by rfl,pow_succ] using poly_mul_nonneg16 hv2 hv
 have hu2 : PolyNonneg16 (U^2) := by simpa only [pow_two] using poly_mul_nonneg16 hu hu
 have h3 : PolyNonneg16 (3:BiPoly) := by
   convert poly_add_nonneg16 (poly_add_nonneg16 h1 h1) h1 using 1 <;> norm_num
 have hc : PolyNonneg16 threePerturbM9E2 :=
   poly_mul_nonneg16 hu (poly_add_nonneg16 (poly_add_nonneg16
     (poly_mul_nonneg16 h3 (poly_add_nonneg16 (poly_add_nonneg16 hv2 hv) h1))
     (poly_mul_nonneg16 (poly_mul_nonneg16 h3 hu) (poly_add_nonneg16 hv h1))) hu2)
 intro i j
 simp only [threeKernelM9E2,coeff,Polynomial.finsetSum_coeff]
 apply sum_nonneg
 intro k hk
 exact poly_mul_nonneg16
   (quad_coeff_nonnegM9E2 V (V^2) (U*V) hv hv2 (poly_mul_nonneg16 hu hv) k)
   (quad_coeff_nonnegM9E2 1 (V^3) threePerturbM9E2 h1 hv3 hc (q-k)) i j

theorem source_three_explicitM9E2 (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1≤q ∧ (frame path).mid.b=3*q+(if r then 1 else 2) ∧
   ∀ i j, coeff (frame path).mid.p i j=coeff (threeExplicitM9E2 q r) i j := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_cubicM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro i j
 rw [hp,three_explicit_formulaM9E2]

def ThreeKernelLCM9E2 : Prop := ∀ q : ℕ, 1≤q → ∀ r,
 GlobalLC18 (threeExplicitM9E2 q r)

theorem root_iff_three_kernelM9E2 : Conjecture63 ↔ ThreeKernelLCM9E2 ∧ OtherFourM9E2 := by
 rw [root_iff_three_and_fourM9E2]
 unfold ThreeGoalM9E2 ThreeKernelLCM9E2
 simp only [three_explicit_formulaM9E2]

end
end MathGKM.Markov
