import MarkovFourthPartsK0B
/-! Machine-authored request 0b212317. Quartic decomposition for exact gap certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def fourthGapPart7K0B (C J : ℤ) : ℤ :=
 8739776102400 + 9667510272000*J + 4304859955200*J^2 + 915812352000*J^3 + 91039334400*J^4 + 3251404800*J^5 + 6008596070400*C + 6732575539200*C*J + 3071493734400*C*J^2 + 690381619200*C*J^3 + 75866112000*C*J^4 + 3251404800*C*J^5

theorem fourthGapPart7_eqK0B (C J : ℤ) :
 fourthGapPart7K0B C J=(shapePart13K0B C J*shapePart14K0B C J-shapePart03K0B C J*shapePart24K0B C J) + (shapePart14K0B C J*shapePart13K0B C J-shapePart04K0B C J*shapePart23K0B C J) := by
 unfold fourthGapPart7K0B shapePart00K0B shapePart01K0B shapePart02K0B shapePart03K0B shapePart04K0B shapePart10K0B shapePart11K0B shapePart12K0B shapePart13K0B shapePart14K0B shapePart20K0B shapePart21K0B shapePart22K0B shapePart23K0B shapePart24K0B
 ring

theorem fourthGapPart7_nonnegK0B (C J : ℤ) (hC : 0≤C) (hJ : 0≤J) :
 0≤fourthGapPart7K0B C J := by
 unfold fourthGapPart7K0B
 positivity
end
end MathGKM.Markov
