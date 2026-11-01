import MathGKM.TwoDenominatorPositiveR0001

noncomputable section
namespace MathGKM.GaussianQuotient.GapOneR0002
open Polynomial IntervalBridgeR0000 TwoDenominatorPositiveR0001

theorem universal_positive_witness (a b : ℕ) (H : Polynomial ℚ)
    (h : F a b 1 = iota H) : ∃ p : Polynomial ℕ, H = p.map (Nat.castRingHom ℚ) := by
  have hw : W a 1 ≠ 0 := by simpa [W] using factor_ne_zero a
  have he : W b 1 = W a 1 * iota H := by
    simpa [F, mul_comm] using (div_eq_iff hw).mp h
  have hp : (1-X^(b+1) : Polynomial ℚ) = (1-X^(a+1))*H := by
    apply iota_injective
    simpa [W, q, map_mul, map_sub, map_pow] using he
  have hd : a+1 ∣ b+1 := by
    let z : ℂ := Complex.exp (2 * Real.pi * Complex.I / (a+1))
    have hz : IsPrimitiveRoot z (a+1) := by
      simpa [z, Nat.cast_add, Nat.cast_one] using
        (Complex.isPrimitiveRoot_exp (a+1) (by omega))
    have hv := congrArg (Polynomial.aeval z) hp
    simp only [map_mul, map_sub, map_one, map_pow, aeval_X,
      hz.pow_eq_one, sub_self, zero_mul] at hv
    exact (hz.pow_eq_one_iff_dvd (b+1)).mp (sub_eq_zero.mp hv).symm
  obtain ⟨t, ht⟩ := hd
  have hg : W a 1 * evalNat (geom (a+1) t) = W b 1 := by
    simpa [W, ← ht] using geom_identity (a+1) t
  refine ⟨geom (a+1) t, iota_injective ?_⟩
  apply mul_left_cancel₀ hw
  exact he.symm.trans hg.symm

theorem universal_positivity (a b : ℕ) (H : Polynomial ℚ)
    (h : F a b 1 = iota H) : NatCoeffs H := by
  obtain ⟨p, rfl⟩ := universal_positive_witness a b H h
  exact natCoeffs_map p

theorem original_gap_one (n k l : ℕ) (H : Polynomial ℚ)
    (hlk : l ≤ k) (hkn : k ≤ n) (hgap : k-l=1)
    (hden : B n l ≠ 0) (heq : B n k = B n l * iota H) : NatCoeffs H := by
  have h : B n k / B n l = iota H := by rw [heq]; field_simp
  rw [interval_identity n k l hlk hkn, hgap] at h
  exact universal_positivity l (n-k) H h

theorem positivity_and_transport :
    (∀ (a b : ℕ) (H : Polynomial ℚ), F a b 1 = iota H →
      ∃ p : Polynomial ℕ, H = p.map (Nat.castRingHom ℚ)) ∧
    (∀ (n k l : ℕ) (H : Polynomial ℚ), l ≤ k → k ≤ n → k-l=1 →
      B n l ≠ 0 → B n k = B n l * iota H → NatCoeffs H) :=
  ⟨universal_positive_witness, original_gap_one⟩

end MathGKM.GaussianQuotient.GapOneR0002
