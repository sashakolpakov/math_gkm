import MathGKM.MarkovHomogeneousSource
import MathGKM.Markov
def MathGKM.Targetcdf1626fa058b609948d2a02.Interface :=
  (
    True
  )
def MathGKM.Targetcdf1626fa058b609948d2a02.Transport (StudyInterface : MathGKM.Targetcdf1626fa058b609948d2a02.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetcdf1626fa058b609948d2a02.Goal (StudyInterface : MathGKM.Targetcdf1626fa058b609948d2a02.Interface) : Prop :=
  (
    ∀ path : List Bool, let m := (MathGKM.Markov.frame path).mid; (MathGKM.Markov.homogeneousLift m.p (m.a+m.b-1)).eval₂ MathGKM.Markov.squareEmbedding 1 = MathGKM.Markov.affineDen MathGKM.Markov.affineX MathGKM.Markov.affineY m.a m.b * (MathGKM.Markov.affineLaurentFrame MathGKM.Markov.affineX MathGKM.Markov.affineY path).mid
  )
