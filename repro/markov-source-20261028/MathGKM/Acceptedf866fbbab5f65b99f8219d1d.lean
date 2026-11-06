import MathGKM.Target2c2e53fd3030c46e72f1fb13
import MathGKM.Round80BinomialA
import Lean
def Acceptedf866fbbab5f65b99f8219d1d.interface : MathGKM.Target2c2e53fd3030c46e72f1fb13.Interface :=
  (
    True.intro
  )
theorem Acceptedf866fbbab5f65b99f8219d1d.transport : MathGKM.Target2c2e53fd3030c46e72f1fb13.Transport Acceptedf866fbbab5f65b99f8219d1d.interface :=
  (
    True.intro
  )
theorem Acceptedf866fbbab5f65b99f8219d1d.obligation : MathGKM.Target2c2e53fd3030c46e72f1fb13.Goal Acceptedf866fbbab5f65b99f8219d1d.interface :=
  (
    by
      intro L gamma H he hn
      exact SymmetricBinomialR80.transport L gamma H he hn
  )
