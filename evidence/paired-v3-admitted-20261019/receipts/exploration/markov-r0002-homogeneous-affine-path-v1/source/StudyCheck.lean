import MathGKM.Targetcdf1626fa058b609948d2a02
import MathGKM.MarkovHomogeneousSource
import Lean
def StudyInterface : MathGKM.Targetcdf1626fa058b609948d2a02.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Targetcdf1626fa058b609948d2a02.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Targetcdf1626fa058b609948d2a02.Goal StudyInterface :=
  (
    MathGKM.Markov.homogeneous_source_path_eval
  )
