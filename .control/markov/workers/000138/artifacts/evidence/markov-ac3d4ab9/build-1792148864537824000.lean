import MarkovBinomialGapMAC3
import MarkovSourceInteriorMF1E
/-! Machine-authored ac3d4ab9. Exact polygon lower support and actual-source
adapters for the asymmetric binomial-mixture criterion. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 1200000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff

theorem below_polygon_floorMAC3 (a b r k : ℕ) (hb : 0<b)
 (hk : k<a-a*r/b) : b*k+a*r<a*b := by
 have hkr : k+a*r/b+1 ≤ a := by omega
 have hm := Nat.mul_le_mul_left b hkr
 have hd := Nat.mod_add_div (a*r) b
 have hr := Nat.mod_lt (a*r) hb
 nlinarith

theorem horizontal_residual_lowerMAC3 (path : List Bool) (r k : ℕ)
 (hb : 2*r+1 ≤ (frame path).mid.b)
 (hk : k<(frame path).mid.a-(frame path).mid.a*r/(frame path).mid.b) :
 (hresidualM511 (X:ℤ[X]) (sourceWord28 path) r).coeff k=0 := by
 have h := coeff_le_smoothedMF1E
   (hresidualM511 (X:ℤ[X]) (sourceWord28 path) r)
   ((frame path).mid.b-2*r-1) k (hresidual_coeff_nonnegM511 path r)
 rw [←horizontal_all_order_factorM511 path r hb,swap_coeff46] at h
 have hz : coeff (frame path).mid.p k r=0 := by
   apply raw_outside_polygon18 path k r
   intro hp
   have hl := below_polygon_floorMAC3 (frame path).mid.a (frame path).mid.b r k (by omega) hk
   exact (Nat.not_lt_of_ge hp.1) hl
 rw [hz] at h
 exact le_antisymm h (hresidual_coeff_nonnegM511 path r k)

theorem vertical_residual_lowerMAC3 (path : List Bool) (r k : ℕ)
 (ha : 2*r+1 ≤ (frame path).mid.a)
 (hk : k<(frame path).mid.b-(frame path).mid.b*r/(frame path).mid.a) :
 (vresidualM9E1 path r).coeff k=0 := by
 have h := coeff_le_smoothedMF1E (vresidualM9E1 path r)
   ((frame path).mid.a-2*r-1) k (vresidual_coeff_nonnegM9E1 path r)
 rw [show (1+(X:ℤ[X]))=X+1 by ring,←vertical_all_order_factorM9E1 path r ha] at h
 have hz : coeff (frame path).mid.p r k=0 := by
   apply raw_outside_polygon18 path r k
   intro hp
   have hl := below_polygon_floorMAC3 (frame path).mid.b (frame path).mid.a r k (by omega) hk
   nlinarith [hp.1]
 have hz' : ((frame path).mid.p.coeff r).coeff k=0 := by
   simpa only [coeff] using hz
 rw [hz'] at h
 exact le_antisymm h (vresidual_coeff_nonnegM9E1 path r k)

def HorizontalRegionMAC3 (a b i j : ℕ) : Prop :=
 2*j+1 ≤ b ∧ MixtureRegionMAC3 (b-2*j-1) i (a-a*j/b) (a+j)

def VerticalRegionMAC3 (a b i j : ℕ) : Prop :=
 2*i+1 ≤ a ∧ MixtureRegionMAC3 (a-2*i-1) j (b-b*i/a) (b+i)

def DiagonalRegionMAC3 (a b i j : ℕ) : Prop :=
 ∃ r, i+j+2+r=a+b-1 ∧ r ≤ i ∧ r ≤ j ∧
   r*(r-1)*(a+b-1-2*r+2) ≤ 2*(i-r+2)*(j-r+2)

theorem source_horizontal_regionMAC3 (path : List Bool) (i j : ℕ)
 (h : HorizontalRegionMAC3 (frame path).mid.a (frame path).mid.b i j) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) j^2 := by
 obtain ⟨hb,h⟩ := h
 have hd : (hresidualM511 (X:ℤ[X]) (sourceWord28 path) j).natDegree ≤ (frame path).mid.a+j :=
   natDegree_le_iff_coeff_eq_zero.mpr (fun k hk =>
     horizontal_residual_boundMEA423 path j k (by omega))
 have hh := integer_binomial_region_lcMAC3
   (hresidualM511 (X:ℤ[X]) (sourceWord28 path) j)
   ((frame path).mid.b-2*j-1) i
   ((frame path).mid.a-(frame path).mid.a*j/(frame path).mid.b) ((frame path).mid.a+j)
   hd (hresidual_coeff_nonnegM511 path j) (horizontal_residual_lowerMAC3 path j · hb) h
 rw [←horizontal_all_order_factorM511 path j hb] at hh
 simpa only [swap_coeff46] using hh

theorem source_vertical_regionMAC3 (path : List Bool) (i j : ℕ)
 (h : VerticalRegionMAC3 (frame path).mid.a (frame path).mid.b i j) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
 coeff (frame path).mid.p i (j+1)^2 := by
 obtain ⟨ha,h⟩ := h
 have hd : (vresidualM9E1 path i).natDegree ≤ (frame path).mid.b+i :=
   natDegree_le_iff_coeff_eq_zero.mpr (fun k hk =>
     vertical_residual_boundMEA423 path i k (by omega))
 have hh := integer_binomial_region_lcMAC3 (vresidualM9E1 path i)
   ((frame path).mid.a-2*i-1) j
   ((frame path).mid.b-(frame path).mid.b*i/(frame path).mid.a) ((frame path).mid.b+i)
   hd (vresidual_coeff_nonnegM9E1 path i) (vertical_residual_lowerMAC3 path i · ha) h
 rw [show (1+(X:ℤ[X]))=X+1 by ring,←vertical_all_order_factorM9E1 path i ha] at hh
 simpa only [coeff] using hh

theorem source_diagonal_regionMAC3 (path : List Bool) (i j : ℕ)
 (h : DiagonalRegionMAC3 (frame path).mid.a (frame path).mid.b i j) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 obtain ⟨r,hd,hi,hj,hg⟩ := h
 have hr : 2*r ≤ (frame path).mid.a+(frame path).mid.b-1 := by omega
 have hp : (quotientSlice774 path r).natDegree ≤ r :=
   natDegree_le_iff_coeff_eq_zero.mpr (quotient_slice_degree725 path r)
 have h := integer_binomial_region_lcMAC3 (quotientSlice774 path r)
   ((frame path).mid.a+(frame path).mid.b-1-2*r) i 0 r hp
   (quotient_slice_nonneg774 path r) (by intro k hk; omega)
   ⟨hi,by omega,by
     simpa only [Nat.sub_zero,Nat.add_zero,
       show (frame path).mid.a+(frame path).mid.b-1-2*r-i=j-r+2 by omega] using hg⟩
 rw [←upper_slice_factor774 path r hr] at h
 rw [diagonal_raw_coeff_on16 path r i (j+2) (by omega),
   diagonal_raw_coeff_on16 path r (i+2) j (by omega),
   diagonal_raw_coeff_on16 path r (i+1) (j+1) (by omega)] at h
 exact h
end
end MathGKM.Markov
