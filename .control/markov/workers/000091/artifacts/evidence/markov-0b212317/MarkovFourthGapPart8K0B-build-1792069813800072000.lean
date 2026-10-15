import MarkovFourthPartsK0B
/-! Machine-authored request 0b212317. Quartic decomposition for exact gap certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def fourthGapPart8K0B (C J : ℤ) : ℤ :=
 136559001600 + 134391398400*J + 51480576000*J^2 + 8670412800*J^3 + 541900800*J^4

theorem fourthGapPart8_eqK0B (C J : ℤ) :
 fourthGapPart8K0B C J=(shapePart14K0B C J*shapePart14K0B C J-shapePart04K0B C J*shapePart24K0B C J) := by
 unfold fourthGapPart8K0B shapePart00K0B shapePart01K0B shapePart02K0B shapePart03K0B shapePart04K0B shapePart10K0B shapePart11K0B shapePart12K0B shapePart13K0B shapePart14K0B shapePart20K0B shapePart21K0B shapePart22K0B shapePart23K0B shapePart24K0B
 ring

theorem fourthGapPart8_nonnegK0B (C J : ℤ) (hC : 0≤C) (hJ : 0≤J) :
 0≤fourthGapPart8K0B C J := by
 unfold fourthGapPart8K0B
 positivity
end
end MathGKM.Markov
