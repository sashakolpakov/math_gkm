import MathGKM.MarkovFamilyAgreement
import MathGKM.Markov
def MathGKM.Targeta4139f851864bb5782078c36.Interface :=
  (
    True
  )
def MathGKM.Targeta4139f851864bb5782078c36.Transport (StudyInterface : MathGKM.Targeta4139f851864bb5782078c36.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targeta4139f851864bb5782078c36.Goal (StudyInterface : MathGKM.Targeta4139f851864bb5782078c36.Interface) : Prop :=
  (
    ∀ (K : Type) [Field K] (x y : K) (M : ℕ → ℕ → K), MathGKM.Markov.AffineLaurentFamily x y M → ∀ path : List Bool,
        M (MathGKM.Markov.frame path).lo.a (MathGKM.Markov.frame path).lo.b = (MathGKM.Markov.affineLaurentFrame x y path).lo ∧
        M (MathGKM.Markov.frame path).mid.a (MathGKM.Markov.frame path).mid.b = (MathGKM.Markov.affineLaurentFrame x y path).mid ∧
        M (MathGKM.Markov.frame path).hi.a (MathGKM.Markov.frame path).hi.b = (MathGKM.Markov.affineLaurentFrame x y path).hi
  )
