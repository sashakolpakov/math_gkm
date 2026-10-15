import MarkovLinearBlockCC
import MarkovShiftShapeCC
/-! Machine-authored cc599cf1. Exact onset of the second shift block. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 16384
attribute [local irreducible] fourthNumeratorBC fourthShiftCC

theorem fourthShift_cubicCC {A : Type*} [CommRing A] (N c r x : A) (hx : x^3=0) :
 fourthShiftCC N c r x=x^2*shiftCorrectionF2 N c r := by
 have hx4 : x^4=0 := by rw [show 4=3+1 by omega,pow_add,hx,zero_mul]
 have hx5 : x^5=0 := by rw [show 5=3+2 by omega,pow_add,hx,zero_mul]
 have hx6 : x^6=0 := by rw [show 6=3+3 by omega,pow_add,hx,zero_mul]
 have hx7 : x^7=0 := by rw [show 7=3+4 by omega,pow_add,hx,zero_mul]
 have hx8 : x^8=0 := by rw [show 8=3+5 by omega,pow_add,hx,zero_mul]
 have hx9 : x^9=0 := by rw [show 9=3+6 by omega,pow_add,hx,zero_mul]
 have hx10 : x^10=0 := by rw [show 10=3+7 by omega,pow_add,hx,zero_mul]
 have hx11 : x^11=0 := by rw [show 11=3+8 by omega,pow_add,hx,zero_mul]
 have hx12 : x^12=0 := by rw [show 12=3+9 by omega,pow_add,hx,zero_mul]
 have he : shiftPart2CC N c r=shiftCorrectionF2 N c r := by
   unfold shiftPart2CC shiftCorrectionF2
   ring
 rw [fourthShift_polyCC]
 simp only [shiftPolyCC,shiftPart0CC,shiftPart1CC,hx,hx4,hx5,hx6,hx7,hx8,hx9,hx10,hx11,hx12,
   zero_mul,mul_zero,zero_add,add_zero,he,mul_comm]

theorem fourthNumerator_remainder_xcubeCC {A : Type*} [CommRing A]
 (N Z x : A) (c r : ℕ) :
 x^3 ∣ fourthNumeratorBC N Z x c r-fourthNumeratorBC N 0 x c r-
   Z*fourthShiftCC N c r x := by
 let I : Ideal A := Ideal.span {x^3}
 let q := Ideal.Quotient.mk I
 have hx : (q x)^3=0 := by
   rw [←map_pow]
   apply Ideal.Quotient.eq_zero_iff_mem.mpr
   exact Ideal.subset_span (by simp)
 have hm : q (fourthNumeratorBC N Z x c r-fourthNumeratorBC N 0 x c r-
     Z*fourthShiftCC N c r x)=0 := by
   simp only [map_sub,map_mul,fourthNumerator_mapBC,fourthShift_mapCC,
     map_zero,map_natCast]
   rw [fourthNumerator_cubicF2 (q N) (q Z) (q x) c r hx,
     fourthShift_cubicCC (q N) (c: A ⧸ I) r (q x) hx]
   ring
 exact Ideal.mem_span_singleton.mp (Ideal.Quotient.eq_zero_iff_mem.mp hm)

theorem fourthNumerator_block_extended_dvdCC (n c r : ℕ) :
 (X:ℤ[X])^(2*n+3) ∣ fourthNumeratorBC (n:ℤ[X]) (X^n) X c r-
   fourthNumeratorBC (n:ℤ[X]) 0 X c r-
   X^n*fourthShiftCC (n:ℤ[X]) c r X := by
 let F : (ℤ[X])[X] := fourthNumeratorBC (C (n:ℤ[X])) X (C X) c r-
   fourthNumeratorBC (C (n:ℤ[X])) 0 (C X) c r-
   X*fourthShiftCC (C (n:ℤ[X])) c r (C X)
 have hz : (X:(ℤ[X])[X])^2 ∣ F := fourthNumerator_zsquareCC _ _ _ _ _
 have hx : C ((X:ℤ[X])^3) ∣ F := by
   simpa only [F,map_pow] using
     (fourthNumerator_remainder_xcubeCC (C (n:ℤ[X])) (X:(ℤ[X])[X]) (C (X:ℤ[X])) c r)
 have h := eval_shift_power_productCC F n 2 3 hz hx
 have he : F.eval (X^n)=fourthNumeratorBC (n:ℤ[X]) (X^n) X c r-
     fourthNumeratorBC (n:ℤ[X]) 0 X c r-X^n*fourthShiftCC (n:ℤ[X]) c r X := by
   change (evalRingHom ((X:ℤ[X])^n)) F = _
   simp only [F,map_sub,map_mul,fourthNumerator_mapBC,fourthShift_mapCC,
     map_natCast,coe_evalRingHom,eval_C,eval_X,eval_zero]
 rw [he,show n*2+3=2*n+3 by omega] at h
 exact h

theorem fourthNumerator_block_extended_coeffCC (n c r k : ℕ) (hk : k<2*n+3) :
 (fourthNumeratorBC (n:ℤ[X]) (X^n) X c r).coeff k =
 (fourthNumeratorBC (n:ℤ[X]) 0 X c r+
   X^n*fourthShiftCC (n:ℤ[X]) c r X).coeff k := by
 have h := (X_pow_dvd_iff.mp (fourthNumerator_block_extended_dvdCC n c r)) k hk
 simp only [coeff_sub,coeff_add] at h ⊢
 linear_combination h

theorem source_fourth_block_extendedCC (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i j : ℕ)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4)
 (hj : j<2*n+3) :
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
 rw [fourthNumerator_block_extended_coeffCC n _ _ k (by
   have := Finset.mem_range.mp hk
   omega),hp]
end
end MathGKM.Markov
