import MarkovFourthSqZeroK0B
/-! Machine-authored request 0b212317. The shifted block starts in degree n+2. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxRecDepth 16384
set_option maxHeartbeats 4000000

theorem fourthNumerator_xsq_dvdK0B {A : Type*} [CommRing A]
 (N Z x : A) (c r : ℕ) :
 x^2 ∣ fourthNumeratorBC N Z x c r-fourthNumeratorBC N 0 x c r := by
 let I : Ideal A := Ideal.span {x^2}
 let q := Ideal.Quotient.mk I
 have hx : (q x)^2=0 := by
   rw [←map_pow]
   apply Ideal.Quotient.eq_zero_iff_mem.mpr
   exact Ideal.subset_span (by simp)
 have h := fourthNumerator_sqzeroK0B (q N) (q Z) (q x) c r hx
 have hm : q (fourthNumeratorBC N Z x c r-fourthNumeratorBC N 0 x c r)=0 := by
   rw [map_sub,fourthNumerator_mapBC,fourthNumerator_mapBC,map_zero,h,sub_self]
 exact Ideal.mem_span_singleton.mp (Ideal.Quotient.eq_zero_iff_mem.mp hm)

end
end MathGKM.Markov
