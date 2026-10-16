import MarkovLinearCenterM553
import MarkovSourceMomentM37B
/-! Machine-authored 55306a3b. Conditional source adapters, retaining the
full forward-factor hypotheses. No universal certificate is assumed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
attribute [local irreducible] frame coeff

theorem source_horizontal_linearM553 (path : List Bool) (i j : ℕ) (C : ℝ)
 (hb : 2*j+1 ≤ (frame path).mid.b)
 (hc : 0 ≤ linearMomentM553
   ((hresidualM511 (X:ℤ[X]) (sourceWord28 path) j).map (Int.castRingHom ℝ))
   ((frame path).mid.b-2*j-1) i C) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
   coeff (frame path).mid.p (i+1) j^2 := by
 apply (source_horizontal_moment_iffM37B path i j hb).mpr
 apply linearMoment_nonnegM553 _ _ _ C _ hc
 intro r
 simpa using hresidual_coeff_nonnegM511 path j r

theorem source_vertical_linearM553 (path : List Bool) (i j : ℕ) (C : ℝ)
 (ha : 2*i+1 ≤ (frame path).mid.a)
 (hc : 0 ≤ linearMomentM553 ((vresidualM9E1 path i).map (Int.castRingHom ℝ))
   ((frame path).mid.a-2*i-1) j C) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
   coeff (frame path).mid.p i (j+1)^2 := by
 apply (source_vertical_moment_iffM37B path i j ha).mpr
 apply linearMoment_nonnegM553 _ _ _ C _ hc
 intro r
 simpa using vresidual_coeff_nonnegM9E1 path i r

theorem source_diagonal_linearM553 (path : List Bool) (r i j : ℕ) (C : ℝ)
 (hd : i+j+2+r=(frame path).mid.a+(frame path).mid.b-1)
 (hr : 2*r ≤ (frame path).mid.a+(frame path).mid.b-1)
 (hc : 0 ≤ linearMomentM553 ((quotientSlice774 path r).map (Int.castRingHom ℝ))
   ((frame path).mid.a+(frame path).mid.b-1-2*r) i C) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
   coeff (frame path).mid.p (i+1) (j+1)^2 := by
 apply (source_diagonal_moment_iffM37B path r i j hd hr).mpr
 apply linearMoment_nonnegM553 _ _ _ C _ hc
 intro s
 simpa using quotient_slice_nonneg774 path r s

end
end MathGKM.Markov
