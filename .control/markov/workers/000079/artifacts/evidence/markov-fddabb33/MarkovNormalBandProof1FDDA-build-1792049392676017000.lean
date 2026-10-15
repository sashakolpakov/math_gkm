import MarkovNormalPartsFDDA
/-! Machine-authored live fddabb33. Exact algebraic normalization;
all generated identities are checked by Lean, not inferred from tests. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
theorem part_band_1FDDA (N c r q t u x : RunFieldBDEE) :
 3*(partFirst0FDDA N c r q t u x)*(partSecond1FDDA N c r q t u x)+3*(partFirst1FDDA N c r q t u x)*(partSecond0FDDA N c r q t u x)-6*(partFirst0FDDA N c r q t u x)^2*(partFirst1FDDA N c r q t u x)+partMoment1FDDA N c r q t u x=normalBand1FDDA N c r q t u x := by
 unfold normalBand1FDDA normalTail1FDDA partFirst0FDDA partFirst1FDDA partSecond0FDDA partSecond1FDDA partMoment1FDDA
 ring
end
end MathGKM.Markov
