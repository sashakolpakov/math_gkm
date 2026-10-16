import MarkovVerticalPairMEA423
import MarkovTopLC1998

/-! Machine-authored ea4238fc. Vertical all-order residual intervals and
conditional raw LC transfer. No adjacent residual inequality is assumed silently. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff

theorem vertical_residual_interval_natMEA423 (path : List Bool) (r i k l : ℕ)
 (hik : i≤k) (hkl : k≤l)
 (hi : 0<(vresidualM9E1 path r).coeff i) (hl : 0<(vresidualM9E1 path r).coeff l) :
 0<(vresidualM9E1 path r).coeff k := by
 have hlr : l≤r+(frame path).mid.b := by
   by_contra hn
   rw [vertical_residual_boundMEA423 path r l (by omega)] at hl
   omega
 exact vertical_residual_filledMEA423 path r i k hi hik (by omega)

theorem vertical_residual_intervalMEA423 (path : List Bool) (r : ℕ) :
 IntervalSupport774 (CoeffSeq ((vresidualM9E1 path r).map (Int.castRingHom ℝ))) := by
 have he : CoeffSeq ((vresidualM9E1 path r).map (Int.castRingHom ℝ))=
   zeroSeq725 (vresidualM9E1 path r).coeff := by
   funext k
   simp only [CoeffSeq,zeroSeq725,Polynomial.coeff_map]
   rfl
 rw [he]
 exact zeroSeq_interval725 _ (vertical_residual_interval_natMEA423 path r)

theorem vertical_residual_cross_iffMEA423 (path : List Bool) (r : ℕ) :
 CrossLC (CoeffSeq ((vresidualM9E1 path r).map (Int.castRingHom ℝ))) ↔
 ∀ i, (vresidualM9E1 path r).coeff i*(vresidualM9E1 path r).coeff (i+2) ≤
       (vresidualM9E1 path r).coeff (i+1)^2 := by
 have he : CoeffSeq ((vresidualM9E1 path r).map (Int.castRingHom ℝ))=
   zeroSeq725 (vresidualM9E1 path r).coeff := by
   funext k
   simp only [CoeffSeq,zeroSeq725,Polynomial.coeff_map]
   rfl
 rw [he]
 apply zeroSeq_cross_iff725 _ (vresidual_coeff_nonnegM9E1 path r)
 rw [←he]
 exact vertical_residual_intervalMEA423 path r

theorem vertical_raw_of_residual_adjacentMEA423 (path : List Bool) (i : ℕ)
 (ha : 2*i+1 ≤ (frame path).mid.a)
 (hc : ∀ j, (vresidualM9E1 path i).coeff j*(vresidualM9E1 path i).coeff (j+2) ≤
       (vresidualM9E1 path i).coeff (j+1)^2) :
 ∀ j, coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
   coeff (frame path).mid.p i (j+1)^2 := by
 apply (vertical_cross_iff725 path i).1
 rw [vertical_all_order_factorM9E1 path i ha,Polynomial.map_mul,Polynomial.map_pow,
   Polynomial.map_add,Polynomial.map_one,Polynomial.map_X,add_comm X 1,coeffSeq_binomial_mul]
 apply crossLC_pascal
 exact (vertical_residual_cross_iffMEA423 path i).2 hc

theorem vertical_residual_ne_zeroMEA423 (path : List Bool) (i : ℕ)
 (hi : i≤(frame path).mid.a+(frame path).mid.b-1) : vresidualM9E1 path i≠0 := by
 intro hz
 have h := vertical_all_order_clearedM9E1 path i
 rw [hz,mul_zero] at h
 have hn : (X+1:ℤ[X])≠0 := by simpa using X_add_C_ne_zero (1:ℤ)
 have hp := (mul_eq_zero.mp h).resolve_left (pow_ne_zero _ hn)
 have hc := congrArg (fun p : ℤ[X] => p.coeff
   ((frame path).mid.a+(frame path).mid.b-1-i)) hp
 have hpos := top_raw_positive1998 path i
   ((frame path).mid.a+(frame path).mid.b-1-i) (by omega)
 change coeff (frame path).mid.p i ((frame path).mid.a+(frame path).mid.b-1-i)=0 at hc
 omega

theorem vertical_residual_top_positiveMEA423 (path : List Bool) (i : ℕ)
 (hi : i≤(frame path).mid.a+(frame path).mid.b-1) :
 0<(vresidualM9E1 path i).coeff (i+(frame path).mid.b) := by
 have hn := vertical_residual_ne_zeroMEA423 path i hi
 have hex : ∃ j, (vresidualM9E1 path i).coeff j≠0 := by
   by_contra h
   push Not at h
   apply hn
   ext j
   simpa using h j
 obtain ⟨j,hj⟩ := hex
 have hp : 0<(vresidualM9E1 path i).coeff j :=
   lt_of_le_of_ne (vresidual_coeff_nonnegM9E1 path i j) (Ne.symm hj)
 have hjb : j≤i+(frame path).mid.b := by
   by_contra hh
   exact hj (vertical_residual_boundMEA423 path i j (by omega))
 exact vertical_residual_filledMEA423 path i j _ hp hjb le_rfl

end
end MathGKM.Markov
