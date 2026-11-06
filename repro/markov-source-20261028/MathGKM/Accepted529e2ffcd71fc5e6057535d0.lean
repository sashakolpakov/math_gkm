import MathGKM.Target6aa2c19a263f7b7d489494b1
import MathGKM.Round73EncodingA
import Lean
def Accepted529e2ffcd71fc5e6057535d0.interface : MathGKM.Target6aa2c19a263f7b7d489494b1.Interface :=
  (
    True.intro
  )
theorem Accepted529e2ffcd71fc5e6057535d0.transport : MathGKM.Target6aa2c19a263f7b7d489494b1.Transport Accepted529e2ffcd71fc5e6057535d0.interface :=
  (
    True.intro
  )
theorem Accepted529e2ffcd71fc5e6057535d0.obligation : MathGKM.Target6aa2c19a263f7b7d489494b1.Goal Accepted529e2ffcd71fc5e6057535d0.interface :=
  (
    fun N sigma i j => ⟨KernelEncodingR73.evaluation N sigma i j, KernelEncodingR73.support N sigma i j, KernelEncodingR73.mass N sigma i j⟩
  )
