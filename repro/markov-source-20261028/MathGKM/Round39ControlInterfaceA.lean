import MathGKM.Round39ControlA

/-! Machine-authored exact missing neighboring-slice relation, round39. -/
namespace Round39ControlInterfaceA
open StateCrossR38 ShiftedR39
theorem checked : CoordinateInputs 1 auxB ∧
    f 1 auxB 0 2 1 0 2 0 * f 1 auxB 0 2 1 0 4 2 = 1 ∧
    f 1 auxB 0 2 1 0 2 1 * f 1 auxB 0 2 1 0 4 1 = 0 ∧
    ¬ Cross (f 1 auxB 0 2 1 0 2) (f 1 auxB 0 2 1 0 4) :=
  ShiftedR39.control_missing
end Round39ControlInterfaceA
#print axioms Round39ControlInterfaceA.checked
