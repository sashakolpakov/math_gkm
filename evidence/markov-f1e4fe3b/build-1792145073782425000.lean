import MarkovBinomialInteriorMF1E
import MarkovResidualEndpointsMEA423
/-! Machine-authored f1e4fe3b. Actual-source raw inequalities in unbounded
middle regions, using nonnegative residuals without assuming their LC. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 600000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff

theorem coeff_le_smoothedMF1E (P : ℤ[X]) (n k : ℕ)
 (hP : ∀ r, 0 ≤ P.coeff r) :
 P.coeff k ≤ (((1+X)^n*P):ℤ[X]).coeff k := by
 rw [Polynomial.coeff_mul]
 have h := Finset.single_le_sum
   (f := fun z : ℕ×ℕ => ((1+(X:ℤ[X]))^n).coeff z.1*P.coeff z.2)
   (s := Finset.HasAntidiagonal.antidiagonal k) (a := (0,k))
   (fun z _ => mul_nonneg (by rw [Polynomial.coeff_one_add_X_pow]; positivity) (hP z.2))
   (by simp)
 simpa only [Polynomial.coeff_one_add_X_pow,Nat.choose_zero_right,Nat.cast_one,one_mul] using h

theorem horizontal_residual_lowerMF1E (path : List Bool) (r k : ℕ)
 (hb : 2*r+1 ≤ (frame path).mid.b) (hk : k<(frame path).mid.a-r) :
 (hresidualM511 (X:ℤ[X]) (sourceWord28 path) r).coeff k=0 := by
 have h := coeff_le_smoothedMF1E
   (hresidualM511 (X:ℤ[X]) (sourceWord28 path) r)
   ((frame path).mid.b-2*r-1) k (hresidual_coeff_nonnegM511 path r)
 rw [←horizontal_all_order_factorM511 path r hb,swap_coeff46] at h
 have hz : coeff (frame path).mid.p k r=0 := by
   apply raw_outside_polygon18 path k r
   intro hp
   have hab := (frame_reduced path).2.1
   have hb0 : 0<(frame path).mid.b := by omega
   have hkr : k+r<(frame path).mid.a := by omega
   have h1 := Nat.mul_lt_mul_of_pos_left hkr hb0
   have h2 := Nat.mul_le_mul_right r (Nat.le_of_lt hab)
   nlinarith [hp.1]
 rw [hz] at h
 exact le_antisymm h (hresidual_coeff_nonnegM511 path r k)

theorem vertical_residual_lowerMF1E (path : List Bool) (c r k : ℕ)
 (ha : 2*r+1 ≤ (frame path).mid.a)
 (hslope : (frame path).mid.b ≤ c*(frame path).mid.a)
 (hk : k<(frame path).mid.b-c*r) :
 (vresidualM9E1 path r).coeff k=0 := by
 have h := coeff_le_smoothedMF1E (vresidualM9E1 path r)
   ((frame path).mid.a-2*r-1) k (vresidual_coeff_nonnegM9E1 path r)
 rw [show (1+(X:ℤ[X]))=X+1 by ring,←vertical_all_order_factorM9E1 path r ha] at h
 have hz : coeff (frame path).mid.p r k=0 := by
   apply raw_outside_polygon18 path r k
   intro hp
   have ha0 := (frame_reduced path).1
   have hkr : k+c*r<(frame path).mid.b := by omega
   have h1 := Nat.mul_lt_mul_of_pos_left hkr ha0
   have h2 := Nat.mul_le_mul_right r hslope
   nlinarith [hp.1]
 have hz' : ((frame path).mid.p.coeff r).coeff k=0 := by
   simpa only [coeff] using hz
 rw [hz'] at h
 exact le_antisymm h (vresidual_coeff_nonnegM9E1 path r k)

def HorizontalMiddleMF1E (a b i j : ℕ) : Prop :=
 2*j+1 ≤ b ∧
 a+j+(a+j-(a-j))^2 ≤ i ∧
 i+2+(a+j-(a-j))^2 ≤ b-2*j-1+(a-j)

theorem source_horizontal_middleMF1E (path : List Bool) (i j : ℕ)
 (h : HorizontalMiddleMF1E (frame path).mid.a (frame path).mid.b i j) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤ coeff (frame path).mid.p (i+1) j^2 := by
 obtain ⟨hb,hk,hn⟩ := h
 have hd : (hresidualM511 (X:ℤ[X]) (sourceWord28 path) j).natDegree ≤ (frame path).mid.a+j :=
   natDegree_le_iff_coeff_eq_zero.mpr (fun k hk =>
     horizontal_residual_boundMEA423 path j k (by omega))
 have hh := integer_binomial_interior_lcMF1E
   (hresidualM511 (X:ℤ[X]) (sourceWord28 path) j)
   ((frame path).mid.b-2*j-1) i ((frame path).mid.a-j) ((frame path).mid.a+j)
   hd (hresidual_coeff_nonnegM511 path j) (horizontal_residual_lowerMF1E path j · hb) hk hn
 rw [←horizontal_all_order_factorM511 path j hb] at hh
 simpa only [swap_coeff46] using hh

def VerticalMiddleMF1E (a b i j : ℕ) : Prop :=
 ∃ c : ℕ, 2*i+1 ≤ a ∧ b ≤ c*a ∧
 b+i+(b+i-(b-c*i))^2 ≤ j ∧
 j+2+(b+i-(b-c*i))^2 ≤ a-2*i-1+(b-c*i)

theorem source_vertical_middleMF1E (path : List Bool) (i j : ℕ)
 (h : VerticalMiddleMF1E (frame path).mid.a (frame path).mid.b i j) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤ coeff (frame path).mid.p i (j+1)^2 := by
 obtain ⟨c,ha,hs,hk,hn⟩ := h
 have hd : (vresidualM9E1 path i).natDegree ≤ (frame path).mid.b+i :=
   natDegree_le_iff_coeff_eq_zero.mpr (fun k hk =>
     vertical_residual_boundMEA423 path i k (by omega))
 have hh := integer_binomial_interior_lcMF1E (vresidualM9E1 path i)
   ((frame path).mid.a-2*i-1) j ((frame path).mid.b-c*i) ((frame path).mid.b+i)
   hd (vresidual_coeff_nonnegM9E1 path i)
   (fun k hk => vertical_residual_lowerMF1E path c i k ha hs hk) hk hn
 rw [show (1+(X:ℤ[X]))=X+1 by ring,←vertical_all_order_factorM9E1 path i ha] at hh
 simpa only [coeff] using hh

theorem source_diagonal_middleMF1E (path : List Bool) (r i j : ℕ)
 (hd : i+j+2+r=(frame path).mid.a+(frame path).mid.b-1)
 (hi : r+r^2 ≤ i) (hj : r+r^2 ≤ j) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤ coeff (frame path).mid.p (i+1) (j+1)^2 := by
 have hr : 2*r ≤ (frame path).mid.a+(frame path).mid.b-1 := by omega
 have hp : (quotientSlice774 path r).natDegree ≤ r :=
   natDegree_le_iff_coeff_eq_zero.mpr (quotient_slice_degree725 path r)
 have h := integer_binomial_interior_lcMF1E (quotientSlice774 path r)
   ((frame path).mid.a+(frame path).mid.b-1-2*r) i 0 r hp
   (quotient_slice_nonneg774 path r) (by intro k hk; omega)
   (by simpa using hi) (by simpa using (show i+2+r^2 ≤ (frame path).mid.a+(frame path).mid.b-1-2*r by omega))
 rw [←upper_slice_factor774 path r hr] at h
 rw [diagonal_raw_coeff_on16 path r i (j+2) (by omega),
   diagonal_raw_coeff_on16 path r (i+2) j (by omega),
   diagonal_raw_coeff_on16 path r (i+1) (j+1) (by omega)] at h
 exact h
end
end MathGKM.Markov
