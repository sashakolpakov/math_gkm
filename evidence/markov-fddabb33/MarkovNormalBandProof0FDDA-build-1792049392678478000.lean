import MarkovNormalPartsFDDA
/-! Machine-authored live fddabb33. Exact algebraic normalization;
all generated identities are checked by Lean, not inferred from tests. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
theorem part_band_0FDDA (N c r q t u x : RunFieldBDEE) :
 3*(partFirst0FDDA N c r q t u x)*(partSecond0FDDA N c r q t u x)-2*(partFirst0FDDA N c r q t u x)^3-2*(1-x)^6*(1+x)^3+partMoment0FDDA N c r q t u x=normalBand0FDDA N c r q t u x := by
 unfold normalBand0FDDA partFirst0FDDA partSecond0FDDA partMoment0FDDA
 ring
end
end MathGKM.Markov
