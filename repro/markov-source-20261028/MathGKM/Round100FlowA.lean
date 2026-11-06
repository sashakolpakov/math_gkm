import Mathlib
import MathGKM.ResearchSemantics

/- Machine-authored r100. A finite capacity certificate has an unconditional
algebraic implication; existence for the actual family remains conjectural. -/
namespace NeighborFlowR100
open scoped BigOperators
noncomputable section

def loss (d : ℕ → ℤ) (a : ℕ) : ℤ := max (-d a) 0
def gain (d : ℕ → ℤ) (a : ℕ) : ℤ := max (d a) 0
def Feasible (K : ℕ) (d : ℕ → ℤ) (T : ℕ → ℕ → ℤ) : Prop :=
  (∀ a ∈ Finset.range (K+1), ∀ c ∈ Finset.range (K+1), 0 ≤ T a c) ∧
  (∀ a ∈ Finset.range (K+1), ∑ c ∈ Finset.range (K+1), T a c = loss d a) ∧
  (∀ c ∈ Finset.range (K+1), ∑ a ∈ Finset.range (K+1), T a c ≤ gain d c) ∧
  (∀ a ∈ Finset.range (K+1), ∀ c ∈ Finset.range (K+1),
    a+1<c ∨ c+1<a → T a c=0)

theorem gain_sub_loss (d : ℕ → ℤ) (a : ℕ) : gain d a-loss d a=d a := by
  unfold gain loss
  omega

theorem feasible_total (K : ℕ) (d : ℕ → ℤ) (T : ℕ → ℕ → ℤ)
    (h : Feasible K d T) : 0 ≤ ∑ a ∈ Finset.range (K+1), d a := by
  have hr : (∑ a ∈ Finset.range (K+1), loss d a) =
      ∑ a ∈ Finset.range (K+1), ∑ c ∈ Finset.range (K+1), T a c :=
    Finset.sum_congr rfl (fun a ha => (h.2.1 a ha).symm)
  have hc := Finset.sum_le_sum h.2.2.1
  rw [Finset.sum_comm] at hr
  have hm : (∑ a ∈ Finset.range (K+1), loss d a) ≤
      ∑ a ∈ Finset.range (K+1), gain d a := hr.trans_le hc
  have he : (∑ a ∈ Finset.range (K+1), d a) =
      (∑ a ∈ Finset.range (K+1), gain d a) -
      (∑ a ∈ Finset.range (K+1), loss d a) := by
    rw [← Finset.sum_sub_distrib]
    exact Finset.sum_congr rfl (fun a _ => (gain_sub_loss d a).symm)
  rw [he]
  omega

theorem hall_bound (K : ℕ) (d : ℕ → ℤ) (T : ℕ → ℕ → ℤ)
    (h : Feasible K d T) (A C : Finset ℕ)
    (hA : A ⊆ Finset.range (K+1)) (hC : C ⊆ Finset.range (K+1))
    (hlocal : ∀ a ∈ A, ∀ c ∈ Finset.range (K+1), c ∉ C → T a c=0) :
    ∑ a ∈ A, loss d a ≤ ∑ c ∈ C, gain d c := by
  have hr : (∑ a ∈ A, loss d a) = ∑ c ∈ C, ∑ a ∈ A, T a c := by
    calc
      _ = ∑ a ∈ A, ∑ c ∈ Finset.range (K+1), T a c :=
        Finset.sum_congr rfl (fun a ha => (h.2.1 a (hA ha)).symm)
      _ = ∑ a ∈ A, ∑ c ∈ C, T a c := by
        apply Finset.sum_congr rfl
        intro a ha
        symm
        exact Finset.sum_subset hC (fun c hc hnc => hlocal a ha c hc hnc)
      _ = _ := Finset.sum_comm
  rw [hr]
  apply Finset.sum_le_sum
  intro c hc
  calc
    _ ≤ ∑ a ∈ Finset.range (K+1), T a c :=
      Finset.sum_le_sum_of_subset_of_nonneg hA (fun a ha _ => h.1 a ha c (hC hc))
    _ ≤ _ := h.2.2.1 c (hC hc)

end
end NeighborFlowR100
#print axioms NeighborFlowR100.feasible_total
#print axioms NeighborFlowR100.hall_bound
