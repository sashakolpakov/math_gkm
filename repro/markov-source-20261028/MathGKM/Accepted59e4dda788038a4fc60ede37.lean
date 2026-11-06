import MathGKM.Target787de56168027ddcd926626c
import MathGKM.Round32TransportA
import Lean
def Accepted59e4dda788038a4fc60ede37.interface : MathGKM.Target787de56168027ddcd926626c.Interface :=
  (
    True.intro
  )
theorem Accepted59e4dda788038a4fc60ede37.transport : MathGKM.Target787de56168027ddcd926626c.Transport Accepted59e4dda788038a4fc60ede37.interface :=
  (
    True.intro
  )
theorem Accepted59e4dda788038a4fc60ede37.obligation : MathGKM.Target787de56168027ddcd926626c.Goal Accepted59e4dda788038a4fc60ede37.interface :=
  (
    by
      intro n h hh hn
      rcases SmoothingR32.residual_cone n h hh hn with ⟨he,hpos,hint,hlc⟩
      exact ⟨he,⟨hpos,hlc,hint⟩,SmoothingR32.residual_integer_cone n h hh hn⟩
  )
