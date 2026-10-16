import MarkovSourceRegionMAC3
import MarkovBinomialVarianceMAC3
/-! Machine-authored ac3d4ab9. Actual-source variance-region adapters. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 1200000
attribute [local irreducible] frame coeff
def HorizontalVarianceMAC3 (a b i j : ℕ) : Prop :=
 2*j+1 ≤ b ∧ VarianceRegionMAC3 (b-2*j-1) i (a-a*j/b) (a+j)

def VerticalVarianceMAC3 (a b i j : ℕ) : Prop :=
 2*i+1 ≤ a ∧ VarianceRegionMAC3 (a-2*i-1) j (b-b*i/a) (b+i)

def DiagonalVarianceMAC3 (a b i j : ℕ) : Prop :=
 ∃ r, i+j+2+r=a+b-1 ∧ r ≤ i ∧ r ≤ j ∧
   (a+b-1-2*r+2)*r^2 ≤ 4*(i-r+2)*(j-r+2)

theorem source_horizontal_varianceMAC3 (path : List Bool) (i j : ℕ)
 (h : HorizontalVarianceMAC3 (frame path).mid.a (frame path).mid.b i j) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) j^2 := by
 obtain ⟨hb,h⟩ := h
 have hd : (hresidualM511 (X:ℤ[X]) (sourceWord28 path) j).natDegree ≤ (frame path).mid.a+j :=
   natDegree_le_iff_coeff_eq_zero.mpr (fun k hk =>
     horizontal_residual_boundMEA423 path j k (by omega))
 have hh := integer_binomial_variance_lcMAC3
   (hresidualM511 (X:ℤ[X]) (sourceWord28 path) j)
   ((frame path).mid.b-2*j-1) i
   ((frame path).mid.a-(frame path).mid.a*j/(frame path).mid.b) ((frame path).mid.a+j)
   hd (hresidual_coeff_nonnegM511 path j) (horizontal_residual_lowerMAC3 path j · hb) h
 rw [←horizontal_all_order_factorM511 path j hb] at hh
 simpa only [swap_coeff46] using hh

theorem source_vertical_varianceMAC3 (path : List Bool) (i j : ℕ)
 (h : VerticalVarianceMAC3 (frame path).mid.a (frame path).mid.b i j) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
 coeff (frame path).mid.p i (j+1)^2 := by
 obtain ⟨ha,h⟩ := h
 have hd : (vresidualM9E1 path i).natDegree ≤ (frame path).mid.b+i :=
   natDegree_le_iff_coeff_eq_zero.mpr (fun k hk =>
     vertical_residual_boundMEA423 path i k (by omega))
 have hh := integer_binomial_variance_lcMAC3 (vresidualM9E1 path i)
   ((frame path).mid.a-2*i-1) j
   ((frame path).mid.b-(frame path).mid.b*i/(frame path).mid.a) ((frame path).mid.b+i)
   hd (vresidual_coeff_nonnegM9E1 path i) (vertical_residual_lowerMAC3 path i · ha) h
 rw [show (1+(X:ℤ[X]))=X+1 by ring,←vertical_all_order_factorM9E1 path i ha] at hh
 simpa only [coeff] using hh

theorem source_diagonal_varianceMAC3 (path : List Bool) (i j : ℕ)
 (h : DiagonalVarianceMAC3 (frame path).mid.a (frame path).mid.b i j) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 obtain ⟨r,hd,hi,hj,hg⟩ := h
 have hr : 2*r ≤ (frame path).mid.a+(frame path).mid.b-1 := by omega
 have hp : (quotientSlice774 path r).natDegree ≤ r :=
   natDegree_le_iff_coeff_eq_zero.mpr (quotient_slice_degree725 path r)
 have h := integer_binomial_variance_lcMAC3 (quotientSlice774 path r)
   ((frame path).mid.a+(frame path).mid.b-1-2*r) i 0 r hp
   (quotient_slice_nonneg774 path r) (by intro k hk; omega)
   ⟨by omega,hi,by omega,by
     simpa only [Nat.sub_zero,Nat.add_zero,
       show (frame path).mid.a+(frame path).mid.b-1-2*r-i=j-r+2 by omega] using hg⟩
 rw [←upper_slice_factor774 path r hr] at h
 rw [diagonal_raw_coeff_on16 path r i (j+2) (by omega),
   diagonal_raw_coeff_on16 path r (i+2) j (by omega),
   diagonal_raw_coeff_on16 path r (i+1) (j+1) (by omega)] at h
 exact h
end
end MathGKM.Markov
