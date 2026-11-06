import MathGKM.Round46SumsA
import MathGKM.Markov
def MathGKM.Target26a5b79c2a831e0957419755.Interface :=
  (
    True
  )
def MathGKM.Target26a5b79c2a831e0957419755.Transport (StudyInterface : MathGKM.Target26a5b79c2a831e0957419755.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target26a5b79c2a831e0957419755.Goal (StudyInterface : MathGKM.Target26a5b79c2a831e0957419755.Interface) : Prop :=
  (
    ∀ n i j l : ℕ, 1 ≤ n →
        MathGKM.Markov.InPolygon n (n+1) i j →
        MathGKM.Markov.InPolygon n (n+1) (i+1) j →
        MathGKM.Markov.InPolygon n (n+1) (i+2) j →
        GroupedR40.group n i j 1 0 l = HorizontalR46.complete n (i+j-n) j l
  )
