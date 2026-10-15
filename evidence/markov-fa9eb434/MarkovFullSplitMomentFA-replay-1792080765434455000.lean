import MarkovFullPartsFA
import MarkovFullFourBaseFA
/-! Machine-authored fa9eb434. Exact algebraic source bridge; no LC claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
theorem fullSplitMomentFA {A : Type*} [CommRing A] (N Z C R Q T U x : A) :
 fullFourBaseFA N Z C R Q T U x=(partM0FA N C R Q T U x) + Z*(partM1FA N C R Q T U x) + Z^2*(partM2FA N C R Q T U x) + Z^3*(partM3FA N C R Q T U x) + Z^4*(partM4FA N C R Q T U x) := by
 unfold fullFourBaseFA partM0FA partM1FA partM2FA partM3FA partM4FA
 ring
end
end MathGKM.Markov
