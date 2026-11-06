import MathGKM.Round41AntidiagonalA
import MathGKM.Markov
def MathGKM.Target910f74e9a21d6be4172706f8.Interface :=
  (
    True
  )
def MathGKM.Target910f74e9a21d6be4172706f8.Transport (StudyInterface : MathGKM.Target910f74e9a21d6be4172706f8.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target910f74e9a21d6be4172706f8.Goal (StudyInterface : MathGKM.Target910f74e9a21d6be4172706f8.Interface) : Prop :=
  (
    (∀ (n i j dx dy l : ℕ),
    GroupedR40.group n i j dx dy l =
        ∑ s ∈ Finset.range (n+1),
          if s ≤ l ∧ l-s ≤ n then
            MidpointR36.W n (i+dx) (j+dy) s * MidpointR36.W n (i+dx) (j+dy) (l-s) -
            MidpointR36.W n i j s * MidpointR36.W n (i+2*dx) (j+2*dy) (l-s)
          else 0) ∧
    (∀ (n i j dx dy l : ℕ),
    2 * GroupedR40.group n i j dx dy l =
        ∑ s ∈ Finset.range (n+1),
          if s ≤ l ∧ l-s ≤ n then
            2 * (MidpointR36.W n (i+dx) (j+dy) s * MidpointR36.W n (i+dx) (j+dy) (l-s)) -
            MidpointR36.W n i j s * MidpointR36.W n (i+2*dx) (j+2*dy) (l-s) -
            MidpointR36.W n i j (l-s) * MidpointR36.W n (i+2*dx) (j+2*dy) s
          else 0)
  )
