import MathGKM.Accepteddd032f6fba3a28f10639ddad
/- Machine-authored round87: consequences of the admitted retained polynomial. -/
namespace PositiveR87
open Polynomial
noncomputable section
set_option maxHeartbeats 2000000
def H : Polynomial ℤ := FullFiberRankR80.rankPoly 10 1 5 4 0 6
def value (r : ℕ) : ℤ :=
  if r=0 then 350 else if r=1 then 2000 else if r=2 then 3600 else
  if r=3 then 2000 else if r=4 then 350 else 0
theorem coeffs (r : ℕ) : H.coeff r = value r := by
  have hp := congrArg (fun P : Polynomial ℤ => P.coeff r)
    Accepteddd032f6fba3a28f10639ddad.obligation
  change H.coeff r = (C 350+C 2000*X+C 3600*X^2+C 2000*X^3+C 350*X^4 : Polynomial ℤ).coeff r at hp
  rw [hp]
  by_cases hr : r≤4
  · interval_cases r <;> norm_num [value,coeff_X]
  · have h0 : r≠0 := by omega
    have h1 : r≠1 := by omega
    have h2 : r≠2 := by omega
    have h3 : r≠3 := by omega
    have h4 : r≠4 := by omega
    have hc : (350 : Polynomial ℤ).coeff r=0 := by
      change (C (350 : ℤ)).coeff r=0
      rw [coeff_C]
      simp [h0,Ne.symm h0]
    norm_num [hc,value,h0,h1,h2,h3,h4,Ne.symm h0,Ne.symm h1,
      Ne.symm h2,Ne.symm h3,Ne.symm h4,coeff_X_pow,coeff_X]
theorem counts (r : ℕ) :
    (PairConvolutionR78.P 10 1 5 4 0 6 r).card =
      if r=0 then 350 else if r=1 then 2000 else if r=2 then 3600 else
      if r=3 then 2000 else if r=4 then 350 else 0 := by
  have h := (Accepted0beeba7c6244e2295e3e804c.obligation.1 10 1 5 4 0 6 r).1
  change H.coeff r = _ at h
  rw [coeffs] at h
  unfold value at h
  split_ifs at * <;> exact_mod_cast h.symm
theorem value_tail (r : ℕ) (hr : 4<r) : value r=0 := by
  simp only [value]
  split_ifs <;> omega
theorem rank_positive :
    (∀ r, r≤4 → H.coeff r=H.coeff (4-r)) ∧
    (∀ r, 0≤H.coeff r) ∧
    (∀ r, 0<H.coeff r ↔ r≤4) ∧
    (∀ r, H.coeff r*H.coeff (r+2)≤H.coeff (r+1)^2) ∧
    (∀ r, 2*r<4 → H.coeff r≤H.coeff (r+1)) ∧
    (∀ r, 4<r → H.coeff r=0) := by
  simp only [coeffs]
  refine ⟨?_,?_,?_,?_,?_,value_tail⟩
  · intro r hr; interval_cases r <;> norm_num [value]
  · intro r
    by_cases hr : r≤4
    · interval_cases r <;> norm_num [value]
    · simp [value_tail r (by omega)]
  · intro r
    by_cases hr : r≤4
    · interval_cases r <;> norm_num [value]
    · simp [value_tail r (by omega),hr]
  · intro r
    by_cases hr : r≤4
    · interval_cases r <;> norm_num [value]
    · simpa only [value_tail r (by omega),zero_mul] using sq_nonneg (value (r+1))
  · intro r hr
    have hh : r≤1 := by omega
    interval_cases r <;> norm_num [value]
theorem interval_support :
    ∀ i j k : ℕ, i<j → j<k → 0<H.coeff i → 0<H.coeff k → 0<H.coeff j := by
  intro i j k hij hjk hi hk
  apply (rank_positive.2.2.1 j).mpr
  have hk4 := (rank_positive.2.2.1 k).mp hk
  omega
theorem bundle :
    (∀ r : ℕ, (PairConvolutionR78.P 10 1 5 4 0 6 r).card =
      if r=0 then 350 else if r=1 then 2000 else if r=2 then 3600 else
      if r=3 then 2000 else if r=4 then 350 else 0) ∧
    (∀ r, r≤4 → H.coeff r=H.coeff (4-r)) ∧
    (∀ r, 0≤H.coeff r) ∧
    (∀ r, 0<H.coeff r ↔ r≤4) ∧
    (∀ i j k : ℕ, i<j → j<k → 0<H.coeff i → 0<H.coeff k → 0<H.coeff j) ∧
    (∀ r, H.coeff r*H.coeff (r+2)≤H.coeff (r+1)^2) ∧
    (∀ r, 2*r<4 → H.coeff r≤H.coeff (r+1)) ∧
    (∀ r, 4<r → H.coeff r=0) := by
  exact ⟨counts,rank_positive.1,rank_positive.2.1,rank_positive.2.2.1,
    interval_support,rank_positive.2.2.2⟩
end
end PositiveR87
#print axioms PositiveR87.bundle
