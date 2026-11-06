import MathGKM.Round29ArrayA
import MathGKM.Acceptedca243b91dcc504ccd59a3d76

/-! Machine-authored original-predicate transport, committed round29. -/
namespace EndpointR29
open MathGKM.Markov RenewalR28

theorem actual_endpoint : ∀ k : ℕ,
    WeakLC 1 (k+2) (frame (List.replicate k false)).mid.p := by
  intro k
  have recover := Acceptedca243b91dcc504ccd59a3d76.obligation
  have hc : ∀ i j, coeff (frame (List.replicate k false)).mid.p i j=mc (k+2) i j := by
    intro i j
    exact recover.2.2.2 k i j
  have h := directional_bundle (k+2) (by omega)
  refine ⟨?_,?_,?_⟩
  · intro i j p0 p1 p2
    simp only [hc]
    exact h.1 i j p0 p1 p2
  · intro i j p0 p1 p2
    simp only [hc]
    exact h.2.1 i j p0 p1 p2
  · intro i j p0 p1 p2
    simp only [hc]
    exact h.2.2 i j p0 p1 p2

theorem actual_labels (k : ℕ) :
    WeakLC (frame (List.replicate k false)).mid.a
      (frame (List.replicate k false)).mid.b
      (frame (List.replicate k false)).mid.p := by
  have h := Acceptedca243b91dcc504ccd59a3d76.obligation.1 k
  rw [h.2.1,h.2.2.1]
  exact actual_endpoint k

end EndpointR29
