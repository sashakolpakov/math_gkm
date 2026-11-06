import MathGKM.Markov

/-! Machine-authored round44: distinct distance-two donors for signed finite data. -/
namespace DistanceTwoR44
open scoped BigOperators
noncomputable section

def Capacity (N : ℕ) (e : ℕ → ℤ) : Prop :=
  ∀ l, l ≤ N → e l < 0 → l+2 ≤ N ∧ -e l ≤ e (l+2)

theorem finite_transport (N : ℕ) (e : ℕ → ℤ) (h : Capacity N e) :
    0 ≤ ∑ l ∈ Finset.range (N+1), e l := by
  classical
  let A := (Finset.range (N+1)).filter (fun l => e l < 0)
  let D := A.image (fun l => l+2)
  have ha (l : ℕ) (hl : l ∈ A) : l ≤ N ∧ e l < 0 := by
    simpa only [A, Finset.mem_filter, Finset.mem_range, Nat.lt_succ_iff] using hl
  have hd (l : ℕ) (hl : l ∈ D) : l ≤ N ∧ 0 < e l := by
    obtain ⟨a, ha', rfl⟩ := Finset.mem_image.mp hl
    have hh := h a (ha a ha').1 (ha a ha').2
    exact ⟨hh.1, by linarith [(ha a ha').2]⟩
  have hdis : Disjoint A D := by
    apply Finset.disjoint_left.mpr
    intro l hl hl'
    linarith [(ha l hl).2, (hd l hl').2]
  have hsub : A ∪ D ⊆ Finset.range (N+1) := by
    intro l hl
    rcases Finset.mem_union.mp hl with hl | hl
    · exact Finset.mem_range.mpr (by have := (ha l hl).1; omega : l < N+1)
    · exact Finset.mem_range.mpr (by have := (hd l hl).1; omega)
  have himg : (∑ l ∈ D, e l) = ∑ l ∈ A, e (l+2) := by
    apply Finset.sum_image
    intro a ha b hb hab
    change a+2=b+2 at hab
    omega
  have hp : 0 ≤ ∑ l ∈ A ∪ D, e l := by
    rw [Finset.sum_union hdis, himg, ← Finset.sum_add_distrib]
    apply Finset.sum_nonneg
    intro l hl
    have hh := (h l (ha l hl).1 (ha l hl).2).2
    linarith
  apply le_trans hp
  apply Finset.sum_le_sum_of_subset_of_nonneg hsub
  intro l hl hnot
  by_contra hn
  have hneg : e l < 0 := by omega
  exact hnot (Finset.mem_union_left D (Finset.mem_filter.mpr ⟨hl,hneg⟩))

def goodControl (l : ℕ) : ℤ := if l=0 then -2 else if l=2 then 3 else 0
def badControl (l : ℕ) : ℤ := if l=0 then -2 else if l=1 then 3 else 0

theorem controls :
    Capacity 2 goodControl ∧ (∑ l ∈ Finset.range 3, goodControl l)=1 ∧
    (∑ l ∈ Finset.range 3, badControl l)=1 ∧ ¬Capacity 2 badControl := by
  constructor
  · intro l hl hn
    interval_cases l <;> norm_num [goodControl] at *
  constructor
  · norm_num [goodControl, Finset.sum_range_succ]
  constructor
  · norm_num [badControl, Finset.sum_range_succ]
  · intro h
    have hh := h 0 (by omega) (by norm_num [badControl])
    norm_num [badControl] at hh

end
end DistanceTwoR44
#print axioms DistanceTwoR44.finite_transport
#print axioms DistanceTwoR44.controls
