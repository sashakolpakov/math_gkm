import MathGKM.Round100FlowA

/- Machine-authored r100. Generic controls distinguish locality from surplus;
neither control is asserted to arise from a Markov polynomial. -/
namespace NeighborFlowR100
open scoped BigOperators
noncomputable section
def near (a : ℕ) : ℤ := if a=0 then -2 else if a=1 then 3 else 0
def far (a : ℕ) : ℤ := if a=0 then -2 else if a=2 then 3 else 0
def nearT (a c : ℕ) : ℤ := if a=0 ∧ c=1 then 2 else 0

theorem near_feasible : Feasible 2 near nearT := by
  refine ⟨?_,?_,?_,?_⟩
  · intro a ha c hc
    unfold nearT
    split_ifs <;> norm_num
  · intro a ha
    have ha : a=0 ∨ a=1 ∨ a=2 := by simp only [Finset.mem_range] at ha; omega
    rcases ha with rfl | rfl | rfl <;>
      norm_num [Finset.sum_range_succ,nearT,loss,near]
  · intro c hc
    have hc : c=0 ∨ c=1 ∨ c=2 := by simp only [Finset.mem_range] at hc; omega
    rcases hc with rfl | rfl | rfl <;>
      norm_num [Finset.sum_range_succ,nearT,gain,near]
  · intro a ha c hc h
    unfold nearT
    split_ifs with he
    · omega
    · rfl

theorem far_infeasible : ¬∃ T, Feasible 2 far T := by
  rintro ⟨T,hT⟩
  have h := hall_bound 2 far T hT {0} {0,1} (by decide) (by decide) (by
    intro a ha c hc hnc
    have ha : a=0 := Finset.mem_singleton.mp ha
    subst a
    have hc : c=2 := by
      simp only [Finset.mem_range] at hc
      simp only [Finset.mem_insert,Finset.mem_singleton] at hnc
      omega
    subst c
    exact hT.2.2.2 0 (by decide) 2 (by decide) (Or.inl (by omega)))
  norm_num [loss,gain,far] at h

theorem controls :
    Feasible 2 near nearT ∧ (¬∃ T, Feasible 2 far T) ∧
    (∑ a ∈ Finset.range 3, near a)=1 ∧
    (∑ a ∈ Finset.range 3, far a)=1 := by
  refine ⟨near_feasible,far_infeasible,?_,?_⟩ <;>
    norm_num [Finset.sum_range_succ,near,far]

end
end NeighborFlowR100
#print axioms NeighborFlowR100.controls
