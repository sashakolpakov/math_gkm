import MarkovFullPartsFA
import MarkovFullThirdMomentFA
/-! Machine-authored fa9eb434. Exact algebraic source bridge; no LC claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
theorem fullSplitThirdFA {A : Type*} [CommRing A] (N Z C R Q T U x : A) :
 fullThirdMomentFA N Z C R Q T U x=(partT0FA N C R Q T U x) + Z*(partT1FA N C R Q T U x) + Z^2*(partT2FA N C R Q T U x) + Z^3*(partT3FA N C R Q T U x) := by
 unfold fullThirdMomentFA partT0FA partT1FA partT2FA partT3FA
 ring
end
end MathGKM.Markov
