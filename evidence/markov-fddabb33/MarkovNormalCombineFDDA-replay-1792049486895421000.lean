import MarkovNormalBandProof0FDDA
import MarkovNormalBandProof1FDDA
import MarkovNormalBandProof2FDDA
import MarkovNormalBandProof3FDDA
/-! Machine-authored live fddabb33. Exact algebraic normalization;
all generated identities are checked by Lean, not inferred from tests. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
theorem normal_combineFDDA (N Z c r q t u x : RunFieldBDEE) :
 3*normalFirstNumFDDA N Z c r x*normalSecondNumFDDA N Z c r q x-
 2*(normalFirstNumFDDA N Z c r x)^3-2*(1-x)^6*(1+x)^3+
 boolMomentADB2 (normalLocalFDDA N Z x) c r q t u =
 normalBand0FDDA N c r q t u x+Z*normalBand1FDDA N c r q t u x+
 Z^2*normalBand2FDDA N c r q t u x+Z^3*normalBand3FDDA N c r q t u x := by
 rw [part_firstFDDA N Z c r q t u x,part_secondFDDA N Z c r q t u x,part_momentFDDA]
 rw [←part_band_0FDDA]
 rw [←part_band_1FDDA]
 rw [←part_band_2FDDA]
 rw [←part_band_3FDDA]
 ring
end
end MathGKM.Markov
