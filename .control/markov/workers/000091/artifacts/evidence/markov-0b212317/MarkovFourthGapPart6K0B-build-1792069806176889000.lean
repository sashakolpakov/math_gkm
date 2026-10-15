import MarkovFourthPartsK0B
/-! Machine-authored request 0b212317. Quartic decomposition for exact gap certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def fourthGapPart6K0B (C J : ℤ) : ℤ :=
 253772144640000 + 312202490019840*J + 158869346549760*J^2 + 40943856844800*J^3 + 5550870528000*J^4 + 372394229760*J^5 + 9826467840*J^6 + 340756977254400*C + 423399667138560*C*J + 219321415434240*C*J^2 + 58687314739200*C*J^3 + 8454375014400*C*J^4 + 616574730240*C*J^5 + 17629839360*C*J^6 + 115389104947200*C^2 + 145074647531520*C^2*J + 76667547156480*C^2*J^2 + 21324338380800*C^2*J^3 + 3269468160000*C^2*J^4 + 261521326080*C^2*J^5 + 8525905920*C^2*J^6

theorem fourthGapPart6_eqK0B (C J : ℤ) :
 fourthGapPart6K0B C J=(shapePart12K0B C J*shapePart14K0B C J-shapePart02K0B C J*shapePart24K0B C J) + (shapePart13K0B C J*shapePart13K0B C J-shapePart03K0B C J*shapePart23K0B C J) + (shapePart14K0B C J*shapePart12K0B C J-shapePart04K0B C J*shapePart22K0B C J) := by
 unfold fourthGapPart6K0B shapePart00K0B shapePart01K0B shapePart02K0B shapePart03K0B shapePart04K0B shapePart10K0B shapePart11K0B shapePart12K0B shapePart13K0B shapePart14K0B shapePart20K0B shapePart21K0B shapePart22K0B shapePart23K0B shapePart24K0B
 ring

theorem fourthGapPart6_nonnegK0B (C J : ℤ) (hC : 0≤C) (hJ : 0≤J) :
 0≤fourthGapPart6K0B C J := by
 unfold fourthGapPart6K0B
 positivity
end
end MathGKM.Markov
