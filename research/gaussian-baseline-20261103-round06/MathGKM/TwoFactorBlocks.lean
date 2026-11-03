import MathGKM.Accepted42ad111d9b6c04f7ba2b0dde

/-! Conditional transport only. All finite coverage, disjointness, block size,
polynomial identity and coefficient premises are supplied explicitly. -/
noncomputable section
open scoped BigOperators

namespace MathGKM.GaussianQuotient.Blocks
open MathGKM.GaussianQuotient
open MathGKM.GaussianQuotient.Matching

/-- A supplied disjoint cover by positive singleton or two-factor quotients. -/
structure PositiveBlockCover (n k l : ℕ) where
  indices : Finset ℕ
  numerator : ℕ → Finset ℕ
  denominator : ℕ → Finset ℕ
  numerator_disjoint : Set.PairwiseDisjoint (↑indices : Set ℕ) numerator
  denominator_disjoint : Set.PairwiseDisjoint (↑indices : Set ℕ) denominator
  numerator_cover : indices.biUnion numerator = Finset.Ioc (n-k) (n-l)
  denominator_cover : indices.biUnion denominator = Finset.Ioc l k
  block_size : ∀ i ∈ indices, (numerator i).card = (denominator i).card ∧
    ((denominator i).card = 1 ∨ (denominator i).card = 2)
  witness : ℕ → Polynomial ℚ
  witness_positive : ∀ i ∈ indices, NatCoeffs (witness i)
  block_identity : ∀ i ∈ indices,
    (∏ a ∈ numerator i, (1 - (Polynomial.X : Polynomial ℚ)^a)) =
      witness i * ∏ d ∈ denominator i, (1 - (Polynomial.X : Polynomial ℚ)^d)

def blockProduct {n k l : ℕ} (c : PositiveBlockCover n k l) : Polynomial ℚ :=
  ∏ i ∈ c.indices, c.witness i

theorem blockProduct_natCoeffs {n k l : ℕ} (c : PositiveBlockCover n k l) :
    NatCoeffs (blockProduct c) :=
  natCoeffs_prod c.indices c.witness c.witness_positive

theorem covered_factor_identity {n k l : ℕ} (c : PositiveBlockCover n k l) :
    (∏ d ∈ Finset.Ioc l k, (1-q^d)) * iota (blockProduct c) =
      ∏ a ∈ Finset.Ioc (n-k) (n-l), (1-q^a) := by
  classical
  have hD : (∏ i ∈ c.indices, ∏ d ∈ c.denominator i, (1-q^d : RatFunc ℚ)) =
      ∏ d ∈ Finset.Ioc l k, (1-q^d : RatFunc ℚ) := by
    rw [← Finset.prod_biUnion c.denominator_disjoint, c.denominator_cover]
  have hA : (∏ i ∈ c.indices, ∏ a ∈ c.numerator i, (1-q^a : RatFunc ℚ)) =
      ∏ a ∈ Finset.Ioc (n-k) (n-l), (1-q^a : RatFunc ℚ) := by
    rw [← Finset.prod_biUnion c.numerator_disjoint, c.numerator_cover]
  rw [blockProduct, map_prod, ← hD, ← Finset.prod_mul_distrib]
  calc
    (∏ i ∈ c.indices, (∏ d ∈ c.denominator i, (1-q^d)) * iota (c.witness i)) =
        ∏ i ∈ c.indices, ∏ a ∈ c.numerator i, (1-q^a) := by
      apply Finset.prod_congr rfl
      intro i hi
      rw [mul_comm]
      simpa only [map_mul, map_prod, map_sub, map_one, map_pow, q] using
        (congrArg iota (c.block_identity i hi)).symm
    _ = _ := hA

theorem block_quotient_identity (n k l : ℕ) (hlk : l ≤ k) (hkn : k ≤ n)
    (c : PositiveBlockCover n k l) :
    B n k = B n l * iota (blockProduct c) := by
  have hln : l ≤ n := hlk.trans hkn
  have hsub : n-k ≤ n-l := by omega
  have hp := covered_factor_identity c
  have hk := T_split l k hlk
  have hn := T_split (n-k) (n-l) hsub
  have hu : (∏ d ∈ Finset.Ioc l k, (1-q^d : RatFunc ℚ)) ≠ 0 := by
    apply Finset.prod_ne_zero_iff.mpr
    intro d hd
    exact factor_ne_zero d (by have := (Finset.mem_Ioc.mp hd).1; omega)
  have hv : (∏ d ∈ Finset.Ioc (n-k) (n-l), (1-q^d : RatFunc ℚ)) ≠ 0 := by
    apply Finset.prod_ne_zero_iff.mpr
    intro d hd
    exact factor_ne_zero d (by have := (Finset.mem_Ioc.mp hd).1; omega)
  have hP : iota (blockProduct c) ≠ 0 := by
    intro hz
    rw [hz, mul_zero] at hp
    exact hv hp.symm
  simp only [B, if_pos hkn, if_pos hln]
  rw [hk, hn, ← hp]
  field_simp [T_ne_zero, hu, hP]

theorem block_certificate (n k l : ℕ) (hlk : l ≤ k) (hkn : k ≤ n)
    (c : PositiveBlockCover n k l) :
    NatCoeffs (blockProduct c) ∧
    B n k = B n l * iota (blockProduct c) ∧
    ∀ H : Polynomial ℚ, B n l ≠ 0 → B n k = B n l * iota H →
      H = blockProduct c ∧ NatCoeffs H := by
  refine ⟨blockProduct_natCoeffs c, block_quotient_identity n k l hlk hkn c, ?_⟩
  intro H hB hH
  have heq : iota H = iota (blockProduct c) :=
    mul_left_cancel₀ hB (hH.symm.trans (block_quotient_identity n k l hlk hkn c))
  have hpoly := iota_injective heq
  exact ⟨hpoly, hpoly ▸ blockProduct_natCoeffs c⟩

end MathGKM.GaussianQuotient.Blocks
