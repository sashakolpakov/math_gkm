import MarkovFullPartsFA
/-! Machine-authored fa9eb434. Exact algebraic source bridge; no LC claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
theorem fullSplitFirstFA {A : Type*} [CommRing A] (N Z C R Q T U x : A) :
 firstNumBC N Z C R Q x=(partF0FA N C R Q T U x) + Z*(partF1FA N C R Q T U x) := by
 unfold firstNumBC partF0FA partF1FA
 ring
end
end MathGKM.Markov
