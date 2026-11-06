import MathGKM.Target6efa2336e6adbe33b61920a2
import MathGKM.Round48MidpointA
import Lean
def Accepted62a323ed605941fc5986d232.interface : MathGKM.Target6efa2336e6adbe33b61920a2.Interface :=
  (
    True.intro
  )
theorem Accepted62a323ed605941fc5986d232.transport : MathGKM.Target6efa2336e6adbe33b61920a2.Transport Accepted62a323ed605941fc5986d232.interface :=
  (
    True.intro
  )
theorem Accepted62a323ed605941fc5986d232.obligation : MathGKM.Target6efa2336e6adbe33b61920a2.Goal Accepted62a323ed605941fc5986d232.interface :=
  (
    by
      intro a b ha hb x s t
      exact OrientedR48.separable_diagonal a b ha hb x s t
  )
