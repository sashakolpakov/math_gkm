import MarkovMomentAllM37B
import MarkovSourceVarianceMAC3
/-! Machine-authored 37bf1d20. Exact source moment-gap equivalences throughout
the forward factor ranges, without any full-overlap index restriction. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 2000000
attribute [local irreducible] frame coeff

theorem source_horizontal_moment_iffM37B (path : List Bool) (i j : ℕ)
 (hb : 2*j+1 ≤ (frame path).mid.b) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
   coeff (frame path).mid.p (i+1) j^2 ↔
 0 ≤ momentGapM37B
   ((hresidualM511 (X:ℤ[X]) (sourceWord28 path) j).map (Int.castRingHom ℝ))
   ((frame path).mid.b-2*j-1) i := by
 have h := integer_moment_lc_iffM37B
   (hresidualM511 (X:ℤ[X]) (sourceWord28 path) j)
   ((frame path).mid.b-2*j-1) i
 rw [←horizontal_all_order_factorM511 path j hb] at h
 simpa only [swap_coeff46] using h

theorem source_vertical_moment_iffM37B (path : List Bool) (i j : ℕ)
 (ha : 2*i+1 ≤ (frame path).mid.a) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
   coeff (frame path).mid.p i (j+1)^2 ↔
 0 ≤ momentGapM37B ((vresidualM9E1 path i).map (Int.castRingHom ℝ))
   ((frame path).mid.a-2*i-1) j := by
 have h := integer_moment_lc_iffM37B (vresidualM9E1 path i)
   ((frame path).mid.a-2*i-1) j
 rw [show (1+(X:ℤ[X]))=X+1 by ring,←vertical_all_order_factorM9E1 path i ha] at h
 simpa only [coeff] using h

theorem source_diagonal_moment_iffM37B (path : List Bool) (r i j : ℕ)
 (hd : i+j+2+r=(frame path).mid.a+(frame path).mid.b-1)
 (hr : 2*r ≤ (frame path).mid.a+(frame path).mid.b-1) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
   coeff (frame path).mid.p (i+1) (j+1)^2 ↔
 0 ≤ momentGapM37B ((quotientSlice774 path r).map (Int.castRingHom ℝ))
   ((frame path).mid.a+(frame path).mid.b-1-2*r) i := by
 have h := integer_moment_lc_iffM37B (quotientSlice774 path r)
   ((frame path).mid.a+(frame path).mid.b-1-2*r) i
 rw [←upper_slice_factor774 path r hr] at h
 rw [diagonal_raw_coeff_on16 path r i (j+2) (by omega),
   diagonal_raw_coeff_on16 path r (i+2) j (by omega),
   diagonal_raw_coeff_on16 path r (i+1) (j+1) (by omega)] at h
 exact h

end
end MathGKM.Markov
