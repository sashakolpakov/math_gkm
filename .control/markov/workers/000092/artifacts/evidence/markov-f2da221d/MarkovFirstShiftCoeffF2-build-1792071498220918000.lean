import MarkovCubicNumeratorF2
import MarkovFourthSourceF2
/-! Machine-authored f2da221d. Exact first shifted raw coefficient. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 16384
attribute [local irreducible] fourthNumeratorBC

theorem shiftCorrection_mapF2 {A B : Type*} [CommRing A] [CommRing B]
    (g : A →+* B) (N c r : A) :
    g (shiftCorrectionF2 N c r)=shiftCorrectionF2 (g N) (g c) (g r) := by
  simp only [shiftCorrectionF2,map_mul,map_sub,map_add,map_ofNat]

theorem fourthNumerator_cube_dvdF2 {A : Type*} [CommRing A]
    (N Z x : A) (c r : ℕ) :
    x^3 ∣ fourthNumeratorBC N Z x c r-fourthNumeratorBC N 0 x c r-
      Z*x^2*shiftCorrectionF2 N c r := by
  let I : Ideal A := Ideal.span {x^3}
  let q := Ideal.Quotient.mk I
  have hx : (q x)^3=0 := by
    rw [←map_pow]
    apply Ideal.Quotient.eq_zero_iff_mem.mpr
    exact Ideal.subset_span (by simp)
  have hm : q (fourthNumeratorBC N Z x c r-fourthNumeratorBC N 0 x c r-
      Z*x^2*shiftCorrectionF2 N c r)=0 := by
    simp only [map_sub,map_mul,map_pow,fourthNumerator_mapBC,map_zero,
      shiftCorrection_mapF2,map_natCast]
    rw [fourthNumerator_cubicF2 (q N) (q Z) (q x) c r hx,sub_self]
  exact Ideal.mem_span_singleton.mp (Ideal.Quotient.eq_zero_iff_mem.mp hm)

theorem fourthNumerator_next_dvdF2 (n c r : ℕ) :
    (X:ℤ[X])^(n+3) ∣ fourthNumeratorBC (n:ℤ[X]) (X^n) X c r-
      fourthNumeratorBC (n:ℤ[X]) 0 X c r-
      C (shiftCorrectionF2 (n:ℤ) c r)*X^(n+2) := by
  let F : (ℤ[X])[X] := fourthNumeratorBC (C (n:ℤ[X])) X (C X) c r-
    fourthNumeratorBC (C (n:ℤ[X])) 0 (C X) c r-
    X*(C X)^2*shiftCorrectionF2 (C (n:ℤ[X])) (c:(ℤ[X])[X]) r
  have hz : (X:(ℤ[X])[X]) ∣ F := by
    apply dvd_sub
    · simpa only [sub_zero] using
        (fourthNumerator_sub_dvdK0B (C (n:ℤ[X])) (X:(ℤ[X])[X]) 0 (C (X:ℤ[X])) c r)
    · exact dvd_mul_of_dvd_left (dvd_mul_right _ _) _
  have hx : C ((X:ℤ[X])^3) ∣ F := by
    simpa only [F,map_pow] using
      (fourthNumerator_cube_dvdF2 (C (n:ℤ[X])) (X:(ℤ[X])[X]) (C (X:ℤ[X])) c r)
  have h := eval_shift_productF2 F n 3 hz hx
  have he : F.eval (X^n)=fourthNumeratorBC (n:ℤ[X]) (X^n) X c r-
      fourthNumeratorBC (n:ℤ[X]) 0 X c r-
      C (shiftCorrectionF2 (n:ℤ) c r)*X^(n+2) := by
    change (evalRingHom ((X:ℤ[X])^n)) F = _
    simp only [F,map_sub,map_mul,map_pow,fourthNumerator_mapBC,
      shiftCorrection_mapF2,map_natCast,coe_evalRingHom,eval_C,eval_X,eval_zero]
    simp only [shiftCorrection_mapF2,map_natCast,pow_add,mul_comm]
  rw [he] at h
  exact h

theorem fourthNumerator_next_coeffF2 (n c r k : ℕ) (hk : k<n+3) :
    (fourthNumeratorBC (n:ℤ[X]) (X^n) X c r).coeff k =
    (fourthNumeratorBC (n:ℤ[X]) 0 X c r).coeff k+
      (C (shiftCorrectionF2 (n:ℤ) c r)*X^(n+2)).coeff k := by
  have h := (X_pow_dvd_iff.mp (fourthNumerator_next_dvdF2 n c r)) k hk
  simp only [coeff_sub] at h
  linear_combination h

theorem source_fourth_next_convF2 (n : ℕ) (rest : List Bool)
    (hc : 5≤(frame rest).mid.b) (i : ℕ)
    (hs : i+(n+2)=(frame (List.replicate n true++false::rest)).mid.a+4) :
    24*coeff (frame (List.replicate n true++false::rest)).mid.p i (n+2)=
    convSevenK0B (fourthLowPolyK0B (C ((frame rest).mid.b:ℤ))
      (C ((n:ℤ)*(frame rest).mid.b+(frame rest).mid.a)) X) (n+2)+
      shiftCorrectionF2 (n:ℤ) (frame rest).mid.b (frame rest).mid.a := by
  rw [source_fourth_binomialBC n rest hc i (n+2) hs]
  have he : ∑ k ∈ Finset.range (n+2+1),
      (fourthNumeratorBC (n:ℤ[X]) (X^n) X (frame rest).mid.b (frame rest).mid.a).coeff k*
        ((7+(n+2-k)).choose 7:ℤ) =
      convSevenK0B (fourthNumeratorBC (n:ℤ[X]) 0 X (frame rest).mid.b (frame rest).mid.a+
        C (shiftCorrectionF2 (n:ℤ) (frame rest).mid.b (frame rest).mid.a)*X^(n+2)) (n+2) := by
    unfold convSevenK0B
    apply Finset.sum_congr rfl
    intro k hk
    rw [coeff_add,fourthNumerator_next_coeffF2 n _ _ k (by
      have := Finset.mem_range.mp hk
      omega)]
  rw [he,convSeven_addK0B,convSeven_monomialK0B]
  have hp : fourthNumeratorBC (n:ℤ[X]) 0 X (frame rest).mid.b (frame rest).mid.a =
      fourthLowPolyK0B (C ((frame rest).mid.b:ℤ))
        (C ((n:ℤ)*(frame rest).mid.b+(frame rest).mid.a)) X := by
    rw [fourthNumerator_zeroK0B]
    simp only [map_add,map_mul,map_natCast]
  rw [hp]
  simp [chooseShiftSevenK0B]

end
end MathGKM.Markov
