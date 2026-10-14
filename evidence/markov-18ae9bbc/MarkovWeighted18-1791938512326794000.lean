import MarkovRawMatrix18
import MarkovExchange2d1

/-! Machine-authored worker 18ae9bbc. Weighted specialization and no
cancellation for nonnegative raw coefficients. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def weighted18 (m n : ℕ) : BiPoly →+* Polynomial ℤ :=
  eval₂RingHom (eval₂RingHom C (X^n)) (X^m)

@[simp] theorem weighted_U18 (m n : ℕ) : weighted18 m n U=X^m := by
  simp [weighted18,U]
@[simp] theorem weighted_V18 (m n : ℕ) : weighted18 m n V=X^n := by
  simp [weighted18,V]

theorem weighted_expansion18 (m n : ℕ) (p : BiPoly) :
    weighted18 m n p = ∑ i ∈ p.support, ∑ j ∈ (p.coeff i).support,
      C (coeff p i j) * X^(m*i+n*j) := by
  change p.eval₂ (eval₂RingHom C (X^n)) (X^m) = _
  rw [eval₂_eq_sum]
  change (∑ i ∈ p.support, (p.coeff i).eval₂ C (X^n) * (X^m)^i) = _
  simp only [eval₂_eq_sum,Polynomial.sum]
  simp only [Finset.sum_mul,← pow_mul]
  apply Finset.sum_congr rfl
  intro i hi
  apply Finset.sum_congr rfl
  intro j hj
  rw [pow_add]
  ring

theorem weighted_coeff18 (m n k : ℕ) (p : BiPoly) :
    (weighted18 m n p).coeff k = ∑ i ∈ p.support, ∑ j ∈ (p.coeff i).support,
      if m*i+n*j=k then coeff p i j else 0 := by
  rw [weighted_expansion18]
  simp [eq_comm]

theorem weighted_nonneg18 (m n : ℕ) {p : BiPoly} (hp : PolyNonneg16 p) (k : ℕ) :
    0 ≤ (weighted18 m n p).coeff k := by
  rw [weighted_coeff18]
  apply Finset.sum_nonneg
  intro i hi
  apply Finset.sum_nonneg
  intro j hj
  split_ifs <;> first | exact hp i j | exact le_rfl

theorem weighted_coeff_le18 (m n i j : ℕ) {p : BiPoly} (hp : PolyNonneg16 p) :
    coeff p i j ≤ (weighted18 m n p).coeff (m*i+n*j) := by
  by_cases hz : coeff p i j=0
  · rw [hz]; exact weighted_nonneg18 m n hp _
  have hj : j ∈ (p.coeff i).support := mem_support_iff.mpr hz
  have hi : i ∈ p.support := by
    apply mem_support_iff.mpr
    intro he
    apply hz
    simp [coeff,he]
  rw [weighted_coeff18]
  have hinner : coeff p i j ≤ ∑ k ∈ (p.coeff i).support,
      if m*i+n*k=m*i+n*j then coeff p i k else 0 := by
    simpa using Finset.single_le_sum
      (s := (p.coeff i).support) (a := j)
      (f := fun k => if m*i+n*k=m*i+n*j then coeff p i k else 0)
      (fun k hk => by split_ifs <;> first | exact hp i k | exact le_rfl) hj
  apply hinner.trans
  apply Finset.single_le_sum (a := i)
  · intro k hk
    apply Finset.sum_nonneg
    intro l hl
    split_ifs <;> first | exact hp k l | exact le_rfl
  · exact hi

theorem weighted_nonzero18 (m n : ℕ) {p : BiPoly} (hp : PolyNonneg16 p)
    (hz : p ≠ 0) : weighted18 m n p ≠ 0 := by
  intro he
  apply hz
  ext i j
  have h := weighted_coeff_le18 m n i j hp
  rw [he] at h
  have hzero : coeff p i j=0 := le_antisymm (by simpa using h) (hp i j)
  simpa [coeff] using hzero

def UniNonneg18 (p : Polynomial ℤ) : Prop := ∀ k, 0 ≤ p.coeff k

theorem order_add18 {p q : Polynomial ℤ} (hp : UniNonneg18 p)
    (hq : UniNonneg18 q) (hp0 : p≠0) (hq0 : q≠0) :
    (p+q).natTrailingDegree=min p.natTrailingDegree q.natTrailingDegree := by
  have hn : (p+q).coeff (min p.natTrailingDegree q.natTrailingDegree) ≠ 0 := by
    rw [coeff_add]
    rcases le_total p.natTrailingDegree q.natTrailingDegree with h | h
    · rw [min_eq_left h]
      have hpos : 0 < p.coeff p.natTrailingDegree :=
        lt_of_le_of_ne (hp _) (Ne.symm (coeff_natTrailingDegree_ne_zero.mpr hp0))
      linarith [hq p.natTrailingDegree]
    · rw [min_eq_right h]
      have hpos : 0 < q.coeff q.natTrailingDegree :=
        lt_of_le_of_ne (hq _) (Ne.symm (coeff_natTrailingDegree_ne_zero.mpr hq0))
      linarith [hp q.natTrailingDegree]
  apply le_antisymm (natTrailingDegree_le_of_ne_zero hn)
  by_contra h
  have hl : (p+q).natTrailingDegree < min p.natTrailingDegree q.natTrailingDegree := by omega
  have hz : (p+q).coeff (p+q).natTrailingDegree=0 := by
    rw [coeff_add,coeff_eq_zero_of_lt_natTrailingDegree (lt_of_lt_of_le hl (min_le_left _ _)),
      coeff_eq_zero_of_lt_natTrailingDegree (lt_of_lt_of_le hl (min_le_right _ _)),add_zero]
  have he := coeff_natTrailingDegree_eq_zero.mp hz
  exact hn (by simp [he])

theorem tropical_exchange18 (A B C D : ℕ) :
    min C D + min (2*A+C) (2*B+D) =
      min (2*min (A+C) (B+D)) (C+D+2*min A B) := by
  omega

#print axioms weighted_coeff_le18
#print axioms weighted_nonzero18
#print axioms order_add18
#print axioms tropical_exchange18
end
end MathGKM.Markov
