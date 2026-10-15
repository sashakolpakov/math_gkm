import MarkovFullPartsFA
/-! Machine-authored fa9eb434. Exact algebraic source bridge; no LC claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
theorem fullSplitSecondFA {A : Type*} [CommRing A] (N Z C R Q T U x : A) :
 secondNumBC N Z C R Q x=(partS0FA N C R Q T U x) + Z*(partS1FA N C R Q T U x) + Z^2*(partS2FA N C R Q T U x) := by
 unfold secondNumBC partS0FA partS1FA partS2FA
 ring
end
end MathGKM.Markov
