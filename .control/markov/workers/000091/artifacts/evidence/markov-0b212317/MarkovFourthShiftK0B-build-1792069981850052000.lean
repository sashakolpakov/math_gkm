import MarkovFourthSqZeroK0B
/-! Machine-authored request 0b212317. The shifted block starts in degree n+2. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

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

theorem fourthNumerator_shift_dvdK0B (n c r : ℕ) :
 (X:ℤ[X])^(n+2) ∣ fourthNumeratorBC (n:ℤ[X]) (X^n) X c r-
   fourthNumeratorBC (n:ℤ[X]) 0 X c r := by
 let F : (ℤ[X])[X] := fourthNumeratorBC (C (n:ℤ[X])) X (C X) c r-
   fourthNumeratorBC (C (n:ℤ[X])) 0 (C X) c r
 have hz : (X:(ℤ[X])[X]) ∣ F := by
   simpa only [sub_zero] using
     (fourthNumerator_sub_dvdK0B (C (n:ℤ[X])) X 0 (C X) c r)
 have hx : C ((X:ℤ[X])^2) ∣ F := by
   simpa only [map_pow] using
     (fourthNumerator_xsq_dvdK0B (C (n:ℤ[X])) X (C X) c r)
 obtain ⟨Q,hQ⟩ := hx
 have hq0 : Q.coeff 0=0 := by
   have h0 := X_dvd_iff.mp hz
   rw [hQ,coeff_C_mul] at h0
   exact (mul_eq_zero.mp h0).resolve_left (pow_ne_zero _ X_ne_zero)
 obtain ⟨S,hS⟩ := X_dvd_iff.mpr hq0
 have hfac : F=C ((X:ℤ[X])^2)*X*S := by rw [hQ,hS]; ring
 have he := congrArg (Polynomial.evalRingHom ((X:ℤ[X])^n)) hfac
 have heval (z : ℤ[X]) :
     (Polynomial.evalRingHom z) F =
     fourthNumeratorBC (n:ℤ[X]) z X c r-fourthNumeratorBC (n:ℤ[X]) 0 X c r := by
   simp only [F,map_sub,fourthNumerator_mapBC,coe_evalRingHom,eval_C,eval_X,eval_zero]
 rw [heval] at he
 simp only [map_mul,coe_evalRingHom,eval_C,eval_X] at he
 refine ⟨S.eval (X^n),?_⟩
 rw [he,pow_add]
 ring

theorem fourthNumerator_coeff_shiftK0B (n c r k : ℕ) (hk : k<n+2) :
 (fourthNumeratorBC (n:ℤ[X]) (X^n) X c r).coeff k =
 (fourthNumeratorBC (n:ℤ[X]) 0 X c r).coeff k := by
 have h := (X_pow_dvd_iff.mp (fourthNumerator_shift_dvdK0B n c r)) k hk
 simpa only [coeff_sub,sub_eq_zero] using h

theorem source_fourth_shift_binomialK0B (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i j : ℕ)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4)
 (hj : j<n+2) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j =
 ∑ k ∈ Finset.range (j+1),
   (fourthNumeratorBC (n:ℤ[X]) 0 X (frame rest).mid.b (frame rest).mid.a).coeff k *
   ((7+(j-k)).choose 7:ℤ) := by
 rw [source_fourth_binomialBC n rest hc i j hs]
 apply Finset.sum_congr rfl
 intro k hk
 rw [fourthNumerator_coeff_shiftK0B n _ _ k (by
   have := Finset.mem_range.mp hk
   omega)]

end
end MathGKM.Markov
