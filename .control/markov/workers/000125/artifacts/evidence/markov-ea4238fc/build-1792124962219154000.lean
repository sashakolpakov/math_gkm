import MarkovHorizontalPairMEA423
import MarkovTopLC1998

/-! Machine-authored ea4238fc. Actual all-order residual interval support
and an adjacent-to-CrossLC bridge. The adjacent inequalities remain hypotheses. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff

theorem horizontal_residual_interval_natMEA423 (path : List Bool) (r i k l : ℕ)
 (hik : i≤k) (hkl : k≤l)
 (hi : 0<(hresidualM511 (X:ℤ[X]) (sourceWord28 path) r).coeff i)
 (hl : 0<(hresidualM511 (X:ℤ[X]) (sourceWord28 path) r).coeff l) :
 0<(hresidualM511 (X:ℤ[X]) (sourceWord28 path) r).coeff k := by
 have hlr : l≤r+(frame path).mid.a := by
   by_contra hn
   rw [horizontal_residual_boundMEA423 path r l (by omega)] at hl
   omega
 exact horizontal_residual_filledMEA423 path r i k hi hik (by omega)

theorem horizontal_residual_intervalMEA423 (path : List Bool) (r : ℕ) :
 IntervalSupport774
  (CoeffSeq ((hresidualM511 (X:ℤ[X]) (sourceWord28 path) r).map (Int.castRingHom ℝ))) := by
 have he : CoeffSeq ((hresidualM511 (X:ℤ[X]) (sourceWord28 path) r).map (Int.castRingHom ℝ))=
   zeroSeq725 (hresidualM511 (X:ℤ[X]) (sourceWord28 path) r).coeff := by
   funext k
   simp only [CoeffSeq,zeroSeq725,Polynomial.coeff_map]
   rfl
 rw [he]
 exact zeroSeq_interval725 _ (horizontal_residual_interval_natMEA423 path r)

theorem horizontal_residual_cross_iffMEA423 (path : List Bool) (r : ℕ) :
 CrossLC (CoeffSeq ((hresidualM511 (X:ℤ[X]) (sourceWord28 path) r).map (Int.castRingHom ℝ))) ↔
 ∀ i, (hresidualM511 (X:ℤ[X]) (sourceWord28 path) r).coeff i *
       (hresidualM511 (X:ℤ[X]) (sourceWord28 path) r).coeff (i+2) ≤
       (hresidualM511 (X:ℤ[X]) (sourceWord28 path) r).coeff (i+1)^2 := by
 have he : CoeffSeq ((hresidualM511 (X:ℤ[X]) (sourceWord28 path) r).map (Int.castRingHom ℝ))=
   zeroSeq725 (hresidualM511 (X:ℤ[X]) (sourceWord28 path) r).coeff := by
   funext k
   simp only [CoeffSeq,zeroSeq725,Polynomial.coeff_map]
   rfl
 rw [he]
 apply zeroSeq_cross_iff725 _ (hresidual_coeff_nonnegM511 path r)
 rw [←he]
 exact horizontal_residual_intervalMEA423 path r

theorem horizontal_raw_of_residual_adjacentMEA423 (path : List Bool) (j : ℕ)
 (hb : 2*j+1 ≤ (frame path).mid.b)
 (hc : ∀ i, (hresidualM511 (X:ℤ[X]) (sourceWord28 path) j).coeff i *
       (hresidualM511 (X:ℤ[X]) (sourceWord28 path) j).coeff (i+2) ≤
       (hresidualM511 (X:ℤ[X]) (sourceWord28 path) j).coeff (i+1)^2) :
 ∀ i, coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
   coeff (frame path).mid.p (i+1) j^2 := by
 apply (horizontal_cross_iff725 path j).1
 rw [horizontal_all_order_factorM511 path j hb,map_mul,map_pow,map_add,map_one,map_X]
 rw [coeffSeq_binomial_mul]
 apply crossLC_pascal
 exact (horizontal_residual_cross_iffMEA423 path j).2 hc

theorem horizontal_residual_ne_zeroMEA423 (path : List Bool) (j : ℕ)
 (hj : j≤(frame path).mid.a+(frame path).mid.b-1) :
 hresidualM511 (X:ℤ[X]) (sourceWord28 path) j ≠ 0 := by
 intro hz
 have h := horizontal_all_order_clearedM511 path j
 rw [hz,mul_zero] at h
 have hn : (1+X:ℤ[X])≠0 := by
   intro hh
   have hc := congrArg (fun p : ℤ[X] => p.coeff 0) hh
   norm_num [Polynomial.coeff_one] at hc
 have hp := (mul_eq_zero.mp h).resolve_left (pow_ne_zero _ hn)
 have hc := congrArg (fun p : ℤ[X] => p.coeff
   ((frame path).mid.a+(frame path).mid.b-1-j)) hp
 rw [swap_coeff46] at hc
 have hpos := top_raw_positive1998 path
   ((frame path).mid.a+(frame path).mid.b-1-j) j (by omega)
 change coeff (frame path).mid.p ((frame path).mid.a+(frame path).mid.b-1-j) j=0 at hc
 omega

theorem horizontal_residual_top_positiveMEA423 (path : List Bool) (j : ℕ)
 (hj : j≤(frame path).mid.a+(frame path).mid.b-1) :
 0<(hresidualM511 (X:ℤ[X]) (sourceWord28 path) j).coeff (j+(frame path).mid.a) := by
 have hn := horizontal_residual_ne_zeroMEA423 path j hj
 have hex : ∃ i, (hresidualM511 (X:ℤ[X]) (sourceWord28 path) j).coeff i≠0 := by
   by_contra h
   push_neg at h
   apply hn
   ext i
   simpa using h i
 obtain ⟨i,hi⟩ := hex
 have hp : 0<(hresidualM511 (X:ℤ[X]) (sourceWord28 path) j).coeff i :=
   lt_of_le_of_ne (hresidual_coeff_nonnegM511 path j i) (Ne.symm hi)
 have hib : i≤j+(frame path).mid.a := by
   by_contra hh
   exact hi (horizontal_residual_boundMEA423 path j i (by omega))
 exact horizontal_residual_filledMEA423 path j i _ hp hib le_rfl

end
end MathGKM.Markov
