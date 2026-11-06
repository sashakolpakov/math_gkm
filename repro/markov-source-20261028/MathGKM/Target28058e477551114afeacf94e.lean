import MathGKM.Round122MassA
import MathGKM.Markov
def MathGKM.Target28058e477551114afeacf94e.Interface :=
  (
    True
  )
def MathGKM.Target28058e477551114afeacf94e.Transport (StudyInterface : MathGKM.Target28058e477551114afeacf94e.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target28058e477551114afeacf94e.Goal (StudyInterface : MathGKM.Target28058e477551114afeacf94e.Interface) : Prop :=
  (
    ∀ (A B : Type) (X : Finset A) (Y : Finset B) (w : A → B → ℚ),
      (∀ x ∈ X, ∀ y ∈ Y, 0 ≤ w x y) →
      (∀ x ∈ X, Finset.sum Y (fun y => w x y) = 1) →
      (∀ y ∈ Y, Finset.sum X (fun x => w x y) ≤ 1) → X.card ≤ Y.card
  )
