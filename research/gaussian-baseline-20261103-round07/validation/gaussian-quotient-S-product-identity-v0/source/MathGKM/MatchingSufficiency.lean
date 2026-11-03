import MathGKM.GaussianQuotient
import Mathlib.Algebra.Ring.GeomSum
import Mathlib.Algebra.BigOperators.Intervals
import Mathlib.Tactic

noncomputable section
open scoped BigOperators
namespace MathGKM.GaussianQuotient.Matching
open MathGKM.GaussianQuotient

def geom (d m : ℕ) : Polynomial ℚ :=
  ∑ j ∈ Finset.range m, Polynomial.X ^ (d * j)

theorem natCoeffs_one : NatCoeffs (1 : Polynomial ℚ) := by
  intro d
  by_cases h : d = 0
  · subst d; exact ⟨1, by simp⟩
  · exact ⟨0, by simp only [Polynomial.coeff_one, if_neg h, Nat.cast_zero]⟩

theorem natCoeffs_add {P Q : Polynomial ℚ} (hP : NatCoeffs P) (hQ : NatCoeffs Q) :
    NatCoeffs (P + Q) := by
  intro d
  obtain ⟨a, ha⟩ := hP d
  obtain ⟨b, hb⟩ := hQ d
  exact ⟨a+b, by simp [ha, hb]⟩

theorem natCoeffs_mul {P Q : Polynomial ℚ} (hP : NatCoeffs P) (hQ : NatCoeffs Q) :
    NatCoeffs (P * Q) := by
  classical
  intro d
  choose a ha using hP
  choose b hb using hQ
  refine ⟨∑ p ∈ Finset.antidiagonal d, a p.1 * b p.2, ?_⟩
  simp only [Polynomial.coeff_mul, ha, hb, Nat.cast_sum, Nat.cast_mul]

theorem natCoeffs_prod {ι : Type*} (s : Finset ι) (F : ι → Polynomial ℚ)
    (hF : ∀ i ∈ s, NatCoeffs (F i)) : NatCoeffs (∏ i ∈ s, F i) := by
  classical
  induction s using Finset.induction_on with
  | empty => simpa using natCoeffs_one
  | @insert i s hi ih =>
      rw [Finset.prod_insert hi]
      exact natCoeffs_mul (hF i (by simp)) (ih (fun j hj => hF j (by simp [hj])))

theorem natCoeffs_geom (d m : ℕ) : NatCoeffs (geom d m) := by
  induction m with
  | zero => intro i; exact ⟨0, by simp [geom]⟩
  | succ m ih =>
      rw [geom, Finset.sum_range_succ]
      apply natCoeffs_add ih
      intro i
      by_cases h : d*m = i
      · exact ⟨1, by simp [Polynomial.coeff_X_pow, h]⟩
      · exact ⟨0, by simp [Polynomial.coeff_X_pow, Ne.symm h]⟩

theorem geom_identity (d m : ℕ) :
    (1 - (Polynomial.X : Polynomial ℚ)^d) * geom d m = 1 - Polynomial.X^(d*m) := by
  simpa [geom, pow_mul] using mul_neg_geom_sum ((Polynomial.X : Polynomial ℚ)^d) m

def matchingProduct (k l : ℕ) (f : ℕ → ℕ) : Polynomial ℚ :=
  ∏ d ∈ Finset.Ioc l k, geom d (f d / d)

theorem natCoeffs_matchingProduct (k l : ℕ) (f : ℕ → ℕ) :
    NatCoeffs (matchingProduct k l f) :=
  natCoeffs_prod _ _ (fun _ _ => natCoeffs_geom _ _)

theorem matchingProduct_empty (k : ℕ) (f : ℕ → ℕ) :
    matchingProduct k k f = 1 := by simp [matchingProduct]

theorem iota_injective : Function.Injective iota := RatFunc.algebraMap_injective ℚ

theorem factor_ne_zero (d : ℕ) (hd : 0 < d) : (1 - q^d : RatFunc ℚ) ≠ 0 := by
  intro h
  have hp : (1 - (Polynomial.X : Polynomial ℚ)^d) = 0 := by
    apply iota_injective
    simpa [map_sub, map_pow, q] using h
  have hc := congrArg (fun p : Polynomial ℚ => p.coeff 0) hp
  simpa [Polynomial.coeff_X_pow, Nat.ne_of_gt hd, Ne.symm (Nat.ne_of_gt hd)] using hc

theorem T_ne_zero (m : ℕ) : T m ≠ 0 := by
  apply Finset.prod_ne_zero_iff.mpr
  intro i hi
  exact factor_ne_zero (i+1) (by omega)

theorem T_as_Ioc (m : ℕ) : T m = ∏ d ∈ Finset.Ioc 0 m, (1-q^d) := by
  unfold T
  apply Finset.prod_bij (fun i _ => i+1)
  · intro i hi; simp only [Finset.mem_range] at hi
    simp only [Finset.mem_Ioc]; omega
  · intro i hi j hj hij; omega
  · intro b hb
    simp only [Finset.mem_Ioc] at hb
    refine ⟨b-1, ?_, ?_⟩
    · simp only [Finset.mem_range]; omega
    · omega
  · intro i hi; rfl

theorem T_split (a b : ℕ) (hab : a ≤ b) :
    T b = T a * ∏ d ∈ Finset.Ioc a b, (1-q^d) := by
  simp only [T_as_Ioc]
  exact (Finset.prod_Ioc_consecutive (fun d => (1-q^d : RatFunc ℚ)) (Nat.zero_le a) hab).symm

theorem paired_identity (d a : ℕ) (hdvd : d ∣ a) :
    (1-q^d) * iota (geom d (a/d)) = 1-q^a := by
  have h := congrArg iota (geom_identity d (a/d))
  simpa only [map_mul, map_sub, map_one, map_pow, q, Nat.mul_div_cancel' hdvd] using h

theorem matched_factor_product (n k l : ℕ) (f : ℕ → ℕ)
    (hf : Set.BijOn f (↑(Finset.Ioc l k) : Set ℕ)
      (↑(Finset.Ioc (n-k) (n-l)) : Set ℕ))
    (hdiv : ∀ d ∈ Finset.Ioc l k, d ∣ f d) :
    (∏ d ∈ Finset.Ioc l k, (1-q^d)) * iota (matchingProduct k l f) =
      ∏ a ∈ Finset.Ioc (n-k) (n-l), (1-q^a) := by
  classical
  rw [matchingProduct, map_prod, ← Finset.prod_mul_distrib]
  calc
    (∏ d ∈ Finset.Ioc l k, (1-q^d) * iota (geom d (f d/d))) =
        ∏ d ∈ Finset.Ioc l k, (1-q^(f d)) := by
      apply Finset.prod_congr rfl
      intro d hd
      exact paired_identity d (f d) (hdiv d hd)
    _ = _ := by
      apply Finset.prod_bij (fun d _ => f d)
      · intro d hd; exact hf.mapsTo hd
      · intro d hd e he h; exact hf.injOn hd he h
      · intro a ha
        obtain ⟨d, hd, he⟩ := hf.surjOn ha
        exact ⟨d, hd, he⟩
      · intro d hd; rfl

theorem matching_identity (n k l : ℕ) (hlk : l ≤ k) (hkn : k ≤ n)
    (f : ℕ → ℕ)
    (hf : Set.BijOn f (↑(Finset.Ioc l k) : Set ℕ)
      (↑(Finset.Ioc (n-k) (n-l)) : Set ℕ))
    (hdiv : ∀ d ∈ Finset.Ioc l k, d ∣ f d) :
    B n k = B n l * iota (matchingProduct k l f) := by
  have hln : l ≤ n := hlk.trans hkn
  have hsub : n-k ≤ n-l := by omega
  have hp := matched_factor_product n k l f hf hdiv
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
  have hP : iota (matchingProduct k l f) ≠ 0 := by
    intro hz
    rw [hz, mul_zero] at hp
    exact hv hp.symm
  simp only [B, if_pos hkn, if_pos hln]
  rw [hk, hn, ← hp]
  field_simp [T_ne_zero, hu, hP]

theorem matching_sufficiency (n k l : ℕ) (hlk : l ≤ k) (hkn : k ≤ n)
    (f : ℕ → ℕ)
    (hf : Set.BijOn f (↑(Finset.Ioc l k) : Set ℕ)
      (↑(Finset.Ioc (n-k) (n-l)) : Set ℕ))
    (hdiv : ∀ d ∈ Finset.Ioc l k, d ∣ f d)
    (H : Polynomial ℚ) (hB : B n l ≠ 0)
    (hH : B n k = B n l * iota H) :
    H = matchingProduct k l f ∧ NatCoeffs H := by
  have heq : iota H = iota (matchingProduct k l f) :=
    mul_left_cancel₀ hB (hH.symm.trans (matching_identity n k l hlk hkn f hf hdiv))
  have hpoly := iota_injective heq
  exact ⟨hpoly, hpoly ▸ natCoeffs_matchingProduct k l f⟩

theorem matching_certificate (n k l : ℕ) (hlk : l ≤ k) (hkn : k ≤ n)
    (f : ℕ → ℕ)
    (hf : Set.BijOn f (↑(Finset.Ioc l k) : Set ℕ)
      (↑(Finset.Ioc (n-k) (n-l)) : Set ℕ))
    (hdiv : ∀ d ∈ Finset.Ioc l k, d ∣ f d) :
    NatCoeffs (matchingProduct k l f) ∧
    B n k = B n l * iota (matchingProduct k l f) ∧
    ∀ H : Polynomial ℚ, B n l ≠ 0 → B n k = B n l * iota H →
      H = matchingProduct k l f ∧ NatCoeffs H := by
  exact ⟨natCoeffs_matchingProduct k l f,
    matching_identity n k l hlk hkn f hf hdiv,
    fun H hB hH => matching_sufficiency n k l hlk hkn f hf hdiv H hB hH⟩

end MathGKM.GaussianQuotient.Matching
