import MathGKM.IntervalBridgeR0000
import Mathlib.RingTheory.RootsOfUnity.Complex

noncomputable section
namespace MathGKM.GaussianQuotient.TwoDenominatorR0001
open Polynomial
open IntervalBridgeR0000

def P (m : ℕ) : Polynomial ℚ := 1 - X ^ m

theorem singleton_divisibility (u v c d : ℕ) (hu : 0 < u)
    (H : Polynomial ℚ) (h : P c * P d = P u * P v * H) :
    u ∣ c ∨ u ∣ d := by
  let z : ℂ := Complex.exp (2 * Real.pi * Complex.I / u)
  have hz : IsPrimitiveRoot z u := Complex.isPrimitiveRoot_exp u hu.ne'
  have he := congrArg (Polynomial.aeval z) h
  have hp : z ^ u = 1 := hz.pow_eq_one
  simp only [map_mul, P, map_sub, map_one, map_pow, aeval_X, hp, sub_self,
    zero_mul] at he
  rcases mul_eq_zero.mp he with hc | hd
  · exact Or.inl ((hz.pow_eq_one_iff_dvd c).mp (sub_eq_zero.mp hc).symm)
  · exact Or.inr ((hz.pow_eq_one_iff_dvd d).mp (sub_eq_zero.mp hd).symm)

theorem polynomiality_divisibility (a b : ℕ) (H : Polynomial ℚ)
    (h : F a b 2 = iota H) :
    ((a+1) ∣ (b+1) ∨ (a+1) ∣ (b+2)) ∧
    ((a+2) ∣ (b+1) ∨ (a+2) ∣ (b+2)) := by
  have hw : W a 2 ≠ 0 := by
    simp [W, Finset.prod_range_succ, factor_ne_zero]
  have he : W b 2 = W a 2 * iota H := by
    simpa [F, mul_comm] using (div_eq_iff hw).mp h
  have hpoly : P (b+1) * P (b+2) = P (a+1) * P (a+2) * H := by
    apply iota_injective
    simpa [P, W, Finset.prod_range_succ, q, map_mul, map_sub, map_pow] using he
  refine ⟨singleton_divisibility _ _ _ _ (by omega) H hpoly, ?_⟩
  apply singleton_divisibility (a+2) (a+1) (b+1) (b+2) (by omega) H
  simpa [mul_comm (P (a+1)) (P (a+2))] using hpoly

theorem arithmetic_alternatives (a b : ℕ)
    (hu : (a+1) ∣ (b+1) ∨ (a+1) ∣ (b+2))
    (hv : (a+2) ∣ (b+1) ∨ (a+2) ∣ (b+2)) :
    (((a+1) ∣ (b+1) ∧ (a+2) ∣ (b+2)) ∨
     ((a+1) ∣ (b+2) ∧ (a+2) ∣ (b+1))) ∨
    ((a+1)*(a+2) ∣ (b+1) ∨ (a+1)*(a+2) ∣ (b+2)) := by
  have hc : Nat.Coprime (a+1) (a+2) := by
    exact (Nat.coprime_self_add_right).mpr (Nat.coprime_one_right _)
  rcases hu with hu | hu <;> rcases hv with hv | hv
  · exact Or.inr (Or.inl (hc.mul_dvd_of_dvd_of_dvd hu hv))
  · exact Or.inl (Or.inl ⟨hu, hv⟩)
  · exact Or.inl (Or.inr ⟨hu, hv⟩)
  · exact Or.inr (Or.inr (hc.mul_dvd_of_dvd_of_dvd hu hv))

theorem common_degree_exponents (u t : ℕ) (hu : 1 < u) (ht : 0 < t) :
    0 < (u+1)*t-1 ∧ 0 < (u+1)*t-u ∧
    u*((u+1)*t-1)+(u+1)*1 = u*(u+1)*t+1 ∧
    u*((u+1)*t-u)+(u+1)*(u-1)+1 = u*(u+1)*t ∧
    (u*(u+1)*t+1)%u = 1 ∧ (u*(u+1)*t-1)%u = u-1 := by
  have htu : u+1 ≤ (u+1)*t := Nat.le_mul_of_pos_right _ ht
  have hC : 1 ≤ u*(u+1)*t := Nat.one_le_iff_ne_zero.mpr (by positivity)
  have hminus : u*((u+1)*t-u)+(u+1)*(u-1)+1 = u*(u+1)*t := by
    have h1 := congrArg (u * ·) (Nat.sub_add_cancel (show u ≤ (u+1)*t by omega))
    have h2 := congrArg ((u+1) * ·) (Nat.sub_add_cancel (show 1 ≤ u by omega))
    nlinarith only [h1, h2]
  refine ⟨by omega, by omega, ?_, hminus, ?_, ?_⟩
  · have h1 := congrArg (u * ·) (Nat.sub_add_cancel (show 1 ≤ (u+1)*t by omega))
    nlinarith only [h1]
  · simp [Nat.mul_mod, Nat.add_mod, Nat.mod_eq_of_lt (show 1 < u from hu)]
  · have he : u*(u+1)*t-1 = u*((u+1)*t-u)+(u+1)*(u-1) := by omega
    rw [he]
    simp [Nat.add_mod, Nat.mul_mod, Nat.mod_eq_of_lt hu,
      Nat.mod_eq_of_lt (show u-1 < u by omega)]

/-- Positive pure-power degrees, allowing the two numerator degrees to be interchanged. -/
def Matched (u v c d : ℕ) : Prop :=
  ∃ A B : ℕ, 0 < A ∧ 0 < B ∧
    ((c = u*A ∧ d = v*B) ∨ (d = u*A ∧ c = v*B))

/-- All bounds needed for the binomial and for its two standard-monomial rectangles. -/
def Mixed (u v c d : ℕ) : Prop :=
  ∃ A B i j : ℕ, 0 < A ∧ 0 < B ∧ 0 < i ∧ 0 < j ∧ i < A ∧ j ≤ B ∧
    u*A = v*B ∧
    ((c = u*A ∧ d = u*i+v*j) ∨ (d = u*A ∧ c = u*i+v*j))

theorem common_degree_division (u t : ℕ) (hu : 1 < u) (ht : 0 < t) :
    (u*(u+1)*t+1)/u = (u+1)*t ∧
    (u*(u+1)*t-1)/u = (u+1)*t-1 ∧
    (u*(u+1)*t+1)/u - (u*(u+1)*t+1)%u = (u+1)*t-1 ∧
    (u*(u+1)*t-1)/u - (u*(u+1)*t-1)%u = (u+1)*t-u := by
  have hbound : u+1 ≤ (u+1)*t := Nat.le_mul_of_pos_right _ ht
  have hplus : (u*(u+1)*t+1)/u = (u+1)*t := by
    rw [Nat.mul_assoc, Nat.add_comm, Nat.add_mul_div_left _ _ (by omega)]
    simp [Nat.div_eq_of_lt hu]
  have hminus : (u*(u+1)*t-1)/u = (u+1)*t-1 := by
    have h1 := congrArg (u * ·) (Nat.sub_add_cancel (show 1 ≤ (u+1)*t by omega))
    have h2 : u*(u+1)*t-1 = u*((u+1)*t-1)+(u-1) := by
      have h3 : u-1+1=u := Nat.sub_add_cancel (by omega)
      have : u*((u+1)*t-1)+(u-1)+1 = u*(u+1)*t := by nlinarith only [h1,h3]
      omega
    rw [h2]
    rw [Nat.add_comm, Nat.add_mul_div_left _ _ (by omega)]
    simp [Nat.div_eq_of_lt (show u-1 < u by omega)]
  obtain ⟨_, _, _, _, hrplus, hrminus⟩ := common_degree_exponents u t hu ht
  refine ⟨hplus, hminus, ?_, ?_⟩
  · rw [hplus,hrplus]
  · rw [hminus,hrminus]
    omega

theorem matched_of_divisibility (u v c d : ℕ) (hc : 0 < c) (hd : 0 < d)
    (h : (u ∣ c ∧ v ∣ d) ∨ (u ∣ d ∧ v ∣ c)) : Matched u v c d := by
  rcases h with ⟨⟨A, hA⟩, ⟨B, hB⟩⟩ | ⟨⟨A, hA⟩, ⟨B, hB⟩⟩
  · refine ⟨A, B, ?_, ?_, Or.inl ⟨hA, hB⟩⟩ <;> nlinarith
  · refine ⟨A, B, ?_, ?_, Or.inr ⟨hA, hB⟩⟩ <;> nlinarith

theorem data_of_singletons (a b : ℕ)
    (hu : (a+1) ∣ (b+1) ∨ (a+1) ∣ (b+2))
    (hv : (a+2) ∣ (b+1) ∨ (a+2) ∣ (b+2)) :
    Matched (a+1) (a+2) (b+1) (b+2) ∨ Mixed (a+1) (a+2) (b+1) (b+2) := by
  by_cases ha : a = 0
  · subst a
    apply Or.inl
    apply matched_of_divisibility _ _ _ _ (by omega) (by omega)
    rcases hv with hv | hv
    · exact Or.inr ⟨one_dvd _, hv⟩
    · exact Or.inl ⟨one_dvd _, hv⟩
  rcases arithmetic_alternatives a b hu hv with hm | hC
  · exact Or.inl (matched_of_divisibility _ _ _ _ (by omega) (by omega) hm)
  apply Or.inr
  have ha' : 1 < a+1 := by omega
  rcases hC with ⟨t, ht⟩ | ⟨t, ht⟩
  · have ht' : 0 < t := by
      by_contra! hn
      have : t = 0 := by omega
      simp [this] at ht
    obtain ⟨hi, _, he, _, _, _⟩ := common_degree_exponents (a+1) t ha' ht'
    have hbound : a+2 ≤ (a+2)*t := Nat.le_mul_of_pos_right _ ht'
    refine ⟨(a+2)*t, (a+1)*t, (a+2)*t-1, 1,
      by positivity, by positivity, ?_, by omega, by omega, ?_, ?_, Or.inl ⟨?_, ?_⟩⟩
    · simpa [Nat.add_assoc] using hi
    · exact Nat.one_le_iff_ne_zero.mpr (by positivity)
    · ring
    · nlinarith [ht]
    · simpa only [show a+1+1=a+2 by omega] using (show b+2 = (a+1)*((a+1+1)*t-1)+(a+1+1)*1 by nlinarith [he,ht])
  · have ht' : 0 < t := by
      by_contra! hn
      have : t = 0 := by omega
      simp [this] at ht
    obtain ⟨_, hi, _, he, _, _⟩ := common_degree_exponents (a+1) t ha' ht'
    have hbound : a+2 ≤ (a+2)*t := Nat.le_mul_of_pos_right _ ht'
    have hbound' : a+1 ≤ (a+1)*t := Nat.le_mul_of_pos_right _ ht'
    refine ⟨(a+2)*t, (a+1)*t, (a+2)*t-(a+1), a,
      by positivity, by positivity, ?_, by omega, by omega, by omega, ?_, Or.inr ⟨?_, ?_⟩⟩
    · simpa [Nat.add_assoc] using hi
    · ring
    · nlinarith [ht]
    · simpa only [show a+1+1=a+2 by omega, Nat.add_sub_cancel] using
        (show b+1 = (a+1)*((a+1+1)*t-(a+1))+(a+1+1)*(a+1-1) by nlinarith [he,ht])

theorem universal_arithmetic (a b : ℕ) (H : Polynomial ℚ)
    (h : F a b 2 = iota H) :
    Matched (a+1) (a+2) (b+1) (b+2) ∨ Mixed (a+1) (a+2) (b+1) (b+2) := by
  obtain ⟨hu,hv⟩ := polynomiality_divisibility a b H h
  exact data_of_singletons a b hu hv

end MathGKM.GaussianQuotient.TwoDenominatorR0001
