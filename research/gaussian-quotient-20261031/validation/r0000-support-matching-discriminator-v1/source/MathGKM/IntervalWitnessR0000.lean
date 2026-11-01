import MathGKM.IntervalBridgeR0000

noncomputable section
namespace MathGKM.GaussianQuotient.IntervalWitnessR0000
open IntervalBridgeR0000

def witnessN : Polynomial ℕ :=
  1 + Polynomial.X^2 + Polynomial.X^3 + Polynomial.X^4 + Polynomial.X^6

def witnessH : Polynomial ℚ := witnessN.map (Nat.castRingHom ℚ)

theorem witness_natCoeffs : NatCoeffs witnessH := by
  intro d
  exact ⟨witnessN.coeff d, by simp [witnessH]⟩

theorem witness_image : iota witnessH = 1 + q^2 + q^3 + q^4 + q^6 := by
  simp [witnessH, witnessN, q, map_add, map_pow]

theorem witness_interval : F 1 4 2 = iota witnessH := by
  have h2 : (1-q^2 : RatFunc ℚ) ≠ 0 := factor_ne_zero 1
  have h3 : (1-q^3 : RatFunc ℚ) ≠ 0 := factor_ne_zero 2
  norm_num [F, W, Finset.prod_range_succ]
  rw [witness_image]
  field_simp
  <;> ring

theorem witness_root_equality : B 7 3 = B 7 1 * iota witnessH := by
  have hid := interval_identity 7 3 1 (by decide) (by decide)
  have hd : B 7 1 ≠ 0 := B_ne_zero 7 1 (by decide)
  have h : B 7 3 / B 7 1 = iota witnessH := hid.trans witness_interval
  simpa only [mul_comm] using (div_eq_iff hd).mp h

theorem no_divisor_matching :
    ¬ ∃ x y : ℕ, ((x=5 ∧ y=6) ∨ (x=6 ∧ y=5)) ∧ 2 ∣ x ∧ 3 ∣ y := by
  rintro ⟨x,y,(⟨rfl,rfl⟩ | ⟨rfl,rfl⟩),hx,hy⟩ <;> norm_num at *

theorem support_witnesses :
    (6 = 2*3) ∧ (6 = 3*2) ∧ (5 = 2*1+3*1) ∧ (6 = 2*3+3*0) := by
  norm_num

theorem discriminator :
    B 7 1 ≠ 0 ∧ B 7 3 = B 7 1 * iota witnessH ∧ NatCoeffs witnessH ∧
    (¬ ∃ x y : ℕ, ((x=5 ∧ y=6) ∨ (x=6 ∧ y=5)) ∧ 2 ∣ x ∧ 3 ∣ y) ∧
    ((6 = 2*3) ∧ (6 = 3*2) ∧ (5 = 2*1+3*1) ∧ (6 = 2*3+3*0)) :=
  ⟨B_ne_zero 7 1 (by decide), witness_root_equality, witness_natCoeffs,
    no_divisor_matching, support_witnesses⟩

end MathGKM.GaussianQuotient.IntervalWitnessR0000
