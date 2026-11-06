import MathGKM.Round29ArrayA
import MathGKM.Markov
def MathGKM.Targetb4751a7bb54f42529d219cca.Interface :=
  (
    True
  )
def MathGKM.Targetb4751a7bb54f42529d219cca.Transport (StudyInterface : MathGKM.Targetb4751a7bb54f42529d219cca.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetb4751a7bb54f42529d219cca.Goal (StudyInterface : MathGKM.Targetb4751a7bb54f42529d219cca.Interface) : Prop :=
  (
    ∀ b : ℕ, 1 ≤ b →
        (∀ i j, MathGKM.Markov.InPolygon 1 b i j → MathGKM.Markov.InPolygon 1 b (i+1) j →
          MathGKM.Markov.InPolygon 1 b (i+2) j → RenewalR28.mc b i j*RenewalR28.mc b (i+2) j ≤ RenewalR28.mc b (i+1) j^2) ∧
        (∀ i j, MathGKM.Markov.InPolygon 1 b i j → MathGKM.Markov.InPolygon 1 b i (j+1) →
          MathGKM.Markov.InPolygon 1 b i (j+2) → RenewalR28.mc b i j*RenewalR28.mc b i (j+2) ≤ RenewalR28.mc b i (j+1)^2) ∧
        (∀ i j, MathGKM.Markov.InPolygon 1 b i (j+2) → MathGKM.Markov.InPolygon 1 b (i+1) (j+1) →
          MathGKM.Markov.InPolygon 1 b (i+2) j → RenewalR28.mc b i (j+2)*RenewalR28.mc b (i+2) j ≤ RenewalR28.mc b (i+1) (j+1)^2)
  )
