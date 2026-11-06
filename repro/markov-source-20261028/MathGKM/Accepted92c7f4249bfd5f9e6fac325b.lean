import MathGKM.Targetfe3fd45532dd3e4d584c3b70
import MathGKM.Round61FiniteA
import Lean
def Accepted92c7f4249bfd5f9e6fac325b.interface : MathGKM.Targetfe3fd45532dd3e4d584c3b70.Interface :=
  (
    True.intro
  )
theorem Accepted92c7f4249bfd5f9e6fac325b.transport : MathGKM.Targetfe3fd45532dd3e4d584c3b70.Transport Accepted92c7f4249bfd5f9e6fac325b.interface :=
  (
    True.intro
  )
theorem Accepted92c7f4249bfd5f9e6fac325b.obligation : MathGKM.Targetfe3fd45532dd3e4d584c3b70.Goal Accepted92c7f4249bfd5f9e6fac325b.interface :=
  (
    by
      refine ⟨FiniteMatchingR61.cardinality, ?_, ?_⟩
      · exact FiniteMatchingR61.deletion_partition
      · intro R _ t c
        exact FiniteMatchingR61.boundaries t c
  )
