import MathGKM.Round39StencilA
import MathGKM.Acceptedcf0c2699dba403330d606eae

/-! Machine-authored round39, only the prospectively specified nonreachable
control. This is a missing sufficient premise, not an actual-family witness. -/
namespace ShiftedR39
open MathGKM.Markov StateCrossR38
noncomputable section

theorem control_missing : CoordinateInputs 1 auxB ∧
    f 1 auxB 0 2 1 0 2 0 * f 1 auxB 0 2 1 0 4 2 = 1 ∧
    f 1 auxB 0 2 1 0 2 1 * f 1 auxB 0 2 1 0 4 1 = 0 ∧
    ¬ Cross (f 1 auxB 0 2 1 0 2) (f 1 auxB 0 2 1 0 4) := by
  have he : f 1 auxB 0 2 1 0 2 0 * f 1 auxB 0 2 1 0 4 2 = 1 := by
    change zcoeff 1 0 0 * zcoeff auxB 2 1 = 1
    norm_num [z_one,z_auxB,point]
  have hm : f 1 auxB 0 2 1 0 2 1 * f 1 auxB 0 2 1 0 4 1 = 0 := by
    change zcoeff 1 1 0 * zcoeff auxB 1 1 = 0
    norm_num [z_one,z_auxB,point]
  refine ⟨Acceptedcf0c2699dba403330d606eae.obligation.1,he,hm,?_⟩
  intro h
  have hh := (h 0).1
  change f 1 auxB 0 2 1 0 2 0 * f 1 auxB 0 2 1 0 4 2 ≤
    f 1 auxB 0 2 1 0 2 1 * f 1 auxB 0 2 1 0 4 1 at hh
  rw [he,hm] at hh
  norm_num at hh

end
end ShiftedR39
