import MarkovFourthBinomialBC
/-! Machine-authored request 0b212317. Polynomial congruence and exact initial coefficients. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem fourthNumerator_sub_dvdK0B {A : Type*} [CommRing A]
    (N Z W x : A) (c r : ℕ) :
    Z-W ∣ fourthNumeratorBC N Z x c r-fourthNumeratorBC N W x c r := by
  have h := Polynomial.sub_dvd_eval_sub Z W
    (fourthNumeratorBC (C N) X (C x) c r)
  have he (z : A) :
      (fourthNumeratorBC (C N) X (C x) c r).eval z = fourthNumeratorBC N z x c r := by
    simpa only [coe_evalRingHom, eval_C, eval_X] using
      (fourthNumerator_mapBC (Polynomial.evalRingHom z) (C N) X (C x) c r)
  simpa only [he] using h

theorem fourthNumerator_coeff_initialK0B (n c r k : ℕ) (hk : k<n) :
    (fourthNumeratorBC (n:ℤ[X]) (X^n) X c r).coeff k =
    (fourthNumeratorBC (n:ℤ[X]) 0 X c r).coeff k := by
  have hd := fourthNumerator_sub_dvdK0B (n:ℤ[X]) (X^n) 0 X c r
  rw [sub_zero] at hd
  have h := (Polynomial.X_pow_dvd_iff.mp hd) k hk
  simpa only [coeff_sub, sub_eq_zero] using h

theorem source_fourth_initial_binomialK0B (n : ℕ) (rest : List Bool)
    (hc : 5≤(frame rest).mid.b) (i j : ℕ)
    (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4)
    (hj : j<n) :
    24*coeff (frame (List.replicate n true++false::rest)).mid.p i j =
    ∑ k ∈ Finset.range (j+1),
      (fourthNumeratorBC (n:ℤ[X]) 0 X (frame rest).mid.b (frame rest).mid.a).coeff k *
      ((7+(j-k)).choose 7 : ℤ) := by
  rw [source_fourth_binomialBC n rest hc i j hs]
  apply Finset.sum_congr rfl
  intro k hk
  rw [fourthNumerator_coeff_initialK0B n _ _ k (by
    have := Finset.mem_range.mp hk
    omega)]

end
end MathGKM.Markov
