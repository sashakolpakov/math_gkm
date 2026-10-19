import MathGKM.Targeta4139f851864bb5782078c36
import MathGKM.MarkovFamilyAgreement
import Lean
def StudyInterface : MathGKM.Targeta4139f851864bb5782078c36.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Targeta4139f851864bb5782078c36.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Targeta4139f851864bb5782078c36.Goal StudyInterface :=
  (
    @MathGKM.Markov.laurent_family_agreement
  )
