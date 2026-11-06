import MathGKM.Round38SeparatorInterfaceA
import MathGKM.Markov
def MathGKM.Targetc8c7b5309b5ab95e946a545d.Interface :=
  (
    True
  )
def MathGKM.Targetc8c7b5309b5ab95e946a545d.Transport (StudyInterface : MathGKM.Targetc8c7b5309b5ab95e946a545d.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetc8c7b5309b5ab95e946a545d.Goal (StudyInterface : MathGKM.Targetc8c7b5309b5ab95e946a545d.Interface) : Prop :=
  (
    (MathGKM.Markov.InPolygon 4 5 4 0 ∧ MathGKM.Markov.InPolygon 4 5 4 1 ∧ MathGKM.Markov.InPolygon 4 5 4 2 ∧
        MathGKM.Markov.coeff (RightR30.M 3) 4 0=1 ∧ MathGKM.Markov.coeff (RightR30.M 3) 4 1=11 ∧
        MathGKM.Markov.coeff (RightR30.M 3) 4 2=63 ∧
        MathGKM.Markov.coeff (RightR30.G 3) 4 0=0 ∧ MathGKM.Markov.coeff (RightR30.G 3) 4 1=3 ∧
        MathGKM.Markov.coeff (RightR30.G 3) 4 2=37 ∧
        MathGKM.Markov.coeff (RightR30.M 3) 4 0*MathGKM.Markov.coeff (RightR30.G 3) 4 2 >
          MathGKM.Markov.coeff (RightR30.M 3) 4 1*MathGKM.Markov.coeff (RightR30.G 3) 4 1 ∧
        MathGKM.Markov.coeff (RightR30.M 3) 4 1^2-MathGKM.Markov.coeff (RightR30.M 3) 4 0*MathGKM.Markov.coeff (RightR30.M 3) 4 2=58 ∧
        MathGKM.Markov.coeff (RightR30.G 3) 4 1^2-MathGKM.Markov.coeff (RightR30.G 3) 4 0*MathGKM.Markov.coeff (RightR30.G 3) 4 2=9) ∧
      ((MathGKM.Markov.frame (List.replicate 3 true)).mid.a=4 ∧
       (MathGKM.Markov.frame (List.replicate 3 true)).mid.b=5) ∧
      StateCrossR38.zcoeff (RightR30.M 3) 4 0*StateCrossR38.zcoeff (RightR30.G 3) 4 2 >
        StateCrossR38.zcoeff (RightR30.M 3) 4 1*StateCrossR38.zcoeff (RightR30.G 3) 4 1
  )
