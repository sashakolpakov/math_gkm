import MarkovNormalPartsFDDA
/-! Machine-authored live fddabb33. Exact algebraic normalization;
all generated identities are checked by Lean, not inferred from tests. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
theorem part_band_3FDDA (N c r q t u x : RunFieldBDEE) :
 3*(partFirst1FDDA N c r q t u x)*(partSecond2FDDA N c r q t u x)-2*(partFirst1FDDA N c r q t u x)^3+partMoment3FDDA N c r q t u x=normalBand3FDDA N c r q t u x := by
 unfold normalBand3FDDA normalTail3FDDA partFirst1FDDA partSecond2FDDA partMoment3FDDA
 ring
end
end MathGKM.Markov
