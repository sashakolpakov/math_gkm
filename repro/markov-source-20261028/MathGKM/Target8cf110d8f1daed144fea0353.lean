import MathGKM.Round48RecoveryA
import MathGKM.Markov
def MathGKM.Target8cf110d8f1daed144fea0353.Interface :=
  (
    True
  )
def MathGKM.Target8cf110d8f1daed144fea0353.Transport (StudyInterface : MathGKM.Target8cf110d8f1daed144fea0353.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target8cf110d8f1daed144fea0353.Goal (StudyInterface : MathGKM.Target8cf110d8f1daed144fea0353.Interface) : Prop :=
  (
    let P := (MathGKM.Markov.frame (List.replicate 31 true)).mid.p;
        MathGKM.Markov.coeff P 0 34=31 ∧ MathGKM.Markov.coeff P 1 34=4530 ∧ MathGKM.Markov.coeff P 2 34=343070 ∧
        MathGKM.Markov.coeff P 1 34^2-MathGKM.Markov.coeff P 0 34*MathGKM.Markov.coeff P 2 34=9885730 ∧
        MathGKM.Markov.coeff P 0 34*MathGKM.Markov.coeff P 2 34 < MathGKM.Markov.coeff P 1 34^2
  )
