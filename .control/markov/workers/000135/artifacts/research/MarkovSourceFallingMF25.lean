import MarkovFallingGapMF25
import MarkovResidualEndpointsMEA423
/-! Machine-authored f25b03a1. Exact all-order source/raw gap criteria in
the forward binomial-factor ranges. No gap sign is assumed or proved. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
attribute [local irreducible] frame coeff

theorem integer_smoothed_iffMF25 (P : ℤ[X]) (n d : ℕ)
 (hP : P.natDegree ≤ d) (hd : d ≤ n) :
 (∀ i, (((1+X)^(n-d)*P):ℤ[X]).coeff i *
        (((1+X)^(n-d)*P):ℤ[X]).coeff (i+2) ≤
        (((1+X)^(n-d)*P):ℤ[X]).coeff (i+1)^2) ↔
 (∀ i j, n=i+j+2 →
   0 ≤ fallingGapMF25 (P.map (Int.castRingHom ℝ)) d i j) := by
 have hp : (P.map (Int.castRingHom ℝ)).natDegree ≤ d :=
   le_trans Polynomial.natDegree_map_le hP
 have h := smoothed_all_iffMF25 (P.map (Int.castRingHom ℝ)) n d hp hd
 have he : (1+(X:ℝ[X]))^(n-d)*P.map (Int.castRingHom ℝ)=
   (((1+X)^(n-d)*P):ℤ[X]).map (Int.castRingHom ℝ) := by simp
 rw [he] at h
 simp only [Polynomial.coeff_map] at h
 change (∀ i, ((((1+X)^(n-d)*P):ℤ[X]).coeff i:ℝ) *
     ((((1+X)^(n-d)*P):ℤ[X]).coeff (i+2):ℝ) ≤
     ((((1+X)^(n-d)*P):ℤ[X]).coeff (i+1):ℝ)^2) ↔ _ at h
 simpa only [←Int.cast_mul,←Int.cast_pow,Int.cast_le] using h

theorem source_horizontal_falling_iffMF25 (path : List Bool) (r : ℕ)
 (hb : 2*r+1 ≤ (frame path).mid.b) :
 (∀ i, coeff (frame path).mid.p i r * coeff (frame path).mid.p (i+2) r ≤
   coeff (frame path).mid.p (i+1) r^2) ↔
 (∀ i j, (frame path).mid.a+(frame path).mid.b-1-r=i+j+2 →
   0 ≤ fallingGapMF25
     ((hresidualM511 (X:ℤ[X]) (sourceWord28 path) r).map (Int.castRingHom ℝ))
     (r+(frame path).mid.a) i j) := by
 have hp : (hresidualM511 (X:ℤ[X]) (sourceWord28 path) r).natDegree ≤ r+(frame path).mid.a :=
   natDegree_le_iff_coeff_eq_zero.mpr (horizontal_residual_boundMEA423 path r)
 have ha := (frame_reduced path).1
 have h := integer_smoothed_iffMF25 (hresidualM511 (X:ℤ[X]) (sourceWord28 path) r)
   ((frame path).mid.a+(frame path).mid.b-1-r) (r+(frame path).mid.a) hp (by omega)
 have he : (frame path).mid.a+(frame path).mid.b-1-r-(r+(frame path).mid.a)=
   (frame path).mid.b-2*r-1 := by omega
 rw [he,←horizontal_all_order_factorM511 path r hb] at h
 simpa only [swap_coeff46] using h

theorem source_vertical_falling_iffMF25 (path : List Bool) (r : ℕ)
 (ha : 2*r+1 ≤ (frame path).mid.a) :
 (∀ j, coeff (frame path).mid.p r j * coeff (frame path).mid.p r (j+2) ≤
   coeff (frame path).mid.p r (j+1)^2) ↔
 (∀ i j, (frame path).mid.a+(frame path).mid.b-1-r=i+j+2 →
   0 ≤ fallingGapMF25 ((vresidualM9E1 path r).map (Int.castRingHom ℝ))
     (r+(frame path).mid.b) i j) := by
 have hp : (vresidualM9E1 path r).natDegree ≤ r+(frame path).mid.b :=
   natDegree_le_iff_coeff_eq_zero.mpr (vertical_residual_boundMEA423 path r)
 have hb := (frame_reduced path).2.1
 have h := integer_smoothed_iffMF25 (vresidualM9E1 path r)
   ((frame path).mid.a+(frame path).mid.b-1-r) (r+(frame path).mid.b) hp (by omega)
 have he : (frame path).mid.a+(frame path).mid.b-1-r-(r+(frame path).mid.b)=
   (frame path).mid.a-2*r-1 := by omega
 rw [he,show (1+(X:ℤ[X]))=X+1 by ring,←vertical_all_order_factorM9E1 path r ha] at h
 simpa only [coeff] using h
end
end MathGKM.Markov
