import MathGKM.Round46ReverseA
import MathGKM.Markov
def MathGKM.Targetbdd3bceff5ee1b5c9a514ecf.Interface :=
  (
    True
  )
def MathGKM.Targetbdd3bceff5ee1b5c9a514ecf.Transport (StudyInterface : MathGKM.Targetbdd3bceff5ee1b5c9a514ecf.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetbdd3bceff5ee1b5c9a514ecf.Goal (StudyInterface : MathGKM.Targetbdd3bceff5ee1b5c9a514ecf.Interface) : Prop :=
  (
    ∀ n h i j s : ℕ, 1 ≤ n → h ≤ n → i+j=n+h →
        MidpointR36.W n i j s = if s ≤ n-h then HorizontalR46.F n h j (n-h-s) else 0
  )
