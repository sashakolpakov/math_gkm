import MarkovShiftPartsF2
/-! Machine-authored f2da221d. Split exact first-shift gap. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false

def shiftGapPart7F2 (N C : ℤ) : ℤ :=
 3764334848583859200 + 729177238753689600*C + 7895432856997728000*N + 1548836895229505280*N*C + 7583113313149215744*N^2 + 1507752033531899904*N^2*C + 4393095327739566336*N^3 + 886451534188550400*N^3*C + 1706252260877893120*N^4 + 349870331634242048*N^4*C + 467630123137820160*N^5 + 97561683447836160*N^5*C + 92713866494423552*N^6 + 19701362180910592*N^6*C + 13401121784375808*N^7 + 2903042302917120*N^7*C + 1402220063650560*N^8 + 309889208504064*N^8*C + 103646158909440*N^9 + 23382138716160*N^9*C + 5140841371904*N^10 + 1184490114304*N^10*C + 153749600256*N^11 + 36198113280*N^11*C + 2098539520*N^12 + 505100288*N^12*C

theorem shiftGapPart_identity7F2 (N C : ℤ) :
 (shiftPart13F2 N C*shiftPart14F2 N C-shiftPart03F2 N C*shiftPart24F2 N C) + (shiftPart14F2 N C*shiftPart13F2 N C-shiftPart04F2 N C*shiftPart23F2 N C)=shiftGapPart7F2 N C := by
 simp only [shiftPart03F2,shiftPart04F2,shiftPart13F2,shiftPart14F2,shiftPart23F2,shiftPart24F2,shiftGapPart7F2]
 ring

theorem shiftGapPart_nonneg7F2 (N C : ℤ) (hN : 0≤N) (hC : 0≤C) :
 0≤shiftGapPart7F2 N C := by unfold shiftGapPart7F2; positivity
end
end MathGKM.Markov
