import MathGKM.Round39MixtureInterfaceA
import MathGKM.Markov
def MathGKM.Target341e12a43f471bcd798d9fd4.Interface :=
  (
    True
  )
def MathGKM.Target341e12a43f471bcd798d9fd4.Transport (StudyInterface : MathGKM.Target341e12a43f471bcd798d9fd4.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target341e12a43f471bcd798d9fd4.Goal (StudyInterface : MathGKM.Target341e12a43f471bcd798d9fd4.Interface) : Prop :=
  (
    ∀ (ι : Type) (s : Finset ι) (f : ι → ℤ →₀ ℤ) (w : ι → ℕ), (∀ r ∈ s, ∀ x, 0 ≤ f r x) → (∀ r ∈ s, StateCrossR38.LC (f r)) → (∀ r ∈ s, ∀ q ∈ s, r ≠ q → StateCrossR38.Cross (f r) (f q)) → StateCrossR38.LC (fun x => Finset.sum s (fun r => (w r : ℤ)*f r x))
  )
