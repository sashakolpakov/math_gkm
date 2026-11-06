import MathGKM.Round100ControlsA

/- Machine-authored r100. CONDITIONAL signed-sequence model. No claim here
identifies these row formulas with actual matching coefficients. -/
namespace NeighborFlowR100
open scoped BigOperators
noncomputable section

theorem isolated_loss_bound (K : ℕ) (d : ℕ → ℤ) (T : ℕ → ℕ → ℤ)
    (hK : 3≤K) (hf : Feasible K d T)
    (h1 : 0≤d 1) (h2 : d 2≤0) (h3 : d 3=0) : 0≤d 1+d 2 := by
  have h := hall_bound K d T hf {2} {1,2,3} (by
    intro a ha
    have ha : a=2 := Finset.mem_singleton.mp ha
    subst a
    exact Finset.mem_range.mpr (by omega)) (by
    intro c hc
    simp only [Finset.mem_insert,Finset.mem_singleton] at hc
    exact Finset.mem_range.mpr (by omega)) (by
    intro a ha c hc hnc
    have ha : a=2 := Finset.mem_singleton.mp ha
    subst a
    simp only [Finset.mem_insert,Finset.mem_singleton] at hnc
    apply hf.2.2.2 2 (Finset.mem_range.mpr (by omega)) c hc
    omega)
  have hneg : 0≤-d 2 := by omega
  simp [loss,gain,h3,max_eq_left h1,max_eq_right h2,max_eq_left hneg] at h
  omega

theorem corner_model_necessary (n : ℤ) (K : ℕ) (d : ℕ → ℤ)
    (T : ℕ → ℕ → ℤ) (hn : 2≤n) (hK : 3≤K)
    (hf : Feasible K d T) (h1 : d 1=8*(n-1))
    (h2 : 2*d 2= -n^2+11*n-16) (h3 : d 3=0) :
    n^2≤27*n-32 := by
  by_cases hd : d 2≤0
  · have hb := isolated_loss_bound K d T hK hf (by rw [h1]; omega) hd h3
    rw [h1] at hb
    nlinarith
  · have hd : 0<d 2 := by omega
    nlinarith

end
end NeighborFlowR100
#print axioms NeighborFlowR100.isolated_loss_bound
#print axioms NeighborFlowR100.corner_model_necessary
