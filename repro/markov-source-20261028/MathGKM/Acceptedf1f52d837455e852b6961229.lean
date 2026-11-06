import MathGKM.Targetf7fbf4722d234fc874ce000f
import MathGKM.Round92LinearTransportA
import Lean
def Acceptedf1f52d837455e852b6961229.interface : MathGKM.Targetf7fbf4722d234fc874ce000f.Interface :=
  (
    True.intro
  )
theorem Acceptedf1f52d837455e852b6961229.transport : MathGKM.Targetf7fbf4722d234fc874ce000f.Transport Acceptedf1f52d837455e852b6961229.interface :=
  (
    True.intro
  )
theorem Acceptedf1f52d837455e852b6961229.obligation : MathGKM.Targetf7fbf4722d234fc874ce000f.Goal Acceptedf1f52d837455e852b6961229.interface :=
  (
    by exact ⟨BoundaryPolarisationR92.nonnegative_combination, BoundaryPolarisationR92.polar_symmetry, BoundaryPolarisationR92.conditional_central⟩
  )
