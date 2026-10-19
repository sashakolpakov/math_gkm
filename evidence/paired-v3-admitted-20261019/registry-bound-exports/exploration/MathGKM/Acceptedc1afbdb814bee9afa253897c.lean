import MathGKM.Targetcdf1626fa058b609948d2a02
import MathGKM.MarkovHomogeneousSource
import Lean
def Acceptedc1afbdb814bee9afa253897c.interface : MathGKM.Targetcdf1626fa058b609948d2a02.Interface :=
  (
    True.intro
  )
theorem Acceptedc1afbdb814bee9afa253897c.transport : MathGKM.Targetcdf1626fa058b609948d2a02.Transport Acceptedc1afbdb814bee9afa253897c.interface :=
  (
    True.intro
  )
theorem Acceptedc1afbdb814bee9afa253897c.obligation : MathGKM.Targetcdf1626fa058b609948d2a02.Goal Acceptedc1afbdb814bee9afa253897c.interface :=
  (
    MathGKM.Markov.homogeneous_source_path_eval
  )
