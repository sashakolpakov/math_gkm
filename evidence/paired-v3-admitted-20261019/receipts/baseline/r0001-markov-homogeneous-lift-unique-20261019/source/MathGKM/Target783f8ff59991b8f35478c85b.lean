import MathGKM.MarkovLiftUniqueR0001
import MathGKM.Markov
def MathGKM.Target783f8ff59991b8f35478c85b.Interface :=
  (
    True
  )
def MathGKM.Target783f8ff59991b8f35478c85b.Transport (StudyInterface : MathGKM.Target783f8ff59991b8f35478c85b.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target783f8ff59991b8f35478c85b.Goal (StudyInterface : MathGKM.Target783f8ff59991b8f35478c85b.Interface) : Prop :=
  (
    ∀ (P : MathGKM.Markov.BiPoly) (d : ℕ) (T : MathGKM.Markov.TriPoly), MathGKM.Markov.HomogeneousAt T d → MathGKM.Markov.specializeW T = P → T = MathGKM.Markov.liftHomogeneous P d
  )
