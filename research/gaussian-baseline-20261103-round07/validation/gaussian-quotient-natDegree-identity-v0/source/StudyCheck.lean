import MathGKM.Targetc5defead8ce4af92c2089d6e
import MathGKM.IndexNormalization
import Lean
def StudyInterface : MathGKM.Targetc5defead8ce4af92c2089d6e.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Targetc5defead8ce4af92c2089d6e.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Targetc5defead8ce4af92c2089d6e.Goal StudyInterface :=
  (
    MathGKM.GaussianQuotient.IndexNormalization.quotient_degree
  )
