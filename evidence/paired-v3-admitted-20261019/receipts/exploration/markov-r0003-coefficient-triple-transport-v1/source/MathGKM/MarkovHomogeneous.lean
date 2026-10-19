import MathGKM.MarkovSupport

/-! Machine-authored round-0002. Three nested polynomial variables are w,u,v.
TriHomogeneous is the explicit coefficient definition of total homogeneity. -/
namespace MathGKM.Markov
noncomputable section
open scoped BigOperators

abbrev TriPoly := Polynomial BiPoly
def triCoeff (F : TriPoly) (k i j : ℕ) : ℤ := coeff (F.coeff k) i j
def TriHomogeneous (F : TriPoly) (d : ℕ) : Prop :=
  ∀ k i j, k+i+j ≠ d → triCoeff F k i j = 0
def homogeneousLift (P : BiPoly) (d : ℕ) : TriPoly :=
  ∑ i ∈ Finset.range (d+1), ∑ j ∈ Finset.range (d+1),
    Polynomial.monomial (d-i-j)
      (Polynomial.monomial i (Polynomial.monomial j (coeff P i j)))
def dehomogenize (F : TriPoly) : BiPoly := F.eval 1

lemma triCoeff_monomial (a b c k i j : ℕ) (z : ℤ) :
    triCoeff (Polynomial.monomial c (Polynomial.monomial a (Polynomial.monomial b z))) k i j =
      if a=i ∧ b=j ∧ c=k then z else 0 := by
  by_cases ha : a=i <;> by_cases hb : b=j <;> by_cases hc : c=k <;>
    simp_all [triCoeff, coeff, Polynomial.coeff_monomial]

lemma lift_coeff_raw (P : BiPoly) (d k i j : ℕ) :
    triCoeff (homogeneousLift P d) k i j =
      if i ≤ d ∧ j ≤ d ∧ d-i-j = k then coeff P i j else 0 := by
  classical
  simp only [homogeneousLift, triCoeff, coeff, Polynomial.finsetSum_coeff]
  change (∑ a ∈ Finset.range (d+1), ∑ b ∈ Finset.range (d+1),
    triCoeff (Polynomial.monomial (d-a-b)
      (Polynomial.monomial a (Polynomial.monomial b (coeff P a b)))) k i j) = _
  simp_rw [triCoeff_monomial, ite_and]
  by_cases hi : i ≤ d
  · by_cases hj : j ≤ d
    · simp [hi, hj, Nat.lt_succ_iff, coeff]
    · simp [hi, hj, Nat.lt_succ_iff]
  · simp [hi, Nat.lt_succ_iff]

theorem lift_coeff (P : BiPoly) (d : ℕ) (h : SupportBound P d) (k i j : ℕ) :
    triCoeff (homogeneousLift P d) k i j =
      if k+i+j = d then coeff P i j else 0 := by
  rw [lift_coeff_raw]
  by_cases hij : i+j ≤ d
  · have hi : i ≤ d := by omega
    have hj : j ≤ d := by omega
    have he : d-i-j = k ↔ k+i+j = d := by omega
    simp [hi, hj, he]
  · have hz := h i j (by omega)
    simp [hz]

theorem lift_homogeneous (P : BiPoly) (d : ℕ) (h : SupportBound P d) :
    TriHomogeneous (homogeneousLift P d) d := by
  intro k i j hne
  rw [lift_coeff P d h]
  simp [hne]

theorem lift_coefficient_recovery (P : BiPoly) (d : ℕ) (h : SupportBound P d)
    (i j : ℕ) : triCoeff (homogeneousLift P d) (d-i-j) i j = coeff P i j := by
  rw [lift_coeff P d h]
  by_cases hij : i+j ≤ d
  · rw [if_pos (by omega)]
  · rw [h i j (by omega)]
    simp

lemma dehom_lift_coeff (P : BiPoly) (d i j : ℕ) :
    coeff (dehomogenize (homogeneousLift P d)) i j =
      if i ≤ d ∧ j ≤ d then coeff P i j else 0 := by
  classical
  simp only [dehomogenize, homogeneousLift, Polynomial.eval_finsetSum,
    Polynomial.eval_monomial, one_pow, mul_one]
  by_cases hi : i ≤ d <;> by_cases hj : j ≤ d <;>
    simp [hi, hj, coeff, Polynomial.finsetSum_coeff, Polynomial.coeff_monomial,
    apply_ite, ite_apply, Nat.lt_succ_iff, ite_and]

theorem dehomogenize_lift (P : BiPoly) (d : ℕ) (h : SupportBound P d) :
    dehomogenize (homogeneousLift P d) = P := by
  apply Polynomial.ext
  intro i
  apply Polynomial.ext
  intro j
  change coeff (dehomogenize (homogeneousLift P d)) i j = coeff P i j
  rw [dehom_lift_coeff]
  split_ifs with hij
  · rfl
  · exact (h i j (by omega)).symm

lemma dehom_coeff (F : TriPoly) (i j : ℕ) :
    coeff (dehomogenize F) i j = ∑ k ∈ F.support, triCoeff F k i j := by
  simp [dehomogenize, Polynomial.eval_eq_sum, Polynomial.sum, coeff, triCoeff,
    Polynomial.finsetSum_coeff]

theorem homogeneous_dehom_coeff (F : TriPoly) (d : ℕ) (h : TriHomogeneous F d)
    (k i j : ℕ) (he : k+i+j = d) :
    coeff (dehomogenize F) i j = triCoeff F k i j := by
  classical
  rw [dehom_coeff]
  apply Finset.sum_eq_single k
  · intro l hl hne
    exact h l i j (by omega)
  · intro hk
    have hz : F.coeff k = 0 := by simpa only [Polynomial.mem_support_iff, not_not] using hk
    simp [triCoeff, hz, coeff]

theorem homogeneous_dehom_injective (d : ℕ) (F G : TriPoly)
    (hF : TriHomogeneous F d) (hG : TriHomogeneous G d)
    (he : dehomogenize F = dehomogenize G) : F = G := by
  apply Polynomial.ext
  intro k
  apply Polynomial.ext
  intro i
  apply Polynomial.ext
  intro j
  change triCoeff F k i j = triCoeff G k i j
  by_cases hd : k+i+j = d
  · rw [← homogeneous_dehom_coeff F d hF k i j hd,
      ← homogeneous_dehom_coeff G d hG k i j hd, he]
  · rw [hF k i j hd, hG k i j hd]

theorem homogeneous_lift_unique (P : BiPoly) (d : ℕ) (h : SupportBound P d)
    (F : TriPoly) (hF : TriHomogeneous F d) (he : dehomogenize F = P) :
    F = homogeneousLift P d := by
  apply homogeneous_dehom_injective d F (homogeneousLift P d) hF
    (lift_homogeneous P d h)
  rw [he, dehomogenize_lift P d h]

theorem homogeneous_lift_laws (P : BiPoly) (d : ℕ) (h : SupportBound P d) :
    TriHomogeneous (homogeneousLift P d) d ∧
    dehomogenize (homogeneousLift P d) = P ∧
    (∀ k i j, triCoeff (homogeneousLift P d) k i j =
      if k+i+j = d then coeff P i j else 0) ∧
    (∀ i j, triCoeff (homogeneousLift P d) (d-i-j) i j = coeff P i j) ∧
    (∀ F : TriPoly, TriHomogeneous F d → dehomogenize F = P →
      F = homogeneousLift P d) := by
  exact ⟨lift_homogeneous P d h, dehomogenize_lift P d h, lift_coeff P d h,
    lift_coefficient_recovery P d h, fun F hF he => homogeneous_lift_unique P d h F hF he⟩

theorem endpoint_homogeneous_lifts :
    TriHomogeneous (homogeneousLift 1 0) 0 ∧
    dehomogenize (homogeneousLift 1 0) = 1 ∧
    TriHomogeneous (homogeneousLift (U+V) 1) 1 ∧
    dehomogenize (homogeneousLift (U+V) 1) = U+V := by
  exact ⟨lift_homogeneous _ _ SupportBound.one, dehomogenize_lift _ _ SupportBound.one,
    lift_homogeneous _ _ (SupportBound.u.add SupportBound.v),
    dehomogenize_lift _ _ (SupportBound.u.add SupportBound.v)⟩

theorem path_homogeneous_lift (path : List Bool) :
    let m := (frame path).mid
    let d := m.a+m.b-1
    TriHomogeneous (homogeneousLift m.p d) d ∧
    dehomogenize (homogeneousLift m.p d) = m.p ∧
    (∀ i j, triCoeff (homogeneousLift m.p d) (d-i-j) i j = coeff m.p i j) ∧
    (∀ F : TriPoly, TriHomogeneous F d → dehomogenize F = m.p →
      F = homogeneousLift m.p d) := by
  have h := (frame_support_bound path).2.1
  exact ⟨lift_homogeneous _ _ h, dehomogenize_lift _ _ h,
    lift_coefficient_recovery _ _ h, fun F hF he => homogeneous_lift_unique _ _ h F hF he⟩

end
end MathGKM.Markov
