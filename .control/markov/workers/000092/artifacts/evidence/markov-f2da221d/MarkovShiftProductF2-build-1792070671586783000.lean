import MarkovFourthDivBaseK0B
/-! Machine-authored request f2da221d. Separate variables before specialization. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem eval_shift_productF2 (F : (ℤ[X])[X]) (n d : ℕ)
    (hz : (X:(ℤ[X])[X]) ∣ F) (hx : C ((X:ℤ[X])^d) ∣ F) :
    (X:ℤ[X])^(n+d) ∣ F.eval (X^n) := by
  obtain ⟨Q,hQ⟩ := hx
  have hq0 : Q.coeff 0=0 := by
    have h0 := X_dvd_iff.mp hz
    rw [hQ,coeff_C_mul] at h0
    exact (mul_eq_zero.mp h0).resolve_left (pow_ne_zero _ X_ne_zero)
  obtain ⟨S,hS⟩ := X_dvd_iff.mpr hq0
  refine ⟨S.eval (X^n), ?_⟩
  rw [hQ,hS,eval_mul,eval_C,eval_mul,eval_X,pow_add]
  ring

theorem fourthNumerator_shift_dvdF2 (n c r : ℕ) :
    (X:ℤ[X])^(n+2) ∣ fourthNumeratorBC (n:ℤ[X]) (X^n) X c r-
      fourthNumeratorBC (n:ℤ[X]) 0 X c r := by
  let F : (ℤ[X])[X] := fourthNumeratorBC (C (n:ℤ[X])) X (C X) c r-
    fourthNumeratorBC (C (n:ℤ[X])) 0 (C X) c r
  have hz : (X:(ℤ[X])[X]) ∣ F := by
    simpa only [sub_zero] using
      (fourthNumerator_sub_dvdK0B (C (n:ℤ[X])) (X:(ℤ[X])[X]) 0 (C (X:ℤ[X])) c r)
  have hx : C ((X:ℤ[X])^2) ∣ F := by
    simpa only [map_pow] using
      (fourthNumerator_xsq_dvdK0B (C (n:ℤ[X])) (X:(ℤ[X])[X]) (C (X:ℤ[X])) c r)
  have h := eval_shift_productF2 F n 2 hz hx
  have he : F.eval (X^n)=fourthNumeratorBC (n:ℤ[X]) (X^n) X c r-
      fourthNumeratorBC (n:ℤ[X]) 0 X c r := by
    change (evalRingHom ((X:ℤ[X])^n)) F = _
    simp only [F,map_sub,fourthNumerator_mapBC,coe_evalRingHom,eval_C,eval_X,eval_zero]
  rw [he] at h
  exact h

theorem fourthNumerator_coeff_shiftF2 (n c r k : ℕ) (hk : k<n+2) :
    (fourthNumeratorBC (n:ℤ[X]) (X^n) X c r).coeff k =
    (fourthNumeratorBC (n:ℤ[X]) 0 X c r).coeff k := by
  have h := (X_pow_dvd_iff.mp (fourthNumerator_shift_dvdF2 n c r)) k hk
  simpa only [coeff_sub,sub_eq_zero] using h

theorem source_fourth_shift_binomialF2 (n : ℕ) (rest : List Bool)
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
  rw [fourthNumerator_coeff_shiftF2 n _ _ k (by
    have := Finset.mem_range.mp hk
    omega)]

end
end MathGKM.Markov
