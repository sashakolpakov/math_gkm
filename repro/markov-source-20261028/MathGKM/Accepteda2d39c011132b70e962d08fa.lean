import MathGKM.Targetb360ac31da9a17c6a94c01d8
import MathGKM.Round50HorizontalA
import Lean
def Accepteda2d39c011132b70e962d08fa.interface : MathGKM.Targetb360ac31da9a17c6a94c01d8.Interface :=
  (
    True.intro
  )
theorem Accepteda2d39c011132b70e962d08fa.transport : MathGKM.Targetb360ac31da9a17c6a94c01d8.Transport Accepteda2d39c011132b70e962d08fa.interface :=
  (
    True.intro
  )
theorem Accepteda2d39c011132b70e962d08fa.obligation : MathGKM.Targetb360ac31da9a17c6a94c01d8.Goal Accepteda2d39c011132b70e962d08fa.interface :=
  (
    by
      intro n hn
      exact ⟨fun r => HorizontalRowR50.coefficient_formula n r hn,
        fun i hi => HorizontalRowR50.prefix_zero n i hn hi⟩
  )
