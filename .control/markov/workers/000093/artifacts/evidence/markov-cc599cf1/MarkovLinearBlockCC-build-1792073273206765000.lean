import MarkovLinearDerivativeCC
import MarkovFirstShiftCoeffF2
/-! Machine-authored cc599cf1. Separate-variable divisibility for an entire shifted block. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 16384
attribute [local irreducible] fourthNumeratorBC fourthShiftCC

theorem eval_shift_power_productCC (F : (ℤ[X])[X]) (n m d : ℕ)
 (hz : (X:(ℤ[X])[X])^m ∣ F) (hx : C ((X:ℤ[X])^d) ∣ F) :
 (X:ℤ[X])^(n*m+d) ∣ F.eval (X^n) := by
 obtain ⟨Q,hQ⟩ := hx
 have hq : (X:(ℤ[X])[X])^m ∣ Q := by
   apply X_pow_dvd_iff.mpr
   intro k hk
   have h0 := (X_pow_dvd_iff.mp hz) k hk
   rw [hQ,coeff_C_mul] at h0
   exact (mul_eq_zero.mp h0).resolve_left (pow_ne_zero _ X_ne_zero)
 obtain ⟨S,hS⟩ := hq
 refine ⟨S.eval (X^n), ?_⟩
 rw [hQ,hS,eval_mul,eval_C,eval_mul,eval_pow,eval_X,pow_add,pow_mul]
 ring

theorem fourthNumerator_zsquareCC {A : Type*} [CommRing A]
 (N Z x : A) (c r : ℕ) :
 Z^2 ∣ fourthNumeratorBC N Z x c r-fourthNumeratorBC N 0 x c r-
   Z*fourthShiftCC N c r x := by
 let I : Ideal A := Ideal.span {Z^2}
 let q := Ideal.Quotient.mk I
 have hz : (q Z)^2=0 := by
   rw [←map_pow]
   apply Ideal.Quotient.eq_zero_iff_mem.mpr
   exact Ideal.subset_span (by simp)
 have hm : q (fourthNumeratorBC N Z x c r-fourthNumeratorBC N 0 x c r-
     Z*fourthShiftCC N c r x)=0 := by
   simp only [map_sub,map_mul,fourthNumerator_mapBC,fourthShift_mapCC,
     map_zero,map_natCast]
   rw [fourthNumerator_linearCC (q N) (q Z) (q x) c r hz,sub_self]
 exact Ideal.mem_span_singleton.mp (Ideal.Quotient.eq_zero_iff_mem.mp hm)

theorem fourthNumerator_block_dvdCC (n c r : ℕ) :
 (X:ℤ[X])^(2*n) ∣ fourthNumeratorBC (n:ℤ[X]) (X^n) X c r-
   fourthNumeratorBC (n:ℤ[X]) 0 X c r-
   X^n*fourthShiftCC (n:ℤ[X]) c r X := by
 simpa only [←pow_mul,show n*2=2*n by omega] using
   (fourthNumerator_zsquareCC (n:ℤ[X]) (X^n) X c r)

theorem fourthNumerator_block_coeffCC (n c r k : ℕ) (hk : k<2*n) :
 (fourthNumeratorBC (n:ℤ[X]) (X^n) X c r).coeff k =
 (fourthNumeratorBC (n:ℤ[X]) 0 X c r+
   X^n*fourthShiftCC (n:ℤ[X]) c r X).coeff k := by
 have h := (X_pow_dvd_iff.mp (fourthNumerator_block_dvdCC n c r)) k hk
 simp only [coeff_sub,coeff_add] at h ⊢
 linear_combination h

theorem source_fourth_blockCC (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i j : ℕ)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4)
 (hj : j<2*n) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j =
 convSevenK0B (fourthLowPolyK0B (C ((frame rest).mid.b:ℤ))
     (C ((n:ℤ)*(frame rest).mid.b+(frame rest).mid.a)) X+
   X^n*fourthShiftCC (n:ℤ[X]) (frame rest).mid.b (frame rest).mid.a X) j := by
 rw [source_fourth_binomialBC n rest hc i j hs]
 have hp : fourthNumeratorBC (n:ℤ[X]) 0 X (frame rest).mid.b (frame rest).mid.a =
     fourthLowPolyK0B (C ((frame rest).mid.b:ℤ))
       (C ((n:ℤ)*(frame rest).mid.b+(frame rest).mid.a)) X := by
   rw [fourthNumerator_zeroK0B]
   simp only [map_add,map_mul,map_natCast]
 unfold convSevenK0B
 apply Finset.sum_congr rfl
 intro k hk
 rw [fourthNumerator_block_coeffCC n _ _ k (by
   have := Finset.mem_range.mp hk
   omega),hp]
end
end MathGKM.Markov
