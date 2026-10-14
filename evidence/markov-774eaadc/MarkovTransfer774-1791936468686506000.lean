import MarkovSlices774
import MarkovCross774

/-! Machine-authored worker 774eaadc. Conditional transfer states the remaining
inequality hypothesis explicitly, with exact raw coefficients and all zeros. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem coeffSeq_nat774 (p : Polynomial ℝ) (i : ℕ) :
    CoeffSeq p (i : ℤ) = p.coeff i := by simp [CoeffSeq]

theorem integral_binomial_lc774 (p q : Polynomial ℤ) (n : ℕ)
    (hp : p=(1+X)^n*q)
    (hq : CrossLC (CoeffSeq (q.map (Int.castRingHom ℝ)))) (i : ℕ) :
    p.coeff i * p.coeff (i+2) ≤ p.coeff (i+1)^2 := by
  have hm := congrArg (Polynomial.map (Int.castRingHom ℝ)) hp
  simp only [Polynomial.map_mul,Polynomial.map_pow,Polynomial.map_add,
    Polynomial.map_one,Polynomial.map_X] at hm
  have hs : CrossLC (CoeffSeq (p.map (Int.castRingHom ℝ))) := by
    rw [hm,coeffSeq_binomial_mul]
    exact crossLC_pascal hq n
  have h := crossLC_adjacent hs ((i:ℤ)+1)
  have he0 : (i:ℤ)+1-1 = (i:ℤ) := by omega
  have he1 : (i:ℤ)+1 = ((i+1:ℕ):ℤ) := by omega
  have he2 : (i:ℤ)+1+1 = ((i+2:ℕ):ℤ) := by omega
  rw [he0,he2,he1] at h
  simp only [coeffSeq_nat774,Polynomial.coeff_map,Int.castRingHom_apply] at h
  exact_mod_cast h

theorem upper_slice_lc_of_quotient774 (path : List Bool) (r : ℕ)
    (hr : 2*r ≤ (frame path).mid.a+(frame path).mid.b-1)
    (hq : CrossLC (CoeffSeq ((quotientSlice774 path r).map (Int.castRingHom ℝ))))
    (i : ℕ) :
    let p := (diagonalPolyDe6 (numerator4b5 (frame path).mid)).coeff r
    p.coeff i*p.coeff (i+2) ≤ p.coeff (i+1)^2 :=
  integral_binomial_lc774 _ _ _ (upper_slice_factor774 path r hr) hq i

/-- A literal raw third-direction triple. The CrossLC assumption is not discharged. -/
theorem upper_raw_lc_of_quotient774 (path : List Bool) (r i j : ℕ)
    (hr : 2*r ≤ (frame path).mid.a+(frame path).mid.b-1)
    (hd : i+j+2+r=(frame path).mid.a+(frame path).mid.b-1)
    (hq : CrossLC (CoeffSeq ((quotientSlice774 path r).map (Int.castRingHom ℝ)))) :
    coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
      coeff (frame path).mid.p (i+1) (j+1)^2 := by
  have h := upper_slice_lc_of_quotient774 path r hr hq i
  dsimp only at h
  rw [diagonal_raw_coeff_on16 path r i (j+2) (by omega),
    diagonal_raw_coeff_on16 path r (i+2) j (by omega),
    diagonal_raw_coeff_on16 path r (i+1) (j+1) (by omega)] at h
  exact h

/-- Adjacent inequalities suffice if the residual has no internal positive-support gap. -/
theorem upper_raw_lc_of_adjacent_interval774 (path : List Bool) (r i j : ℕ)
    (hr : 2*r ≤ (frame path).mid.a+(frame path).mid.b-1)
    (hd : i+j+2+r=(frame path).mid.a+(frame path).mid.b-1)
    (ha : ∀ k, let f := CoeffSeq ((quotientSlice774 path r).map (Int.castRingHom ℝ))
      f (k-1)*f (k+1) ≤ f k^2)
    (hs : IntervalSupport774
      (CoeffSeq ((quotientSlice774 path r).map (Int.castRingHom ℝ)))) :
    coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
      coeff (frame path).mid.p (i+1) (j+1)^2 := by
  apply upper_raw_lc_of_quotient774 path r i j hr hd
  apply crossLC_of_adjacent_interval774 _ ?_ ha hs
  intro k
  unfold CoeffSeq
  split_ifs
  · exact le_rfl
  · simp only [Polynomial.coeff_map,Int.castRingHom_apply]
    exact_mod_cast quotient_slice_nonneg774 path r k.toNat

#print axioms integral_binomial_lc774
#print axioms upper_raw_lc_of_quotient774
#print axioms upper_raw_lc_of_adjacent_interval774
end
end MathGKM.Markov
