import MarkovFourthPartsK0B
/-! Machine-authored request 0b212317. Quartic decomposition for exact gap certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def fourthGapPart5K0B (C J : ℤ) : ℤ :=
 4326871965696000 + 5866818672476160*J + 3363221911633920*J^2 + 1018834413649920*J^3 + 174379342233600*J^4 + 16867637821440*J^5 + 863573114880*J^6 + 18207866880*J^7 + 8565627609907200*C + 11704957732823040*C*J + 6801205107916800*C*J^2 + 2116860909649920*C*J^3 + 377584555622400*C*J^4 + 38490780303360*C*J^5 + 2080899072000*C*J^6 + 46386708480*C*J^7 + 5681468982067200*C^2 + 7836758895329280*C^2*J + 4623914238935040*C^2*J^2 + 1480526850539520*C^2*J^3 + 275625920102400*C^2*J^4 + 29737023160320*C^2*J^5 + 1718475816960*C^2*J^6 + 40967700480*C^2*J^7 + 1263821045760000*C^3 + 1762435622707200*C^3*J + 1057812687912960*C^3*J^2 + 348811465605120*C^3*J^3 + 67857901977600*C^3*J^4 + 7775734579200*C^3*J^5 + 485976637440*C^3*J^6 + 12788858880*C^3*J^7

theorem fourthGapPart5_eqK0B (C J : ℤ) :
 fourthGapPart5K0B C J=(shapePart11K0B C J*shapePart14K0B C J-shapePart01K0B C J*shapePart24K0B C J) + (shapePart12K0B C J*shapePart13K0B C J-shapePart02K0B C J*shapePart23K0B C J) + (shapePart13K0B C J*shapePart12K0B C J-shapePart03K0B C J*shapePart22K0B C J) + (shapePart14K0B C J*shapePart11K0B C J-shapePart04K0B C J*shapePart21K0B C J) := by
 simp only [fourthGapPart5K0B,shapePart00K0B,shapePart01K0B,shapePart02K0B,shapePart03K0B,shapePart04K0B,shapePart10K0B,shapePart11K0B,shapePart12K0B,shapePart13K0B,shapePart14K0B,shapePart20K0B,shapePart21K0B,shapePart22K0B,shapePart23K0B,shapePart24K0B]
 ring

theorem fourthGapPart5_nonnegK0B (C J : ℤ) (hC : 0≤C) (hJ : 0≤J) :
 0≤fourthGapPart5K0B C J := by
 unfold fourthGapPart5K0B
 positivity
end
end MathGKM.Markov
