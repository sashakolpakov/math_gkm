import MathGKM.Targetf94ffa6a371ff1716adf2f9a
import MathGKM.Round92PolarisationA
import Lean
def Accepted3d0e4c4749b275fe22faf50e.interface : MathGKM.Targetf94ffa6a371ff1716adf2f9a.Interface :=
  (
    True.intro
  )
theorem Accepted3d0e4c4749b275fe22faf50e.transport : MathGKM.Targetf94ffa6a371ff1716adf2f9a.Transport Accepted3d0e4c4749b275fe22faf50e.interface :=
  (
    True.intro
  )
theorem Accepted3d0e4c4749b275fe22faf50e.obligation : MathGKM.Targetf94ffa6a371ff1716adf2f9a.Goal Accepted3d0e4c4749b275fe22faf50e.interface :=
  (
    by exact ⟨BoundaryPolarisationR92.P_coeff, BoundaryPolarisationR92.bulk_coeff, BoundaryPolarisationR92.end_coeff, BoundaryPolarisationR92.actual_coeff, BoundaryPolarisationR92.actual_card⟩
  )
