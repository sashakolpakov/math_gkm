import MathGKM.Target33dcf094ff62315c18f4eef1
import MathGKM.Round92SeparatorA
import Lean
def Accepted0e9163fe08578437c4c6ddf4.interface : MathGKM.Target33dcf094ff62315c18f4eef1.Interface :=
  (
    True.intro
  )
theorem Accepted0e9163fe08578437c4c6ddf4.transport : MathGKM.Target33dcf094ff62315c18f4eef1.Transport Accepted0e9163fe08578437c4c6ddf4.interface :=
  (
    True.intro
  )
theorem Accepted0e9163fe08578437c4c6ddf4.obligation : MathGKM.Target33dcf094ff62315c18f4eef1.Goal Accepted0e9163fe08578437c4c6ddf4.interface :=
  (
    by
      have h := BoundaryPolarisationR92.separator
      exact ⟨BoundaryPolarisationR92.class_values, BoundaryPolarisationR92.card_values,
        ⟨h.1,h.2.1,h.2.2.2.2.2.2.1⟩,
        h.2.2.2.2.2.2.2.2.2.1,h.2.2.2.2.2.2.2.2.2.2.1,
        h.2.2.2.2.2.2.2.2.2.2.2⟩
  )
