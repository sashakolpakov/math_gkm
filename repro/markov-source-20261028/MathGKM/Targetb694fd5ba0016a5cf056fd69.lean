import MathGKM.Round84ActualA
import MathGKM.Markov
def MathGKM.Targetb694fd5ba0016a5cf056fd69.Interface :=
  (
    True
  )
def MathGKM.Targetb694fd5ba0016a5cf056fd69.Transport (StudyInterface : MathGKM.Targetb694fd5ba0016a5cf056fd69.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetb694fd5ba0016a5cf056fd69.Goal (StudyInterface : MathGKM.Targetb694fd5ba0016a5cf056fd69.Interface) : Prop :=
  (
    ∀ (n : ℕ), 1≤n →
        (∀ sigma, sigma≤1 → ∀ j L a b, ReciprocalActualR84.RankFactors (2*n) sigma j L a b) →
        let E := (MathGKM.Markov.frame (List.replicate (n-1) true)).mid
        MathGKM.Markov.WeakLC E.a E.b E.p
  )
