import MathGKM.Round41SupportA
import MathGKM.Round40ConsumerA

/-! Machine-authored round41. Exact reindexing, with no sign inference. -/
namespace GroupedSignsR41
open scoped BigOperators
noncomputable section

theorem bounded_antidiagonal (n l : ℕ) (f : ℕ → ℕ → ℤ) :
    (∑ s ∈ Finset.range (n+1), ∑ t ∈ Finset.range (n+1),
      if s+t=l then f s t else 0) =
    ∑ s ∈ Finset.range (n+1),
      if s ≤ l ∧ l-s ≤ n then f s (l-s) else 0 := by
  classical
  apply Finset.sum_congr rfl
  intro s hs
  by_cases hsl : s ≤ l
  · have he (t : ℕ) : s+t=l ↔ t=l-s := by omega
    simp only [he]
    simp [Finset.sum_ite_eq', hsl]
  · have he (t : ℕ) : ¬s+t=l := by omega
    simp [he, hsl]

theorem group_antidiagonal (n i j dx dy l : ℕ) :
    GroupedR40.group n i j dx dy l =
    ∑ s ∈ Finset.range (n+1),
      if s ≤ l ∧ l-s ≤ n then
        MidpointR36.W n (i+dx) (j+dy) s * MidpointR36.W n (i+dx) (j+dy) (l-s) -
        MidpointR36.W n i j s * MidpointR36.W n (i+2*dx) (j+2*dy) (l-s)
      else 0 := by
  exact bounded_antidiagonal n l _

theorem reflection (n l : ℕ) (f : ℕ → ℕ → ℤ) :
    (∑ s ∈ Finset.range (n+1),
      if s ≤ l ∧ l-s ≤ n then f s (l-s) else 0) =
    ∑ s ∈ Finset.range (n+1),
      if s ≤ l ∧ l-s ≤ n then f (l-s) s else 0 := by
  rw [← bounded_antidiagonal n l f, ← bounded_antidiagonal n l (fun s t => f t s)]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro s hs
  apply Finset.sum_congr rfl
  intro t ht
  rw [Nat.add_comm t s]

theorem symmetrized_group (n i j dx dy l : ℕ) :
    2 * GroupedR40.group n i j dx dy l =
    ∑ s ∈ Finset.range (n+1),
      if s ≤ l ∧ l-s ≤ n then
        2 * (MidpointR36.W n (i+dx) (j+dy) s * MidpointR36.W n (i+dx) (j+dy) (l-s)) -
        MidpointR36.W n i j s * MidpointR36.W n (i+2*dx) (j+2*dy) (l-s) -
        MidpointR36.W n i j (l-s) * MidpointR36.W n (i+2*dx) (j+2*dy) s
      else 0 := by
  let f := fun s t =>
    MidpointR36.W n (i+dx) (j+dy) s * MidpointR36.W n (i+dx) (j+dy) t -
    MidpointR36.W n i j s * MidpointR36.W n (i+2*dx) (j+2*dy) t
  have hr := reflection n l f
  rw [group_antidiagonal]
  change 2 * (∑ s ∈ Finset.range (n+1), if s ≤ l ∧ l-s ≤ n then f s (l-s) else 0) = _
  rw [two_mul]
  conv_lhs =>
    rhs
    rw [hr]
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro s hs
  split_ifs <;> simp [f] <;> ring

end
end GroupedSignsR41

#print axioms GroupedSignsR41.group_antidiagonal
#print axioms GroupedSignsR41.symmetrized_group
