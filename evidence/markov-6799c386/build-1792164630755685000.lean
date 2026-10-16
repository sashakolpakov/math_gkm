import MarkovTwoPositiveM679
import MarkovPositiveKernelM679
/-! Machine-authored 6799c386. An explicit finite polynomial formula for the
actual numerator-two family; all kernels are binomial sums. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 3000000
attribute [local irreducible] U V geoM679

theorem two_term_splitM679 (r : ℕ) :
 twoStepM679^r*twoSeedM679=
 PowerSeries.C (2*U*V*(U*(2*(V+1)+U))^r)*
   ((1+PowerSeries.C V*PowerSeries.X)*
     (geoM679 (1:BiPoly)^r*geoM679 V^1*geoM679 (V^2)^(r+2)))+
 PowerSeries.C (U^2*(U*(2*(V+1)+U))^r)*
   ((1+PowerSeries.C V*PowerSeries.X)*
     (geoM679 (1:BiPoly)^(r+1)*geoM679 V^0*geoM679 (V^2)^(r+2))) := by
 simp only [twoStepM679,twoSeedM679,map_mul,map_pow,map_ofNat,
   mul_pow,pow_add,pow_one,pow_zero]
 ring

theorem two_term_coeffM679 (r n : ℕ) :
 PowerSeries.coeff n (twoStepM679^r*twoSeedM679)=
 2*U*V*(U*(2*(V+1)+U))^r*shiftKernelM679 V r 1 (r+2) n+
 U^2*(U*(2*(V+1)+U))^r*shiftKernelM679 V (r+1) 0 (r+2) n := by
 rw [two_term_splitM679,map_add,PowerSeries.coeff_C_mul,
   PowerSeries.coeff_C_mul,shifted_kernel_coeffM679,shifted_kernel_coeffM679]

def twoExplicitM679 (q : ℕ) : BiPoly :=
 V^(2*q+1)*(V+1)+∑ r∈range (q+1),
   (2*U*V*(U*(2*(V+1)+U))^r*shiftKernelM679 V r 1 (r+2) (q-r)+
   U^2*(U*(2*(V+1)+U))^r*shiftKernelM679 V (r+1) 0 (r+2) (q-r))

theorem two_explicit_formulaM679 (q : ℕ) : twoPolyMEC6 q=twoExplicitM679 q := by
 rw [two_positive_finiteM679]
 simp only [twoExplicitM679,two_term_coeffM679]

theorem source_two_explicitM679 (path : List Bool) (ha : (frame path).mid.a=2) :
 ∃ q : ℕ, 1≤q ∧ (frame path).mid.b=2*q+1 ∧
   (frame path).mid.p=twoExplicitM679 q := by
 obtain ⟨q,hq,hb,hp⟩ := source_two_squares3556 path ha
 exact ⟨q,hq,hb,hp.trans (two_explicit_formulaM679 q)⟩

theorem pos_kernel_nonnegM679 (m l s n : ℕ) :
 PolyNonneg16 (posKernelM679 V m l s n) := by
 intro i j
 simp only [posKernelM679,coeff,Polynomial.finsetSum_coeff]
 apply sum_nonneg
 intro ac hac
 apply sum_nonneg
 intro ab hab
 simp only [V,←map_pow,←map_natCast,←map_mul,
   Polynomial.coeff_C,Polynomial.coeff_natCast_mul]
 split_ifs <;> simp only [Polynomial.coeff_zero,Polynomial.coeff_X_pow]
 all_goals split_ifs <;> positivity

end
end MathGKM.Markov
