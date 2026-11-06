import MathGKM.Round87OriginalA
import MathGKM.Markov
def MathGKM.Target64c3b68e036a0cf425d9ac08.Interface :=
  (
    True
  )
def MathGKM.Target64c3b68e036a0cf425d9ac08.Transport (StudyInterface : MathGKM.Target64c3b68e036a0cf425d9ac08.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target64c3b68e036a0cf425d9ac08.Goal (StudyInterface : MathGKM.Target64c3b68e036a0cf425d9ac08.Interface) : Prop :=
  (
    let E := (MathGKM.Markov.frame (List.replicate 4 true)).mid;
        E.a=5 ∧ E.b=6 ∧
        MathGKM.Markov.InPolygon E.a E.b 5 1 ∧ MathGKM.Markov.InPolygon E.a E.b 5 2 ∧ MathGKM.Markov.InPolygon E.a E.b 5 3 ∧
        MathGKM.Markov.coeff E.p 5 1=14 ∧ MathGKM.Markov.coeff E.p 5 2=117 ∧ MathGKM.Markov.coeff E.p 5 3=416 ∧
        MathGKM.Markov.coeff E.p 5 2^2-MathGKM.Markov.coeff E.p 5 1*MathGKM.Markov.coeff E.p 5 3=7865 ∧
        MathGKM.Markov.coeff E.p 5 1*MathGKM.Markov.coeff E.p 5 3<MathGKM.Markov.coeff E.p 5 2^2
  )
